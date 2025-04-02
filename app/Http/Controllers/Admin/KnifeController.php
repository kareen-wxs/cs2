<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Knife;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class KnifeController extends Controller
{
    public function index(): Response
    {
        $knives = Knife::all();
        return Inertia::render('Admin/Knives/Index', [
            'knives' => $knives
        ]);
    }

    public function create(): Response
    {
        $knife = Knife::get();
        return Inertia::render('Admin/Knives/Create', [
            'knife' => $knife
        ]);
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'skin' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'rarity' => 'required|string|max:255',
            'pattern' => 'nullable|string|max:255',
            'wear' => 'required|string|max:255',
            'image' => 'nullable|max:2048',
        ]);

        $data = $request->all();
        
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('knives', 'public');
        }

        Knife::create($data);

        return redirect()->route('admin.knives.index')->with('success', 'Нож добавлен');
    }

    public function edit(Knife $knife): Response
    {
        return Inertia::render('Admin/Knives/Edit', [
            'knife' => $knife
        ]);
    }

    public function update(Request $request, Knife $knife)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'skin' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'rarity' => 'nullable|string|max:255',
            'pattern' => 'nullable|string|max:255',
            'wear' => 'required|string|max:255',
            'image' => 'nullable|max:2048',
        ]);

        $data = $request->all();
        
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('knives', 'public');
        }

        $knife->update($data);

        return redirect()->route('admin.knives.index')->with('success', 'Нож обновлен');
    }

    public function destroy(Knife $knife)
    {
        $knife->delete();
        return redirect()->route('admin.knives.index')->with('success', 'Нож удален');
    }
}
