<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\donhang;
use \Datetime;

class DonhangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return donhang::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $db = new donhang();
        // $db=$request->all();
        // $db->id = $id;
        $db->ten = $request->ten;
        $db->ho = $request->ho;
        $db->diachi = $request->diachi;
        $db->thanhpho = $request->thanhpho;
        $db->sdt = $request->sdt;
        $db->email = $request->email;
        $db->ghichu = $request->ghichu;
        $db->updated_at = new Datetime();
        $db->save();
        
        return $db;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return donhang::findOrFail($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $db = donhang::findOrFail($id);
        // $db=$request->all();
        // $db->id = $id;
        $db->ten = $request->ten;
        $db->ho = $request->ho;
        $db->diachi = $request->diachi;
        $db->thanhpho = $request->thanhpho;
        $db->sdt = $request->sdt;
        $db->email = $request->email;
        $db->ghichu = $request->ghichu;
        $db->updated_at = new Datetime();
        $db->save();
        return $db;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        donhang::findOrFail($id)->delete();
        return "Deleted";
    }
}