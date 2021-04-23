<?php

namespace App\Http\Controllers;

use App\Models\Loker;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LokerController extends Controller
{
    public function lihatLoker($id)
    {
        if (session("id") == null)
        {
            return view("auth.login");
        }
        $loker = DB::select("select * from lokers right join perusahaan_users on lokers.perusahaan_id = perusahaan_users.id where lokers.id = ?",[$id])[0];
        return view("user.lihat_loker",["loker"=>$loker,"sessionNow"=>User::getCurrentUser(session("id"))]);
    }
}
