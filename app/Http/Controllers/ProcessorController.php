<?php

namespace App\Http\Controllers;

use App\Motherboard;
use App\NewComputer;
use App\Processor;
use App\TopComputer;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ProcessorController extends Controller
{
    public function index()
    {
        $processors = Processor::Latest()->get();

        foreach ($processors as $processor)
        {
            $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
        }
        $full_price_min = $processors->min('full_price');
        $full_price_max = $processors->max('full_price');
//        $full_price_min = $processors[0]->full_price;
//        $full_price_max = $processors[0]->full_price;
//        foreach ($processors as $processor)
//        {
//            if ($processor->full_price < $full_price_min)
//                $full_price_min = $processor->full_price;
//            if ($processor->full_price > $full_price_max)
//                $full_price_max = $processor->full_price;
//        }
        $processors_top = Processor::findMany(TopComputer::all()->pluck('id'));

        foreach ($processors_top as $processor)
        {
            $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
        }

        return view('pc.computer_collection', ['processors'=>$processors, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max, 'processors_top'=>$processors_top]);
    }


    public function sort_pc(Request $request)
    {
        $processors = Processor::Latest()->get();

        foreach ($processors as $processor)
        {
            $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
        }

        $full_price_min = $processors->min('full_price');
        $full_price_max = $processors->max('full_price');

        //$processors = $processors->whereIn('full_price', [1509000.0]);

        //floatval($request->price_max)
        $processors = $processors->filter(function ($item) use ($request){
            return $item->full_price >= floatval($request->price_min) and $item->full_price <= floatval($request->price_max);
        });

        if (isset($request->motherboards))
        {
            foreach ($request->motherboards as $id)
            {
                $motherboard = Motherboard::findOrFail($id);
                $processors = $processors->merge($motherboard->processors);
            }
        }

        if ($request->processors)
        {
            $processors = $processors->merge(Processor::findMany($request->processors));
        }


        $processors = $processors->unique()->values()->all();

        foreach ($processors as $processor)
        {
            $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
        }

        return view('pc.computer_collection', ['processors'=>$processors, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max]);
    }

    public function show($id)
    {
        $processor = Processor::findOrFail($id);
        return view('pc.product', ['processor'=>$processor]);
    }
}
