<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\membreship;

class MembershipController extends Controller
{
    public function index()
    {
        return view('admin.membership');
    }

    public function get_membership()
    {
        return membreship::all();
    }

    public function create_membership(Request $request)
    {
        if (session('user')->roles_id==1) {
            $membership = membreship::create([
                'membership_name' =>  $request->membership_name,
                'membership_description' =>  $request->membership_description,
                'membership_price' =>  $request->membership_price,
                'membership_status' =>  1,
            ]);

            if ($membership) {
                return ['status' => 200 , 'message'=>'Se subió correctamente'];
            }else{
                return ['status' => 401 , 'message'=>'No se subió el archivo'];
            }

        }else{
            return 'no authorization';
        }
    }
}
