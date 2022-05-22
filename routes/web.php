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
Route::get('get/files', 'AdminController@get_files');

Route::group(['middleware' => 'auth'], function () {
    // User Admin
    Route::get('/files', 'AdminController@index');
    Route::post('create/files', 'AdminController@upload_files');

    // User
    Route::get('/my_files', 'UserController@index');
    Route::get('/membership', 'MembershipController@index');
    Route::post('create/membership', 'MembershipController@create_membership');
});
