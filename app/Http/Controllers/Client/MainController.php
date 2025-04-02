<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Knife;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MainController extends Controller
{
    public function index(Request $request)
    {
        $knives = Knife::all();
        return Inertia::render('Client/Magazine', [
            'knives' => $knives
        ]);
    }
    public function cart()
    {
        return Inertia::render('Client/Cart');
    }
    public function contact()
    {
        return Inertia::render('Client/Contact');
    }
    public function knife()
    {
        return Inertia::render('Client/Knife');
    }
}
