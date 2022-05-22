<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\files;

class AdminController extends Controller
{
    public function index()
    {
        if (session('user')->roles_id==1) {
            return view('admin.files');
        }else{
            return 'no authorization';
        }
        
    }

    public function get_files()
    {
        return files::all();
    }

    public function upload_files(Request $request)
    {
        if (session('user')->roles_id==1) {
            $file = $request->file('file');
            $portada = $request->file('portada');

            $file_name = 'file-'.Str::uuid()->toString().'.'.$file->getClientOriginalExtension();
            $portada_name = 'portada-'.Str::uuid()->toString().'.'.$portada->getClientOriginalExtension();
            $files = files::create([
                'files_name' => $request->name,
                'files_url'=> $file_name,
                'files_portada' => $portada_name,
                'files_status' => 1,
            ]);

            $file->move(public_path().'/file',$file_name);
            $portada->move(public_path().'/portada',$portada_name);

            if ($files) {
                return ['status' => 200 , 'message'=>'Se subió correctamente'];
            }else{
                return ['status' => 401 , 'message'=>'No se subió el archivo'];
            }

        }else{
            return 'no authorization';
        }
    }


}
