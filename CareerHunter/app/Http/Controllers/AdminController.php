<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\UserPerusahaan;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function login()
    {
        return view("auth.login_admin");
    }
    
    public function terimaUserPerusahaan($id)
    {
        UserPerusahaan::where("id",$id)->update(["status_verifikasi"=>"sudah"]);

        return redirect()->route("admin.verifikasi_user_perusahaan");
    }

    public function tolakUserPerusahaan($id)
    {
        UserPerusahaan::where("id",$id)->delete();

        return redirect()->route("admin.verifikasi_user_perusahaan");
    }

    public function processLogin(Request $r)
    {
        $user = Admin::where("username",$r->post("username"))->where("password",$r->post("password"))->get();
        
        if (count($user) > 0)
        {
            session([
                "id"=>$user[0]->id,
                "role"=>"admin",
                ]);

            return redirect()->route("home");
        }

        return redirect()->route('auth.admin.login')->with("success","Gagal masuk");
    }

    public function verifikasiPerusahaan()
    {
        $up = UserPerusahaan::where("status_verifikasi","belum")->get();
        return view("admin.verifikasi_user_perusahaan",["up"=>$up,"sessionNow"=>Admin::getCurrentUser(session("id"))]);
    }
}
