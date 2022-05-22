<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class MembershipController extends Controller
{
    public function index()
    {
        return view('user.membership');
    }

    public function create_membership(Request $request)
    {
        $user = \Auth::user();
        $membership_user = User::where('id', $user->id)->update([
            'status_membership' => 1,
        ]);

        if ($membership_user == true) {
            return ['status' => 200, 'message' => 'Obtuvo su membresia'];
        }else{
            return ['status' => 401, 'message' => 'No pudo obtener su membresia'];
        }
    }
}
