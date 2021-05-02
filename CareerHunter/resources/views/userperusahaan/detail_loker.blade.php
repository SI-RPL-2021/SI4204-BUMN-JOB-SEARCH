<!-- #req9 melihat pelamar dan filter-->
@extends("layout.body.body")

@section("title", "Home")

@section("body")
<div class="bg-white bg-gradient px-5 mb-5 vh-100" style="padding-top:9rem;">
    @if(session("success"))
    <div class="alert alert-success" role="alert">
        {{session("success")}}
    </div>
    @endif
    @if(session("fail"))
    <div class="alert alert-danger" role="alert">
        {{session("fail")}}
    </div>
    @endif
    <h3>List Pelamar</h3>
    <table class="table-bordered table-hover table-inverse table-striped" id="example" width="100%">
        <!-- <table class="table table-bordered shadow-sm"> -->
        <thead>
            <tr style="height: 50px;">
                <th>No</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($requestPosisi as $posisi)
            <tr>
                <td>{{$loop->index+1}}</td>
                <td>{{$posisi->nama_lengkap}}</td>
                <td>{{$posisi->email}}</td>
                <td>
                    @switch($posisi->status_request)

                    @case("avail")

                    <p class="text-success">Seleksi administrasi</p>

                    @break
                    @case("lolos tahap 1")

                    <p class="text-success">Lolos tahap 1</p>

                    @break
                    @case("ditolak")

                    <p class="text-danger">Ditolak</p>

                    @break
                    @endswitch
                </td>
                <td>
                    <!-- <a href="{{ route('loker.detail',$posisi->id)}}">

                        <button type="button" class="btn btn-primary my-button m-1">Detail</button>

                    </a> -->
                    @if($posisi->status_request!="ditolak")

                    @if($posisi->cv != '')

                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info  my-button m-1" data-toggle="modal" data-target="#myModal">CV</button>
                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">

                                    <embed src="{{asset('img/cv/'.$posisi->cv)}}" frameborder="0" width="100%" height="400px">

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    @endif

                    <a href="{{ route('loker.acc',$posisi->id)}}">

                        <button type="button" class="btn btn-primary my-button m-1">Accept</button>

                    </a>

                    <a href="{{ route('loker.dcc',$posisi->id_requestposisi)}}">

                        <button type="button" class="btn btn-danger my-button m-1">Decline</button>

                    </a>
                    @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection