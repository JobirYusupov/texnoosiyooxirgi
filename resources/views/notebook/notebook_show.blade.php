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
                        <li><a href="{{ route('notebooks.index') }}">@lang('top_navbar.notebooks')</a></li>
                        <li class="active">{{ $notebook->name }}</li>
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
                        @foreach(json_decode($notebook->images) as $image)
                        <div class="product-preview">
                            <img src="{{ asset('storage/'.$image) }}" alt="">
                        </div>
                        @endforeach
                    </div>
                </div>
                <!-- /Product main img -->

                <!-- Product thumb imgs -->
                <div class="col-md-2  col-md-pull-5">
                    <div id="product-imgs">
                        @foreach(json_decode($notebook->images) as $image)
                        <div class="product-preview">
                            <img src="{{ asset('storage/'.thumbnail($image, 'small')) }}" alt="">
                        </div>
                        @endforeach
                    </div>
                </div>
                <!-- /Product thumb imgs -->

                <!-- Product details -->
                <div class="col-md-5">
                    <div class="product-details">
                        <h2 class="product-name">{{ $notebook->getTranslatedAttribute('name')}}</h2>
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
                            <h3 class="product-price">{{ $notebook->price }} so'm</h3>
                            {{--<span class="product-available">In Stock</span>--}}
                        </div>
                        <p>{!! $notebook->getTranslatedAttribute('description') !!}</p>

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
                            <li><a data-toggle="tab" href="#tab2">@lang('top_navbar.all_categories')</a></li>
                        </ul>
                        <!-- /product tab nav -->

                        <!-- product tab content -->
                        <div class="tab-content">
                            <!-- tab1  -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>{!! $notebook->getTranslatedAttribute('full_description') !!}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab1  -->

                            <!-- tab2  -->
                            <div id="tab2" class="tab-pane fade in">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover small table-small">
                                            <tr><td>Производитель</td><td>{{ $notebook->brand->name  }}</td></tr>
                                            <tr><td>Процессор</td><td>{{ $notebook->processor->name }}</td></tr>
                                            <tr><td>Параметры процессора:</td><td>{{ $notebook->Processor_parameters }}</td></tr>
                                            <tr><td>Количество ядер</td><td>{{ $notebook->Number_of_Cores }}</td></tr>
                                            <tr><td>Количество потоков</td><td>{{ $notebook->Number_of_threads }}</td></tr>
                                            <tr><td>Кэш процессората</td><td>{{ $notebook->Cache_processor }}</td></tr>
                                            <tr><td>Видеокарта</td><td>{{ $notebook->Video_card }}</td></tr>
                                            <tr><td>Видеокарта параметры</td><td>{{ $notebook->Video_card_options }}</td></tr>
                                            <tr><td>Оперативная память:</td><td>{{ $notebook->RAM }}</td></tr>
                                            <tr><td>Тип оперативной памяти:</td><td>{{ $notebook->Type_of_RAM }}</td></tr>
                                            <tr><td>Жесткий диск</td><td>{{ $notebook->HDD }}</td></tr>
                                            <tr><td>Ethernet</td><td>{{ $notebook->Ethernet }}</td></tr>
                                            <tr><td>Интерфейс USB 2.0</td><td>{{ $notebook->USB_2_interface }}</td></tr>
                                            <tr><td>Интерфейс USB 3.0</td><td>{{ $notebook->USB_3_interface }}</td></tr>
                                            <tr><td>Разъемы устройств вывода на дисплей</td><td>{{ $notebook->Output_device_connectors }}</td></tr>
                                            <tr><td>DVD-RW</td><td>{{ $notebook->DVD_RW }}</td></tr>
                                            <tr><td>Web-камера:</td><td>{{ $notebook->Web_Cams }}</td></tr>
                                            <tr><td>CardReader</td><td>{{ $notebook->CardReader }}</td></tr>
                                            <tr><td>Bluetooth</td><td>{{ $notebook->Bluetooth }}</td></tr>
                                            <tr><td>Wi-Fi</td><td>{{ $notebook->Wi_Fi }}</td></tr>
                                            <tr><td>Встроенный микрофон</td><td>{{ $notebook->Built_in_microphone }}</td></tr>
                                            <tr><td>Колонки</td><td>{{ $notebook->Speakers }}</td></tr>
                                            <tr><td>Операционная система</td><td>{{ $notebook->operating_system }}</td></tr>
                                            <tr><td>Размер</td><td>{{ $notebook->size }}</td></tr>
                                            <tr><td>Тип экрана</td><td>{{ $notebook->Screen_Type }}</td></tr>
                                            <tr><td>Разрешение экрана</td><td>{{ $notebook->Screen_resolution }}</td></tr>
                                            <tr><td>Тип батареи</td><td>{{ $notebook->Battery_Type }}</td></tr>
                                            <tr><td>Цвет</td><td>{{ $notebook->Colour }}</td></tr>
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
