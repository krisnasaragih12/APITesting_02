<?php

namespace App\Http\Controllers;

use App\Models\doorsmeer;
use GuzzleHttp\Client;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class DoorsmeerController extends Controller
{
    public function index(){
        // $doorsmeer = Doorsmeer::get()->all();        
        $client = new Client();
        $response = $client->request('GET', 'http://127.0.0.1:9010/doorsmeer/'); //GET
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $doorsmeer = json_decode($body, true);

        return view('admin.doorsmeer', compact('doorsmeer'));
    }

    public function index_addDoorsmeer(){
        return view('customer.doorsmer');
    }
    public function store_doorsmeer(Request $request){  
        // dd($request->all());      
        $request->validate([
            'namalengkap' => 'required',
            'nomortelepon' => 'required',
            'tipekendaraan' => 'required',
            'jenis' => 'required',
            'tanggal' => 'required',
            'waktu' => 'required',
            
        ]);
        $doorsmeer = new Doorsmeer;
        $doorsmeer->namalengkap = $request->namalengkap;
        $doorsmeer->nomortelepon = $request->nomortelepon;
        $doorsmeer->tipekendaraan = $request->tipekendaraan;
        $doorsmeer->jenis = $request->jenis;
        $doorsmeer->tanggal = Carbon::createFromFormat('d/m/Y', Carbon::parse($request->tanggal)->format('d/m/Y'));
        $doorsmeer->waktu = $request->waktu;
        $doorsmeer->save();
        return redirect('doorsmer')->with('success', 'Pembookingan Berhasil!');
    }

    // public function update_status(Request $request, $id)
    // {
    //     $doorsmeer = Doorsmeer::find($id);
    //     $doorsmeer->status = "Disetujui";
    //     $doorsmeer->save();

    //     return response()->json(['message' => 'Doorsmeer status updated.'], 200);
    // }

    public function update_status($id, $status){
    if ($status !== 'Disetujui' && $status !== 'Ditolak') {
        return back()->with('error', 'Status Tidak Berhasil Diperbaharui!');
    }

    $doorsmeer = Doorsmeer::find($id);
    $doorsmeer->status = $status;
    $doorsmeer->save();

    return back()->with('success', 'Status Berhasil Diperbaharui!');
    }

    // public function destroy($id){
    //     $doorsmeer = Doorsmeer::find($id);        
    //     $doorsmeer->delete();

    //     return redirect('/admin/doorsmeer')->with('error', 'Pemesanan Berhasil Dihapus');
    // }
    public function destroy($id){
        $client = new Client();
        $response = $client->request('delete', 'http://127.0.0.1:9010/doorsmeer' . '/' . $id); //DELETE
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $doorsmeer = json_decode($body, true);
        return redirect('/admin/doorsmeer')->with('error', 'Pemesanan Berhasil Dihapus');
    
        // if ($is_admin) {
        //     // jika pengguna adalah admin, redirect ke halaman admin
        // } else {
        //     // jika pengguna bukan admin, redirect ke halaman user
        //     return redirect('/akun')->with('error', 'Pemesanan Berhasil Dihapus');
        // }
    }

}
