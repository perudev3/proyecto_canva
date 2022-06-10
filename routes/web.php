<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('get/categories', 'CategoryController@get_categories');
Route::get('get/binders', 'BindersController@get_binders');
Route::get('get/membership', 'MembershipController@get_membership');
Route::get('get/jobs_officer', 'UserController@get_officer_user');

Route::group(['middleware' => 'auth'], function () {
    // User Admin
    Route::get('/category', 'CategoryController@index');
    Route::post('create/category', 'CategoryController@create_categories');

    Route::get('/binders', 'BindersController@index');
    Route::post('create/binders', 'BindersController@create_binders');
    Route::post('/get_files', 'FileController@get_files');
    Route::get('/user_membership', 'UserController@get_user_membership');

    Route::get('/membership', 'MembershipController@index');
    Route::post('create/membership', 'MembershipController@create_membership');

    // User
    Route::get('/my_profile', 'UserController@my_profile');
    

    //Empresa
    Route::get('/my_binders', 'UserController@my_binders');
    Route::get('/get_binders_empresa', 'UserController@get_binders_empresa');
    Route::post('/get_files_empresa', 'UserController@get_files_empresa');
    Route::get('/pubish_job_offer', 'PublishController@index');
    Route::get('/jobs_offers', 'PublishController@get_jobs_offers');    
    Route::post('create/job_offer', 'PublishController@post_job_offer');
    Route::get('suscription_membership', 'UserController@suscription_member');
    Route::post('suscription_membership_empresa', 'UserController@post_suscription_membership');
});
