<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class billban extends Model
{
    use HasFactory;
    protected $table = 'bills_ban';
    public function khachhang(){
        return $this->belongsTo(khachhang::class,'id_kh');
    }
}
