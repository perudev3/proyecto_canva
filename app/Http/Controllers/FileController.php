<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\File;

class FileController extends Controller
{
    public function get_files(Request $request)
    {
        return file::where('binder_id', $request->binder_id)->get();
    }

    public function upload_files(Request $request){

        $images = $request->file('file_url');        
         
         $cont = 0;
         foreach($images as $img){
 
             $custom_name = 'file-'.$request->binder_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
             if  ($cont === 0){
                $file = file::create([
                    'binder_id' => $request->binder_id,
                    'file_url' => $custom_name,
                ]); 
             }else{
                break;
             }
             $img->move(public_path('file'), $custom_name);             
             $cont++;             
         }
 
         if ($file==true) {
             return [ "status" => "success", "message" => "Archivo subido con Exito"];
         }else{
             return [ "status" => "error", "message" => "Error al subir el archivo"];
         }
     }
 
}
