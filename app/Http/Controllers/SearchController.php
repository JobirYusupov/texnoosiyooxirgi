<?php

namespace App\Http\Controllers;

use App\Notebook;
use App\Processor;
use App\Smartphone;
use App\TopComputer;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function smartphones(Request $request)
    {
        return Smartphone::where('name', 'LIKE', '%'.$request->q.'%')->get();
    }

    public function notebooks(Request $request)
    {
        return Notebook::where('name', 'LIKE', '%'.$request->q.'%')->get();
    }

    public function personal_computer(Request $request)
    {
        return Processor::where('name', 'LIKE', '%'.$request->q.'%')->get();
    }

    public function search(Request $request)
    {
        if ($request->category == 'smartphones')
        {
            $smartphones = Smartphone::where('name', 'LIKE', '%'.$request->search.'%')->get();
            $full_price_min = Smartphone::all()->min('price');
            $full_price_max = Smartphone::all()->max('price');
            return view('smartphone.smartphone_index', ['smartphones'=>$smartphones, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max]);
        }

        if ($request->category == 'notebooks')
        {
            $notebooks = Notebook::where('name', 'LIKE', '%'.$request->search.'%')->get();
            $full_price_min = Notebook::all()->min('price');
            $full_price_max = Notebook::all()->max('price');
            return view('notebook.notebook_index', ['notebooks'=>$notebooks, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max]);
        }

        if ($request->category == 'personal_computer')
        {
            $processors = Processor::Latest()->get();

            foreach ($processors as $processor)
            {
                $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
            }
            $full_price_min = $processors->min('full_price');
            $full_price_max = $processors->max('full_price');

            $processors = Processor::where('name', 'LIKE', '%'.$request->search.'%')->get();
            $processors_top = Processor::findMany(TopComputer::all()->pluck('id'));

            foreach ($processors_top as $processor)
            {
                $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
            }

            return view('pc.computer_collection', ['processors'=>$processors, 'full_price_min'=>$full_price_min, 'full_price_max'=>$full_price_max, 'processors_top'=>$processors_top]);
        }
    }

}
