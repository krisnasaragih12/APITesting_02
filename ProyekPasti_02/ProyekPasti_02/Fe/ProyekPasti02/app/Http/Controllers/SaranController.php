<?php

namespace App\Http\Controllers;

use App\Models\Saran;
use GuzzleHttp\Client;
use App\Http\Requests\StoreSaranRequest;
use App\Http\Requests\UpdateSaranRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SaranController extends Controller
{
    public function index(){
        // $doorsmeer = Doorsmeer::get()->all();        
        $client = new Client();
        $response = $client->request('GET', 'http://127.0.0.1:9010/saran/'); //GET
        $statusCode = $response->getStatusCode();
        $body = $response->getBody()->getContents();
        $saran = json_decode($body, true);

        return view('admin.saran', compact('saran'));
    }

    public function index_addSaran(){
        return view('customer.contact');    
    }
    public function store_saran(Request $request){  
        // dd($request->all());      
        $request->validate([
            'nama' => 'required',
            'nomortelepon' => 'required',
            'saran' => 'required',
        ]);
        $saran = new Saran;
        $saran->nama = $request->nama;
        $saran->nomortelepon = $request->nomortelepon;
        $saran->saran = $request->saran;
        $saran->created_at = now();
        $saran->save();
        return redirect('contact')->with('success', 'Kritik & Saran Berhasil Dikirimkan');
    }
}
