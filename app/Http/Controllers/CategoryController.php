<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\category;

class CategoryController extends Controller
{
    public function index()
    {
        if (session('user')->roles_id==1) {
            return view('admin.category');
        }else{
            return 'no authorization';
        }
    }

    public function get_categories()
    {
        return category::all();
    }

    public function upload_categories(Request $request)
    {
        if (session('user')->roles_id==1) {
            $file = $request->file('url');

            $categories_name = 'icon-'.Str::uuid()->toString().'.'.$file->getClientOriginalExtension();
            $category = category::create([
                'categories_name' => $request->name,
                'categories_url'=> $categories_name,
                'categories_status' => 1,
            ]);

            $file->move(public_path().'/icon_category',$categories_name);

            if ($category) {
                return ['status' => 200 , 'message'=>'Se subió correctamente'];
            }else{
                return ['status' => 401 , 'message'=>'No se subió el archivo'];
            }

        }else{
            return 'no authorization';
        }
    }

}
