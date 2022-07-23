<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\User;
use App\binder;
use App\file;
use App\job_offer;

class UserController extends Controller
{
    public function get_user_membership(Request $request)
    {
        $data = User::where('name', 'like', '%' .$request->name.'%' )->get();
        return response()->json($data);
    }

    public function my_profile()
    {
        return view('user.profile');
    }

    public function get_data_user()
    {
        return User::where('id', session('user')->id)->first();
    }


    public function my_binders()
    {
        return view('user.my_binders');
    }

    public function get_binders_empresa()
    {
       return binder::with('empresas', 'files')->where('user_id', session('user')->id)->get();
    }
    
    public function get_files_empresa(Request $request)
    {
        return file::where('binder_id', $request->binder_id)->get();
    }

    public function get_officer_user()
    {
        return  job_offer::with('empresa')->get();
    }

    public function first_jobs(Request $request)
    {
        return  job_offer::with('empresa')->where('job_offer_id', $request->job_offer_id)->first();
    }

    public function suscription_member()
    {
        return view('user.suscription_membership');
    }

    public function update_photo(Request $request)
    {
        $photo = $request->file('url_photo');
        $custom_name = 'photo-'.session('user')->id.'-'.Str::uuid()->toString().'.'.$photo->getClientOriginalExtension();
        $user = User::where('id',session('user')->id)->update([
            'url_photo' => $custom_name
        ]);
        $photo->move(public_path('photo'), $custom_name);   

        if ($user == true) {
            return [ "status" => "success", "message" => "Foto Actualizada"];
        }else{
            return [ "status" => "error", "message" => "No se pudo subir la foto"];
        }
    }

    public function update_data(Request $request)
    {
        $user = User::where('id',session('user')->id)->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        if ($user == true) {
            return [ "status" => "success", "message" => "Foto Actualizada"];
        }else{
            return [ "status" => "error", "message" => "No se pudo subir la foto"];
        }
    }

    public function post_suscription_membership(Request $request)
    {
        
    }
}
