<?php


namespace App\Http\Controllers;
use GuzzleHttp\Client;
use App\Models\Order;
use App\Models\Order_p;
use App\Models\Shop;
use App\Models\Cart;
use Illuminate\Http\Request;
use Session;
use PDF;
// use Dompdf\Dompdf;

class OrderController extends Controller
{
    public function index(){
        // $doorsmeer = Doorsmeer::get()->all();        
        $client = new Client();
        $response = $client->request('GET', 'http://127.0.0.1:9010/order/'); //GET
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $order = json_decode($body, true);

        return view('admin.order', compact('order'));
    }

    public function getlistorder(Request $request){
        $data = array();
        $order = Order::select('orders.ID', 'orders.ID_customer', 'orders.nama_customer','orders.alamat','orders.status', 'orders.payment_method','orders.gambar')->get()->toArray();
        
        foreach($order as $row){
            $order_p = Order_p::select('order_ps.total_harga')->where('order_ps.ID_order', $row['ID'])->get()->toArray();
            $row['total'] = 0;
            foreach($order_p as $r){
                $row['total'] += $r['total_harga'];
            }
            $data[] = $row;
        }
        return $data;
    }

    public function pembayaran(Request $request){
        $user = Session::get('set_customerdata')->toArray();

        return view('customer.pembayaran', compact('user'));
    }

    public function checkout(Request $request){

        $post   = $request->post();

        $idorder = date('YmdHis');
 
        $order = new Order;
        $order->id  = $idorder;
        $order->id_customer  = $post['id_customer'];
        $order->nama_customer   = $post['ltn__name'];
        $order->telepon         = $post['ltn__phone'];
        $order->alamat          = $post['alamat'];
        $order->catatan         = $post['ltn__message'];
        $order->payment_method  = $post['payment_method'];
        $order->status          = 1;


        $image = $request->file('foto');
        $name = time().'.'.$image->getClientOriginalExtension();
        $destinationPath = public_path('/images');
        $image->move($destinationPath, $name);
        $order->gambar          = $name;
        $order->save();

        $cart = Cart::select('carts.id', 'carts.id_product','carts.id_customer','quantity','shop.nama','shop.gambar', 'shop.harga')->join('shop', 'carts.id_product','=','shop.id')->where('carts.id_customer', $post['id_customer'])->get()->toArray();

        foreach($cart as $row){
            $order_p = new Order_p;
            $order_p->id_product = $row['id_product'];
            $order_p->id_order   = $idorder;
            $order_p->quantity   = $row['quantity'];
            $order_p->harga      = $row['harga'];
            $order_p->total_harga= $row['quantity']*$row['harga'];
            $order_p->save();

            $cart = Cart::find($row['id']);        
            $cart->delete();
        }
        return redirect('shop')->with('success', 'Berhasil Melakukan pembayaran!');
    }

    public function updatestatus(Request $request, $id){
        $sts    = $request->get('status');

        $data_order = Order::find($id);

       
        if($sts == 2){
            $order_p = Order_p::select('order_ps.id','order_ps.id_product','order_ps.quantity')->where('order_ps.id_order',$id)->get()->toArray();

            foreach($order_p as $row){
                $shop = Shop::find($row['id_product']);
                $shop->stok = $shop->stok - $row['quantity'];
                $shop->update();
            }
            $data_order->status = 2;
            $data_order->update();

            true;

        }else{
            $data_order->status = 3;
            $data_order->update();

            return true;
        }
    }

//     public function downloadPDF($id)
// {
//     $order = Order_p::find($id); // Ganti dengan model dan kolom yang sesuai dengan aplikasi Laravel Anda

//     if (!$order) {
//         abort(404);
//     }

//     $pdf = PDF::loadView('akun', compact('order'));

//     return $pdf->download('order_' . $id . '.pdf');
// }
    public function downloadPDF(Order_p $order_p, $id)
    {
        // Mendapatkan data pesanan berdasarkan ID

        $order = Order_p::findOrFail($id);

        // $order = 
        // dd($order);
        // Membuat objek Dompdf
    
        $html = view('customer.pdf', compact('order'))->render();

        // Menghasilkan view PDF
        $pdf = PDF::loadHTML($html);

        // Mengatur nama file yang akan didownload
        $filename = 'MyOrder' . $order_p->id . '.pdf';

        // Mengirimkan file PDF sebagai respons
        return $pdf->download($filename);
    }
}