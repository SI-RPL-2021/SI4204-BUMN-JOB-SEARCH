<div class="bg-white bg-gradient px-5" style="padding-top:7rem;padding-bottom: 5rem;">
    <a href="{{route("perusahaan.loker.tambah")}}" class="btn btn-primary mb-3">Posting Lowongan Kerja</a>
    <table class="table table-bordered shadow-sm">
        <thead>
            <tr>
                <th colspan="4">List Lowongan Kerja</th>
            </tr>
            <tr>
                <th>No</th>
                <th>Posisi Pekerjaan</th>
                <th>Deskripsi Pekerjaan</th>
                <th>Jumlah Pengajuan</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($up as $d)
            <tr>
                <td>{{$loop->index}}</td>
                <td>{{$d->posisi}}</td>
                <td>{{$d->job_desc}}</td>
                <td>
                    @php
                        $hm = DB::select("select * from request_posisi where loker_id = ?",[$d->id]);
                        echo count($hm);
                    @endphp
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
