<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title> Senato Bilgi Sistemi </title>
    {{-- {{ config('app.name', 'Laravel') }} --}}

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!--    <link rel="shortcut icon" href="{{ asset('favicon.png') }}" type="image/x-icon">-->
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/bootstrap-v5.min.css') }}" rel="stylesheet">

    <!-- Scripts -->
    <script src="{{ asset('js/bootstrap-v5.min.js') }}"></script>
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/jquery.mask.min.js') }}"></script>
</head>

<body>
    <div id="app" class="login-body">
        {{-- <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    Жиналыс
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto">

                    </ul>

                    <ul class="navbar-nav ms-auto">
                        @guest
                        @if (Route::has('adminLoginShow'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('adminLoginShow') }}">{{ __('Әкімшілік панеліне кіру') }}</a>
                        </li>
                        @endif
                        @else
                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }}
                            </a>

                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
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
        </nav> --}}

        <main class="py-4">
            @yield('content')
        </main>
    </div>

    <script>
        //PHOME MASK JQUERY Erdaulet
        $(".phone_mask").mask("+7(000) 000-00-00");
        $(".phone_mask").on('focus', function() {
            if ($(this).val() == '')
                $(this).val('+7(');
        })
        $(".phone_mask").on('focusout', function() {
            if ($(this).val() == '+7(')
                $(this).val('');
        })
    </script>
    <style>
        .login-body {
            background-image: url('images/login-bg.jpg');
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center
        }

        .py-4 {
            width: 50% !important;
        }

        @media (max-width: 1470px) {
            .py-4 {
                width: 75% !important;
            }
        }
    </style>
</body>

</html>
