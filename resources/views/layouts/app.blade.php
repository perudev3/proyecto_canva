<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <style>

        *{
            font-family: 'Open Sans', sans-serif !important;
        }
        .navbar{
            padding-top:22px;
        }

        .wrapper {
            display: flex;
            align-items: stretch;
        }

        #sidebar {
            min-width: 250px;
            max-width: 250px;
            min-height: 100vh;
        }

        #siderbar a{
            color: #0e0e0e;
        }

        #sidebar.active {
            margin-left: -250px;
        }
        #sidebar a[data-toggle="collapse"] {
            position: relative;
        }

        #sidebar .dropdown-toggle::after {
            display: block;
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
        }

        @media (max-width: 768px) {
            #sidebar {
                margin-left: -250px;
            }
            #sidebar.active {
                margin-left: 0;
            }
        }
        
        #sidebar {
            /* don't forget to add all the previously mentioned styles here too */
            background: #ffffff;
            color: #222;
            transition: all 0.3s;
        }

        #sidebar .sidebar-header {
            padding: 20px;
            background: #ffffff;
        }

        #sidebar ul.components {
            padding: 20px 0;
        }

        #sidebar ul p {
            color: #fff;
            padding: 10px;
        }

        #sidebar ul li a {
            padding: 9px;
            font-size: 1.1em;
            display: block;
            border-radius: 7px;
            margin: 15px;
            text-decoration: none;
        }
        #sidebar ul li a:hover {
            color: #7386D5;
            background: #00000008;
        }

        #sidebar ul li.active > a, a[aria-expanded="true"] {
            color: #000;
            background: #0000002e;
        }

        #navbarDropdown{
            background: #c7c6c6;
            border-radius: 46px;
            height: 38px;
            width: 37px;
        }
    </style>
</head>
<body>
    <div id="app">

        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
            @if(Auth::user())
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <span><i class="fas fa-bars"></i></span>
                </button>
            @endif

                <a class="navbar-brand" style="padding:5px;">
                    {{ config('app.name', 'Canva') }}
                </a>
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else 
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('home') }}">{{ __('Home') }}</a>
                            </li>       
                            @if(session('user')->roles_id == 1)                            
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('files') }}">{{ __('Files') }}</a>
                            </li>
                            @endif()
                            @if(session('user')->roles_id == 2)                            
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('my_files') }}">{{ __('My Favoritos') }}</a>
                            </li>
                            @endif()
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    <i class="fas fa-user" style="font-size: 25px;left:5px;"></i>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Cerrar Sesión') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>
        @guest
        <main class="py-4">
            @yield('content')
        </main>
        @endguest

        @if(Auth::user())
        <div class="wrapper">
            <!-- Sidebar -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Canva</h3>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="#">Portfolio</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </nav>
            <main class="py-4">
                @yield('content')
            </main>
        </div>
        @endif
        

        
    </div>

    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}" defer></script>
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });

        });
    </script>
</body>
</html>
