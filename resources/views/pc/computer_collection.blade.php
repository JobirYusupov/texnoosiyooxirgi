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
                        <li class="active">@lang('top_navbar.personal_computer') ({{ count($processors) }})</li>
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
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <form action="{{ route('sort_pc') }}" method="post">
                        @csrf
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">@lang('top_navbar.processor')</h3>
                        <div class="checkbox-filter">
                            @foreach(\App\Processor::all() as $item)
                            <div class="input-checkbox">
                                <input type="checkbox" name="processors[]" id="{{ $item->name }}" value="{{ $item->id }}">
                                <label for="{{ $item->name }}">
                                    <span></span>
                                    {{ $item->getTranslatedAttribute('name') }}
                                    <small>(1)</small>
                                </label>
                            </div>
                            @endforeach

                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <span id="get_full_price_min" class="hidden">{{$full_price_min}}</span>
                    <span id="get_full_price_max" class="hidden">{{$full_price_max}}</span>

                    <div class="aside">
                        <h3 class="aside-title">@lang('top_navbar.price')</h3>
                        <div class="price-filter">
                            <div id="price-slider"></div>
                            <div class="input-number price-min">
                                <input id="price-min" name="price_min" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" name="price_max" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">@lang(' ')</h3>
                        <div class="checkbox-filter">
                            @foreach(\App\Motherboard::all() as $item)
                                <div class="input-checkbox">
                                    <input type="checkbox" name="motherboards[]" value="{{ $item->id }}" id="{{ $item->name }}">
                                    <label for="{{ $item->name }}">
                                        <span></span>
                                        {{ $item->getTranslatedAttribute('name') }}
                                        <small>({{ count($item->processors) }})</small>
                                    </label>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <!-- /aside Widget -->
                            <input type="submit" class="btn btn-lg btn-danger" value="FILTIR">
                    </form>

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">@lang('top_navbar.top_selling')</h3>
                        <div>
                        @foreach($processors_top as $processor)
                            <!-- product widget -->
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="{{ asset('storage/'.thumbnail(json_decode($processor->images)[0], 'small')) }}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="{{ route('protcessor.show', ['id'=>$processor->id]) }}">{{ $processor->name }}</a></h3>
                                        @if($processor->price)
                                            <h4 class="product-price">{{ $processor->full_price }} so'm<del class="product-old-price">{{ $processor->old_price }} @if($processor->old_price) so'm @endif</del></h4>
                                        @endif
                                    </div>
                                </div>
                                <!-- /product widget -->
                            @endforeach
                        </div>
                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">

                    <!-- store products -->
                    <div class="row">
                        @foreach($processors as $processor)
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="{{ asset('storage/'.thumbnail(json_decode($processor->images)[0], 'small')) }}" alt="">
                                    {{--<div class="product-label">--}}
                                        {{--<span class="sale">-30%</span>--}}
                                        {{--<span class="new">NEW</span>--}}
                                    {{--</div>--}}
                                </div>
                                <div class="product-body">
                                    {{--<p class="product-category">Category</p>--}}
                                    <h3 class="product-name"><a href="{{ route('protcessor.show', ['id'=>$processor->id]) }}">{{ $processor->name }}</a></h3>
                                    @if($processor->price)
                                        <h4 class="product-price">{{ $processor->full_price }} so'm</h4>
                                    @endif
                                    {{--<div class="product-rating">--}}
                                        {{--<i class="fa fa-star"></i>--}}
                                        {{--<i class="fa fa-star"></i>--}}
                                        {{--<i class="fa fa-star"></i>--}}
                                        {{--<i class="fa fa-star"></i>--}}
                                        {{--<i class="fa fa-star"></i>--}}
                                    {{--</div>--}}
                                    {{--<div class="product-btns">--}}
                                        {{--<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--}}
                                        {{--<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--}}
                                        {{--<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--}}
                                    {{--</div>--}}
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                            @endforeach
                    </div>
                    <!-- /store products -->

                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

@endsection