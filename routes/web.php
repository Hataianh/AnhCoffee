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
    return view('Coffee.trang-chu');
});

Route::get('/gioi-thieu', function () {
    return view('Coffee.gioi-thieu');
});

Route::get('/thuc-don', function () {
    return view('Coffee.thuc-don');
});

Route::get('/tin-tuc', function () {
    return view('Coffee.tin-tuc');
});

Route::get('/tin_tuc', function () {
    return view('Coffee.tin_tuc');
});

Route::get('/lien-he', function () {
    return view('Coffee.lien-he');
});

Route::get('/dat-ban', function () {
    return view('Coffee.dat-ban');
});

Route::get('/dat-hang', function () {
    return view('Coffee.dat-hang');
});

Route::get('/comment', function () {
    return view('Coffee.comment');
});

Route::get('/gio-hang', function () {
    return view('Coffee.gio-hang');
});

Route::get('/thanh-toan', function () {
    return view('Coffee.thanh-toan');
});

Route::get('/san-pham', function () {
    return view('Coffee.san-pham');
});

Route::get('admin/login', function () {
    return view('admin.login.index');
});

Route::get('admin/forgot', function () {
    return view('admin.forgot.index');
});

Route::get('admin/', function () {
    return view('admin.dashboard.index');
});

Route::get('admin/sanpham', function () {
    return view('admin.sanphams.index');
});

Route::get('admin/loaisp', function () {
    return view('admin.loaisps.index');
});

Route::get('admin/donhang', function () {
    return view('admin.donhangs.index');
});


Route::get('admin/ct-donhangs', function () {
    return view('admin.ct-donhangs.index');
});

Route::get('admin/tintuc', function () {
    return view('admin.tintucs.index');
});

Route::get('admin/nhanvien', function () {
    return view('admin.nhanviens.index');
});

Route::get('admin/nguoidung', function () {
    return view('admin.nguoidungs.index');
});

Route::get('admin/khachhang', function () {
    return view('admin.khachhangs.index');
});

Route::get('admin/kho', function () {
    return view('admin.khos.index');
});

Route::get('admin/billban', function () {
    return view('admin.billbans.index');
});

Route::get('admin/billnhap', function () {
    return view('admin.billnhaps.index');
});

Route::get('admin/nhacungcap', function () {
    return view('admin.nccs.index');
});

Route::get('admin/phanhoi', function () {
    return view('admin.phanhois.index');
});

Route::get('admin/why', function () {
    return view('admin.whys.index');
});

Route::get('admin/slide-1', function () {
    return view('admin.slide1s.index');
});

Route::get('admin/slide-2', function () {
    return view('admin.slide2s.index');
});

Route::get('admin/gallery', function () {
    return view('admin.gallerys.index');
});

Route::get('admin/datban', function () {
    return view('admin.datbans.index');
});
