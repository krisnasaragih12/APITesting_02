<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Carbon\Carbon;
use App\Models\rental;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RentalController extends Controller
{
    public function index(){
        // $doorsmeer = Doorsmeer::get()->all();        
        $client = new Client();
        $response = $client->request('GET', 'http://127.0.0.1:9010/rental/'); //GET
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $rental = json_decode($body, true);

        return view('admin.rental', compact('rental'));
    }
    
    // public function index(){
    //     $rental = Rental::get()->all();        
    //     return view('admin.rental', compact('rental'));
    // }

    public function index_addRental(){
        return view('customer.rental');
    }
    public function store_rental(Request $request){  
        // dd($request->all());      
        $request->validate([
            'namalengkap' => 'required',
            'alamat' => 'required',
            'nomortelepon' => 'required',
            'tanggalrental' => 'required',
            'tanggalpengembalian' => 'required',
            'type' => 'required',
            
        ]);
        $rental = new Rental;
        $rental->namalengkap = $request->namalengkap;
        $rental->alamat = $request->alamat;
        $rental->nomortelepon = $request->nomortelepon;
        $rental->tanggalrental = $request->tanggalrental;
        $rental->tanggalpengembalian = $request->tanggalpengembalian;
        $rental->type = $request->type;
        $rental->save();
        return redirect('rental')->with('success', 'Pembookingan Berhasil!');
    }

    // public function update_status(Request $request, $id)
    // {
    //     $rental = Rental::find($id);
    //     $rental->status = "Disetujui";
    //     $rental->save();

    //     return response()->json(['message' => 'Rental status updated.'], 200);
    // }

    public function update_status($id, $status){
    if ($status !== 'Disetujui' && $status !== 'Ditolak') {
        return back()->with('error', 'Status Tidak Berhasil Diperbaharui!');
    }

    $rental = Rental::find($id);
    $rental->status = $status;
    $rental->save();

    return back()->with('success', 'Status Berhasil Diperbaharui!');
    }

    // public function destroy($id){
    //     $rental = Rental::find($id);        
    //     $rental->delete();

    //     return redirect('/admin/rental')->with('error', 'Pemesanan Berhasil Dihapus');
    // }

    public function destroy($id){
        $client = new Client();
        $response = $client->request('delete', 'http://127.0.0.1:9010/rental' . '/' . $id); //DELETE
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $rental = json_decode($body, true);
        return redirect('/admin/doorsmeer')->with('error', 'Pemesanan Berhasil Dihapus');

    // public function destroy($id){
    //     $rental = Rental::find($id);
    //     $is_admin = auth()->user()->hasRole('admin'); // periksa apakah pengguna adalah admin atau bukan
    
    //     $rental->delete();
    
    //     if ($is_admin) {
    //         // jika pengguna adalah admin, redirect ke halaman admin
    //         return redirect('/admin/rental')->with('error', 'Pemesanan Berhasil Dihapus');
    //     } else {
    //         // jika pengguna bukan admin, redirect ke halaman user
    //         return redirect('/akun')->with('error', 'Pemesanan Berhasil Dihapus');
    //     }
    }
    

}
