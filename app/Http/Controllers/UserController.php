<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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


    public function my_binders()
    {
        return view('user.my_binders');
    }

    public function get_binders_empresa()
    {
       return binder::with('empresas')->where('user_id', session('user')->id)->get();
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

    public function post_suscription_membership(Request $request)
    {
        
    }
}
