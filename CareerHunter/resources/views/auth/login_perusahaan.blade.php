@extends("layout.body.body")

@section("title", "Login")

@section("body")
<div class="bg-white bg-gradient px-5 vh-100" style="padding-top:9rem;">
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
    <div class="shadow-sm bg-white p-4" style="border-top: 4px solid var(--bs-primary);">
        <p class="fw-bold">Login Perusahaan</p>
        <form method="post" action="{{route("process.perusahaan.login")}}">
            @csrf
            <div class="mb-3">
                <label for="a" class="form-label">Username</label>
                <input name="username" type="text" required class="form-control"  style="border-left: 4px solid var(--bs-primary);" id="a" placeholder="">
            </div>
            <div class="mb-3">
                <label for="a" class="form-label">Password</label>
                <input name="password" type="password" required class="form-control"  style="border-left: 4px solid var(--bs-primary);" id="a" placeholder="">
            </div>
            <button type="submit" class="mb-5 btn btn-primary">Login</button><br>
            <a class="mb-5" href="{{route("auth.login")}}"">Login User</a><br>
            <a href="{{route("auth.admin.login")}}"">Login Admin</a>
        </form>
    </div>
</div>
@endsection

