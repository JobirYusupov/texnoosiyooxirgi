@extends('layouts.master')

@section('content')

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb-tree">
                        <li><a href="{{ route('welcome') }}">@lang('top_navbar.home')</a></li>
                        <li><a href="{{ route('protcessor.index') }}">@lang('top_navbar.personal_computer')</a></li>
                        <li class="active">{{ $processor->getTranslatedAttribute('name') }}</li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- Product main img -->
                <div class="col-md-5 col-md-push-2">
                    <div id="product-main-img">
                        @if($processor->images)
                        @foreach(json_decode($processor->images) as $image)
                        <div class="product-preview">
                            <img src="{{ asset('storage/'.$image) }}" alt="">
                        </div>
                        @endforeach
                        @endif
                    </div>
                </div>
                <!-- /Product main img -->

                <!-- Product thumb imgs -->
                <div class="col-md-2  col-md-pull-5">
                    <div id="product-imgs">
                        @if($processor->images)
                        @foreach(json_decode($processor->images) as $image)
                        <div class="product-preview">
                            <img src="{{ asset('storage/'.thumbnail($image, 'small')) }}" alt="">
                        </div>
                        @endforeach
                        @endif
                    </div>
                </div>
                <!-- /Product thumb imgs -->

                <!-- Product details -->
                <div class="col-md-5">
                    <div class="product-details">
                        <h2 class="product-name">{{ $processor->getTranslatedAttribute('name') }}</h2>
                        {{--<div>--}}
                            {{--<div class="product-rating">--}}
                                {{--<i class="fa fa-star"></i>--}}
                                {{--<i class="fa fa-star"></i>--}}
                                {{--<i class="fa fa-star"></i>--}}
                                {{--<i class="fa fa-star"></i>--}}
                                {{--<i class="fa fa-star-o"></i>--}}
                            {{--</div>--}}
                            {{--<a class="review-link" href="#">10 Review(s) | Add your review</a>--}}
                        {{--</div>--}}
                        <div>
                            <h3 class="product-price">{{ $processor->price }} so'm</h3>
                            <p class="hidden">{{ $processor->price }}</p>
                            {{--<span class="product-available">In Stock</span>--}}
                        </div>
                        <p>{!! $processor->getTranslatedAttribute('description') !!}</p>

                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="dvd-rw">@lang('pro_info.dvd_rw'):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="dvd-rw" class="form-control calculator">
                                    @foreach(\App\DVD_RW::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="ram">@lang('pro_info.ram'):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="ram" class="form-control calculator">
                                    @foreach($processor->rams as $item)
                                    <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="hdd">@lang('pro_info.disc'):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="hdd" class="form-control calculator">
                                    @foreach(\App\Hdd::all() as $item)
                                    <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="keyboard">@lang('pro_info.keyb_mouse'):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="keyboard" class="form-control calculator">
                                    @foreach(\App\KeyboardMouse::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="videocard">@lang('pro_info.video_card'):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="videocard" class="form-control calculator">
                                    @foreach(\App\VideoCard::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="enclosure">Корпус и блок питания:</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="enclosure" class="form-control calculator">
                                    @foreach(\App\EnclosureAndPowerSuppli::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="monitor">Монитор:</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="monitor" class="form-control calculator">
                                    @foreach(\App\Monitor::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="filter">Сетевой фильтр (пилот):</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="filter" class="form-control calculator">
                                    @foreach(\App\NetworkFilter::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="headphone">Наушники:</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="headphone" class="form-control calculator">
                                    @foreach(\App\Headphone::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-4 text-right">
                                <label for="speaker">Колонки:</label>
                            </div>
                            <div class="col-md-8">
                                <select name="" id="speaker" class="form-control calculator">
                                    @foreach(\App\Speaker::all() as $item)
                                        <option value="{{ $item->price }}">{{ $item->getTranslatedAttribute('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>


                        {{--<div class="add-to-cart">--}}
                            {{--<div class="qty-label">--}}
                                {{--Qty--}}
                                {{--<div class="input-number">--}}
                                    {{--<input type="number">--}}
                                    {{--<span class="qty-up">+</span>--}}
                                    {{--<span class="qty-down">-</span>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            {{--<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>--}}
                        {{--</div>--}}

                        {{--<ul class="product-btns">--}}
                            {{--<li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>--}}
                            {{--<li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>--}}
                        {{--</ul>--}}

                        {{--<ul class="product-links">--}}
                            {{--<li>Category:</li>--}}
                            {{--<li><a href="#">Headphones</a></li>--}}
                            {{--<li><a href="#">Accessories</a></li>--}}
                        {{--</ul>--}}

                        {{--<ul class="product-links">--}}
                            {{--<li>Share:</li>--}}
                            {{--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--}}
                            {{--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--}}
                            {{--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--}}
                            {{--<li><a href="#"><i class="fa fa-envelope"></i></a></li>--}}
                        {{--</ul>--}}

                    </div>
                </div>
                <!-- /Product details -->

                <!-- Product tab -->
                <div class="col-md-12">
                    <div id="product-tab">
                        <!-- product tab nav -->
                        <ul class="tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">@lang('top_navbar.description')</a></li>
                            <li><a data-toggle="tab" href="#tab2">@lang('top_navbar.all_features')</a></li>
                        </ul>
                        <!-- /product tab nav -->

                        <!-- product tab content -->
                        <div class="tab-content">
                            <!-- tab1  -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>{!! $processor->getTranslatedAttribute('full_description') !!}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab1  -->

                            <!-- tab2  -->
                            <div id="tab2" class="tab-pane fade in">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover small table-small">
                                            <tr><td>Параметры процессора</td><td>{{ $processor->Processor_parameters }}</td></tr>
                                            <tr><td>Socket</td><td>{{ $processor->Socket }}</td></tr>
                                            <tr><td>Количество ядер:</td><td>{{ $processor->Number_of_Cores }}</td></tr>
                                            <tr><td>Количество потоков</td><td>{{ $processor->Number_of_threads }}</td></tr>
                                            <tr><td>Кэш процессора:</td><td>{{ $processor->Cache_processor }}</td></tr>
                                            <tr><td>Материнская плата</td><td>{{ $processor->Motherboard->name }}</td></tr>
                                            <tr><td>Чипсет</td><td>{{ $processor->Chipset }}</td></tr>
                                            <tr><td>Ethernet</td><td>{{ $processor->Ethernet }}</td></tr>
                                            <tr><td>Интерфейс USB 2.0:</td><td>{{ $processor->USB_2_interface }}</td></tr>
                                            <tr><td>Интерфейс USB 3.0:</td><td>{{ $processor->USB_3_interface }}</td></tr>
                                            <tr><td>Слоты расширения:</td><td>{{ $processor->Expansion_Slots }}</td></tr>
                                            <tr><td>Количество слотов памяти</td><td>{{ $processor->Number_of_memory_slots }}</td></tr>
                                            <tr><td>Максимальный объем памяти:</td><td>{{ $processor->Maximum_amount_of_memory }}</td></tr>
                                            <tr><td>Количество разъемов SATA</td><td>{{ $processor->Number_of_SATA_connectors }}</td></tr>
                                            <tr><td>Разъемы устройств вывода на дисплей:</td><td>{{ $processor->Output_device_connectors }}</td></tr>
                                            <tr><td>Системный блок</td><td>{{ $processor->System_unit }}</td></tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab2  -->
                        </div>
                        <!-- /product tab content  -->
                    </div>
                </div>
                <!-- /product tab -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

@endsection
@section('script')
    <script>
        $(document).ready(function(){
            var summ = parseInt($("p.hidden").text());
            $("select.calculator").each(function () {
                summ+=parseInt($(this).val());
            });
            summ += " so'm";
            $(".product-price").text(summ);

            $("select.calculator").change(function(){
                var summ = parseInt($("p.hidden").text());
                $("select.calculator").each(function () {
                    summ+=parseInt($(this).val());
                });
                summ += " so'm";
                $(".product-price").text(summ);
            });
        });
    </script>
@endsection