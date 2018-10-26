<?php

namespace App\Http\Controllers;

use App\Brand;
use App\Notebook;
use App\NotebookProcesssor;
use Illuminate\Http\Request;

class NotebookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $notebooks = Notebook::Latest()->get();
        $full_price_min = Notebook::all()->min('price');
        $full_price_max = Notebook::all()->max('price');
        if (isset($request->price_min))
        {
            $notebooks = $notebooks->filter(function ($item) use ($request){
                return $item->price >= floatval($request->price_min) and $item->price <= floatval($request->price_max);
            });

            if (isset($request->brands))
            {
                foreach ($request->brands as $id)
                {
                    $brand = Brand::findOrFail($id);
                    $notebooks = $notebooks->merge($brand->notebooks);
                }
            }

            if (isset($request->processors))
            {
                foreach ($request->processors as $id) {
                    $processor = NotebookProcesssor::findOrFail($id);
                    $notebooks = $notebooks->merge($processor->notebooks);
                }
            }

        }
        return view('notebook.notebook_index', ['notebooks'=>$notebooks, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Notebook  $notebook
     * @return \Illuminate\Http\Response
     */
    public function show(Notebook $notebook)
    {
        return view('notebook.notebook_show', ['notebook'=>$notebook]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Notebook  $notebook
     * @return \Illuminate\Http\Response
     */
    public function edit(Notebook $notebook)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Notebook  $notebook
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Notebook $notebook)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Notebook  $notebook
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notebook $notebook)
    {
        //
    }
}
