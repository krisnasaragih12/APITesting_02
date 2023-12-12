<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use GuzzleHttp\Client;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ServiceController extends Controller
{
    public function index(){
        // $doorsmeer = Doorsmeer::get()->all();        
        $client = new Client();
        $response = $client->request('GET', 'http://127.0.0.1:9010/service/'); //GET
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $service = json_decode($body, true);

        return view('admin.service', compact('service'));
    }
    // public function index(){
    //     $service = Service::all();        
    //     return view('admin.service', compact('service'));
    // }

    public function index_addService(){
        return view('customer.service');
    }
    public function store_service(Request $request){  
        // dd($request->all());      
        $request->validate([
            'namalengkap' => 'required',
            'layanan' => 'required',
            'nomortelepon' => 'required',
            'tipemobil' => 'required',
            'tanggal' => 'required',
            'waktu' => 'required',
            
        ]);
        $service = new Service;
        $service->namalengkap = $request->namalengkap;
        $service->layanan = $request->layanan;
        $service->nomortelepon = $request->nomortelepon;
        $service->tipemobil = $request->tipemobil;
        $service->tanggal = Carbon::createFromFormat('d/m/Y', Carbon::parse($request->tanggal)->format('d/m/Y'));
        $service->waktu = $request->waktu;
        // dd($asd);
        $service->save();
        return redirect('service')->with('success', 'Pembookingan Berhasil!');
    }

    public function update_status($id, $status){
    if ($status !== 'Disetujui' && $status !== 'Ditolak') {
        return back()->with('error', 'Status Tidak Berhasil Diperbaharui!');
    }

    $service = Service::find($id);
    $service->status = $status;
    $service->save();

    return back()->with('success', 'Status Berhasil Diperbaharui!');
    }

    // public function destroy($id){
    //     $service = Service::find($id);        
    //     $service->delete();

    //     return redirect('/admin/service')->with('error', 'Pemesanan Berhasil Dihapus');
    // }
    // public function destroy($id){
    //     $service = Service::find($id);
    //     $is_admin = auth()->user()->hasRole('admin'); // periksa apakah pengguna adalah admin atau bukan
    
    //     $service->delete();
    
    public function destroy($id){
        $client = new Client();
        $response = $client->request('delete', 'http://127.0.0.1:9010/service' . '/' . $id); //DELETE
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $service = json_decode($body, true);
        return redirect('/admin/service')->with('error', 'Pemesanan Berhasil Dihapus');
    //     if ($is_admin) {
    //         // jika pengguna adalah admin, redirect ke halaman admin
    //         return redirect('/admin/service')->with('error', 'Pemesanan Berhasil Dihapus');
    //     } else {
            // jika pengguna bukan admin, redirect ke halaman user
            // return redirect('/akun')->with('error', 'Pemesanan Berhasil Dihapus');
        }
    }

