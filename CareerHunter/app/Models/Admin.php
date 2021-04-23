<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    use HasFactory;

    public static function getCurrentUser($id)
    {
        return Admin::where("id",$id)->get()[0] ?? null;
    }

    protected $fillable = [
        'username',
        'password',
    ];
}
