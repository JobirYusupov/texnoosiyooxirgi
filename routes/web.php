<?php

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

Route::get('/', function () {
    $processors_new = \App\Processor::findMany(\App\NewComputer::all()->pluck('id'));

    foreach ($processors_new as $processor)
    {
        $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
    }

    $processors_top = \App\Processor::findMany(\App\TopComputer::all()->pluck('id'));

    foreach ($processors_top as $processor)
    {
        $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
    }

    return view('welcome', ['processors_new'=>$processors_new, 'processors_top'=>$processors_top]);
})->name('welcome');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/posts', function (){
    app()->setLocale('en');
    $posts = \TCG\Voyager\Models\Post::firstOr();
    return $posts->getTranslatedAttribute('body');
});

Route::resource('/protcessor', 'ProcessorController');

Route::post('/sort_pc', 'ProcessorController@sort_pc')->name('sort_pc');

Route::resource('/notebooks', 'NotebookController');

Route::resource('/smartphones', 'SmartphoneController');

Route::get('/lang/{lang}', function ($lang) {
//    App::setLocale($locale);

//    $processors_new = \App\Processor::findMany(\App\NewComputer::all()->pluck('id'));
//
//    foreach ($processors_new as $processor)
//    {
//        $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
//    }
//
//    $processors_top = \App\Processor::findMany(\App\TopComputer::all()->pluck('id'));
//
//    foreach ($processors_top as $processor)
//    {
//        $processor->full_price = $processor->price+$processor->motherboard->price+\App\DVD_RW::firstOr()->price+\App\Ram::firstOr()->price+\App\Hdd::firstOr()->price+\App\KeyboardMouse::firstOr()->price+\App\VideoCard::firstOr()->price+\App\EnclosureAndPowerSuppli::firstOr()->price+\App\Monitor::firstOr()->price+\App\NetworkFilter::firstOr()->price+\App\Headphone::firstOr()->price+\App\Speaker::firstOr()->price;
//    }
    Session::put('locale',$lang);
    return redirect()->back();
//    return view('welcome', ['processors_new'=>$processors_new, 'processors_top'=>$processors_top]);
})->name('lang');

Route::get('/contact', function (){
    return view('contact');
})->name('contact');

Route::post('/creatmessage', 'NotebookController@store')->name('message');

Route::get('/search/smartphones', 'SearchController@smartphones');
Route::get('/search/notebooks', 'SearchController@notebooks');
Route::get('/search/personal_computer', 'SearchController@personal_computer');
Route::get('/search', 'SearchController@search')->name('search');