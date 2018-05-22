<?php

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

Route::post('/obras/subir_foto', 'ObraController@upload_photo');
Route::get('/obras/get_all_photos', "ObraController@get_all_photos");
Route::get('/obras/get_all_photos_by_user', "ObraController@get_all_photos_by_user");
Route::get('/obras/buscar', 'ObraController@search_by_name');
Route::get('/obras/index', 'ObraController@index');
