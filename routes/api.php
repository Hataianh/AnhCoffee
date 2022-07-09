<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
use App\Http\Controllers\API\SanphamController;
use App\Http\Controllers\API\LoaiSpController;
use App\Http\Controllers\API\TintucController;
use App\Http\Controllers\API\NhanvienController;
use App\Http\Controllers\API\NguoidungController;
use App\Http\Controllers\API\KhachhangController;
use App\Http\Controllers\API\KhoController;
use App\Http\Controllers\API\BillbanController;
use App\Http\Controllers\API\BillnhapController;
use App\Http\Controllers\API\NccController;
use App\Http\Controllers\API\PhanhoiController;
use App\Http\Controllers\API\WhyController;
use App\Http\Controllers\API\Slide1Controller;
use App\Http\Controllers\API\Slide2Controller;
use App\Http\Controllers\API\GalleryController;
use App\Http\Controllers\API\DatbanController;
use App\Http\Controllers\API\DonhangController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::resource('sanphams', SanphamController::class);
Route::resource('sanphamhomes', SanphamController::class);
Route::resource('loaisps', LoaiSpController::class);
Route::resource('tintucs', TintucController::class);
Route::resource('tintuchomes', TintucController::class);
Route::resource('nhanviens', NhanvienController::class);
Route::resource('nguoidungs', NguoidungController::class);
Route::resource('khachhangs', KhachhangController::class);
Route::resource('khos', KhoController::class);
Route::resource('billbans', BillbanController::class);
Route::resource('billnhaps', BillnhapController::class);
Route::resource('nccs', NccController::class);
Route::resource('phanhois', PhanhoiController::class);
Route::resource('whys', WhyController::class);
Route::resource('slide1s', Slide1Controller::class);
Route::resource('slide2s', Slide2Controller::class);
Route::resource('gallerys', GalleryController::class);
Route::resource('datbans', DatbanController::class);
Route::resource('donhangs', DonhangController::class);