<?php

use App\Http\Controllers\Admin\KnifeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\Client\MainController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Admin/home');
// })->name('index');


Route::middleware('auth')->group(function () {
});


Route::middleware('guest')->group(function () {
    Route::view('/register', 'auth.register')->name('register');
    Route::view('/login', 'auth.login')->name('adminLoginShow');
    Route::post('/login', [AdminAuthController::class, 'adminLoginForm'])->name('adminLoginForm');
    Route::post('/register', [AdminAuthController::class, 'register'])->name('registerPost');
});
Route::get('/main', [MainController::class, 'index'])->name('main');
Route::get('/contact', [MainController::class, 'contact'])->name('contact');
Route::get('/cart', [MainController::class, 'cart'])->name('cart');
Route::get('/knife', [MainController::class, 'cart'])->name('knife');
Route::get('/logout', [AdminAuthController::class, 'logout'])->name('logout');
Route::get('/user', [AdminAuthController::class, 'getUser'])->name('user');



Route::middleware('checkUserRole:admin,user')->group(function () {
});