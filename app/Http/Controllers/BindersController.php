<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\BinderEmail;
use App\binder;

class BindersController extends Controller
{
    public function index()
    {
        if (session('user')->roles_id==1) {
            return view('admin.binder');
        }else{
            return 'no authorization';
        }
    }

    public function get_binders()
    {
        return binder::with('empresas')->get();
    }

    public function create_binders(Request $request)
    {
        $fecha =  date('Y-m-d');
        if (session('user')->roles_id==1) {

            $binder = binder::create([
                'binder_name' => $request->name,
                'binder_date' => $fecha,
                'user_id' => $request->user_id,
                'binder_status' => 1,
            ]);

            if ($binder) {
                $data = binder::with('empresas')->where('user_id', $binder->user_id)->where('binder_id', $binder->binder_id)->first();
                Mail::to("rivasrivas506@gmail.com")->send(new BinderEmail($data));
                return ['status' => 200 , 'message'=>'Se subió correctamente'];   
                
            }else{
                return ['status' => 401 , 'message'=>'No se subió el archivo'];
            }

        }else{
            return 'no authorization';
        }
    }
}
