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
                        <li><a href="{{ route('welcome') }}">Home</a></li>
                        <li><a href="{{ route('smartphones.index') }}">Smartphone</a></li>
                        <li class="active">{{ $smartphone->name }}</li>
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
                        @foreach(json_decode($smartphone->images) as $image)
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
                        @foreach(json_decode($smartphone->images) as $image)
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
                        <h2 class="product-name">{{ $smartphone->name }}</h2>
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
                            <h3 class="product-price">{{ $smartphone->price }} so'm</h3>
                            {{--<span class="product-available">In Stock</span>--}}
                        </div>
                        <p>{!! $smartphone->description !!}</p>

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
                            <li class="active"><a data-toggle="tab" href="#tab1">Описание</a></li>
                            <li><a data-toggle="tab" href="#tab2">Все характеристики</a></li>
                        </ul>
                        <!-- /product tab nav -->

                        <!-- product tab content -->
                        <div class="tab-content">
                            <!-- tab1  -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>{!! $smartphone->full_description !!}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab1  -->

                            <!-- tab2  -->
                            <div id="tab2" class="tab-pane fade in">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover small table-small">
                                            <tr><td>Модель</td><td>{{ $smartphone->Model  }}</td></tr>
                                            <tr><td>Процессор</td><td>{{ $smartphone->phoneproccessor->name }}</td></tr>
                                            <tr><td>Видеоускоритель</td><td>{{ $smartphone->Video_Accelerator }}</td></tr>
                                            <tr><td>Оперативная память</td><td>{{ $smartphone->RAM }}</td></tr>
                                            <tr><td>Внутренняя память</td><td>{{ $smartphone->Inner_memory }}</td></tr>
                                            <tr><td>Память SD</td><td>{{ $smartphone->SD_Memory }}</td></tr>
                                            <tr><td>Дисплей</td><td>{{ $smartphone->Display }}</td></tr>
                                            <tr><td>Основная камера</td><td>{{ $smartphone->Main_camera }}</td></tr>
                                            <tr><td>Фронтальная камера</td><td>{{ $smartphone->Front_camera }}</td></tr>
                                            <tr><td>Аккумулятор</td><td>{{ $smartphone->Battery }}</td></tr>
                                            <tr><td>Поддержка cетей</td><td>{{ $smartphone->Network_Support }}</td></tr>
                                            <tr><td>Тип SIM-карты</td><td>{{ $smartphone->SIM_card_type }}</td></tr>
                                            <tr><td>OS. Android version</td><td>{{ $smartphone->OS_Android_version }}</td></tr>
                                            <tr><td>Размеры и вес</td><td>{{ $smartphone->Dimensions_and_weight }}</td></tr>
                                            <tr><td>Bluetooth</td><td>{{ $smartphone->Bluetooth }}</td></tr>
                                            <tr><td>Wi-Fi</td><td>{{ $smartphone->Wi_Fi }}</td></tr>
                                            <tr><td>Сканер отпечатка пальцев:</td><td>{{ $smartphone->Fingerprint_reader }}</td></tr>
                                            <tr><td>Стандарт USB</td><td>{{ $smartphone->USB_standard }}</td></tr>
                                            <tr><td>Поддержка USB OTG</td><td>{{ $smartphone->Support_USB_OTG }}</td></tr>
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
