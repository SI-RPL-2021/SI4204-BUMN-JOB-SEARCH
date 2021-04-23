<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield("title")</title>

    <script src="{{ url('/js/jquery.min.js') }}"></script>

    <link rel="stylesheet" href="{{ url('/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href= 
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            
            font-family: 'Nunito', sans-serif;
        }
        

    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light   position-fixed w-100"
        style="background-image: url('https://i.ibb.co/jyjQSPH/Untitled-2.png');z-index:99;background-repeat: no-repeat; background-size: 100% 100%;background-color:#4B7BF5;">
        <div class="container-fluid my-2 mx-4">
            <a class="navbar-brand" href="{{ route('home') }}"><b>CareerHunter</b></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="{{ route('home') }}">Home</a>
                    </li>

                    @if (session("role") == "admin")
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            User Perusahaan
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="{{route("admin.verifikasi_user_perusahaan")}}">Verifikasi User Perusahaan</a></li>
                        </ul>
                    </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link" href="{{route("loker")}}">Lowongan Pekerjaan</a>
                    </li>
                </ul>
                <form class="d-flex">
                    @if (session('id') && session('role') == 'user')
                        <div class="dropdown me-3">
                            <button class="btn btn-outline-primary text-dark dropdown-toggle" type="button" id="dropdownMenuButton1"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                {{ $sessionNow->nama_lengkap }}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="{{route("user.profil")}}">Edit Profil</a></li>
                                <li><a class="dropdown-item" href="{{route("logout")}}">Logout</a></li>
                            </ul>
                        </div>
                    @elseif (session('id') && session('role') == 'admin')
                        <div class="dropdown me-3">
                            <button class="btn btn-outline-primary text-dark dropdown-toggle" type="button" id="dropdownMenuButton1"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                {{ $sessionNow->username }}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="{{route("logout")}}">Logout</a></li>
                            </ul>
                        </div>
                    @elseif (session('id') && session('role') == 'userperusahaan')
                        <div class="dropdown me-3">
                            <button class="btn btn-outline-primary text-dark dropdown-toggle" type="button" id="dropdownMenuButton1"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                {{ $sessionNow->nama_pj }}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="{{route("perusahaan.profil")}}">Edit Profil</a></li>
                                <li><a class="dropdown-item" href="{{route("logout")}}">Logout</a></li>
                            </ul>
                        </div>
                    @else
                        <a href="{{ route('auth.login') }}" class="btn btn-default"
                            type="submit">Login</a>
                        <a href="{{ route('auth.register') }}" class="btn btn-default"
                            type="submit">Register</a>
                        <a href="{{ route('auth.perusahaan.register') }}" class="btn btn-default"
                            type="submit">Register User Perusahaan</a>
                    @endif
                </form>
            </div>
        </div>
    </nav>
    @yield("body")

    <script src="{{ url('/js/bootstrap.bundle.js') }}"></script>
</body>

</html>
