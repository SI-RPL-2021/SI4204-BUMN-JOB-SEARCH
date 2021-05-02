<?php

namespace App\Http\Controllers;

use App\Models\Loker;
use App\Models\User;
use App\Models\RequestPosisi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LokerController extends Controller
{
    /*
    |-----------------------------
    |		#req9 proses menampilkan loker 		
    |-----------------------------
    */
    public function lihatLoker($id)
    {
        if (session("id") == null) {
            return view("auth.login");
        }
        $loker = DB::select("select * from lokers right join perusahaan_users on lokers.perusahaan_id = perusahaan_users.id where lokers.id = ?", [$id])[0];
        return view("user.lihat_loker", ["loker" => $loker, "sessionNow" => User::getCurrentUser(session("id"))]);
    }

    /*
    |-----------------------------
    |		#req9 proses menampilkan pelamar 		
    |-----------------------------
    */
    public function detailLoker($id)

    {

        // $requestPosisi = RequestPosisi::find($id);
        $requestPosisi = DB::table('request_posisi')
            ->join('users', 'request_posisi.user_id', '=', 'users.id')
            ->join('lokers', 'request_posisi.loker_id', '=', 'lokers.id')
            ->select('request_posisi.*', 'users.*', 'lokers.*', 'request_posisi.id as id_requestposisi')
            ->where('loker_id', $id)
            ->get();

        return view('userperusahaan/detail_loker', ['requestPosisi' => $requestPosisi, "sessionNow" => User::getCurrentUser(session("id"))]);
    }

    /*
    |-----------------------------
    |		#req10 proses memberikan konfirmasi lolos bagi pelamar 		
    |-----------------------------
    */
    public function AccLoker($id)

    {

        $RequestPosisi = RequestPosisi::find($id);
        $RequestPosisi->status_request = "lolos tahap 1";
        $RequestPosisi->save();

        $loker = Loker::find($RequestPosisi->loker_id);
        return redirect()->route('home', ['up' => $loker, "sessionNow" => User::getCurrentUser(session("id"))]);
    }

    /*
    |-----------------------------
    |		#req10 proses memberikan konfirmasi tidak lolos bagi pelamar 		
    |-----------------------------
    */
    public function DccLoker($id)

    {

        $RequestPosisi = RequestPosisi::find($id);
        $RequestPosisi->status_request = "ditolak";
        $RequestPosisi->save();

        $loker = Loker::find($RequestPosisi->loker_id);

        return redirect()->route('home', ['up' => $loker, "sessionNow" => User::getCurrentUser(session("id"))]);
    }

    public function StopLoker($id)

    {

        $loker = Loker::find($id);
        $loker->status_loker = "not avail";

        $loker->save();

        return redirect()->route('home', ['up' => $loker, "sessionNow" => User::getCurrentUser(session("id"))]);
    }
}
