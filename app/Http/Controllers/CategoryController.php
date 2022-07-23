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
        return category::paginate(1);
    }

    public function create_categories(Request $request)
    {
        if (session('user')->roles_id==1) {

            $category = category::create([
                'categories_name' => $request->name,
                'categories_status' => 1,
            ]);

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
