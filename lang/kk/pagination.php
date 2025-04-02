<?php

use Illuminate\Support\Facades\Auth;

$user = Auth::user();
return [

    /*
    |--------------------------------------------------------------------------
    | Pagination Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines are used by the paginator library to build
    | the simple pagination links. You are free to change them to anything
    | you want to customize your views to better match your application.
    |
    */

    'previous' => '&laquo; ' . ($user->lang_code === 'kz' ? 'Алдыңғы' : 'Ön'),
    'next'     => ($user->lang_code === 'kz' ? 'Келесі' : 'Sonraki') . ' &raquo;',

];
