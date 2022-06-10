<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\job_offer;

class PublishController extends Controller
{   
    
    public function index()
    {
        if (session('user')->roles_id==3) {
            return view('user.job_offer');
        }else{
            return 'no authorization';
        }
        
    }

    public function get_jobs_offers()
    {
        return job_offer::where('user_id', session('user')->id)->get();
    }

    public function post_job_offer(Request $request)
    {
        $fecha =  date('Y-m-d');
        if (session('user')->roles_id==3) {
            $job_offer = job_offer::create([
                'job_offer_name' =>  $request->job_offer_name,
                'job_offer_description' =>  $request->job_offer_description,
                'user_id' =>  session('user')->id,
                'job_offer_date' =>  $fecha,
                'job_offer_finished' =>  $request->job_offer_finished,
                'job_offer_status' =>  1,
            ]);

            if ($job_offer) {
                return ['status' => 200 , 'message'=>'Se subió correctamente'];
            }else{
                return ['status' => 401 , 'message'=>'No se subió el archivo'];
            }

        }else{
            return 'no authorization';
        }
    }

    public function search_files(Request $request)
    {
        return files::where('categories_id', $request->categories_id)->get();
    }

}
