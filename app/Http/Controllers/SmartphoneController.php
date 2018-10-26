<?php

namespace App\Http\Controllers;

use App\Phonebrand;
use App\Phoneproccessor;
use App\Smartphone;
use Illuminate\Http\Request;

class SmartphoneController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $smartphones = Smartphone::Latest()->get();
        $full_price_min = Smartphone::all()->min('price');
        $full_price_max = Smartphone::all()->max('price');
        if (isset($request->price_min))
        {
            $smartphones = $smartphones->filter(function ($item) use ($request){
                return $item->price >= floatval($request->price_min) and $item->price <= floatval($request->price_max);
            });

            if (isset($request->brands))
            {
                foreach ($request->brands as $id)
                {
                    $brand = Phonebrand::findOrFail($id);
                    $smartphones = $smartphones->merge($brand->smartphones);
                }
            }

            if (isset($request->processors))
            {
                foreach ($request->processors as $id) {
                    $processor = Phoneproccessor::findOrFail($id);
                    $smartphones = $smartphones->merge($processor->smartphones);
                }
            }

        }
        return view('smartphone.smartphone_index', ['smartphones'=>$smartphones, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $smartphone = Smartphone::findOrFail($id);
        return view('smartphone.smartphone_show', ['smartphone'=>$smartphone]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
