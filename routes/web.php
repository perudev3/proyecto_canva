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
Route::get('get/files', 'PublishController@get_files');
Route::get('get/categories', 'CategoryController@get_categories');
Route::post('search/files', 'PublishController@search_files');

Route::group(['middleware' => 'auth'], function () {
    // User Admin
    Route::get('/files', 'PublishController@index');
    Route::post('create/files', 'PublishController@upload_files');

    Route::get('/category', 'CategoryController@index');
    Route::post('create/category', 'CategoryController@upload_categories');

    // User
    Route::get('/my_files', 'UserController@index');
    Route::get('/membership', 'MembershipController@index');
    Route::post('create/membership', 'MembershipController@create_membership');
});
