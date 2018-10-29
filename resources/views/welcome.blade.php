@extends('layouts.master')

@section('content')
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="{{ asset('./img/shop01.png') }}" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>@lang('top_navbar.laptop_collection')</h3>
                        <a href="{{route('notebooks.index')}}" class="cta-btn">@lang('top_navbar.shop_now') <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="{{ asset('./img/oneplus.png') }}" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>@lang('top_navbar.accessories_collection')</h3>
                        <a href="{{route('smartphones.index')}}" class="cta-btn">@lang('top_navbar.shop_now')<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="{{ asset('./img/Dell.png') }}" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>@lang('top_navbar.camera_collection')</h3>
                        <a href="{{route('protcessor.index')}}" class="cta-btn">@lang('top_navbar.shop_now')<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">@lang('top_navbar.new_pro')</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">@lang('top_navbar.computers')</a></li>
                            <li><a data-toggle="tab" href="#tab2">@lang('top_navbar.notebooks')</a></li>
                            <li><a data-toggle="tab" href="#tab3">@lang('top_navbar.smartphones')</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                @foreach($processors_new as $processor)
                                <!-- product -->

                                    <div class="product">
                                        <div class="product-img">
                                            <img src="{{ asset('storage/'.thumbnail(json_decode($processor->images)[0], 'small')) }}" alt="">
                                            <div class="product-label">
                                            <span class="new">@lang('top_navbar.new')</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="{{ route('protcessor.show', ['id'=>$processor->id]) }}">{{ $processor->getTranslatedAttribute('name') }}</a></h3>
                                            @if($processor->price)
                                                <h4 class="product-price">{{ $processor->full_price }} so'm</h4>
                                            @endif
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Shop now</button>
                                        </div>
                                    </div>
                                <!-- /product -->
                                @endforeach
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab2" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-1">
                            @foreach(\App\Notebook::findMany(\App\NewNotebook::all()->pluck('id')) as $notebook)
                                <!-- product -->

                                    <div class="product">
                                        <div class="product-img">
                                            <img src="{{ asset('storage/'.thumbnail(json_decode($notebook->images)[0], 'small')) }}" alt="">
                                            <div class="product-label">
                                            <span class="new">@lang('top_navbar.new')</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="{{ route('notebooks.show', ['id'=>$notebook->id]) }}">{{ $notebook->getTranslatedAttribute('name')}}</a></h3>
                                            @if($notebook->price)
                                                <h4 class="product-price">{{ $notebook->price }} so'm<del class="product-old-price">{{ $notebook->old_price }} @if($notebook->old_price) so'm @endif</del></h4>
                                            @endif
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Shop now</button>
                                        </div>
                                    </div>
                                    <!-- /product -->
                                @endforeach
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                        <!-- tab -->
                        <div id="tab3" class="tab-pane">
                            <div class="products-slick" data-nav="#slick-nav-1">
                            @foreach(\App\Smartphone::findMany(\App\NewSmartphone::all()->pluck('id')) as $smartphone)
                                <!-- product -->

                                    <div class="product">
                                        <div class="product-img">
                                            <img src="{{ asset('storage/'.thumbnail(json_decode($smartphone->images)[0], 'small')) }}" alt="">
                                            <div class="product-label">
                                            <span class="new">@lang('top_navbar.new')</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            {{--<p class="product-category">Category</p>--}}
                                            <h3 class="product-name"><a href="{{ route('smartphones.show', ['id'=>$smartphone->id]) }}">{{ $smartphone->getTranslatedAttribute('name')}}</a></h3>
                                            @if($smartphone->price)
                                                <h4 class="product-price">{{ $smartphone->price }} so'm<del class="product-old-price">{{ $smartphone->old_price }} @if($smartphone->old_price) so'm @endif</del></h4>
                                            @endif
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Shop now</button>
                                        </div>
                                    </div>
                                    <!-- /product -->
                                @endforeach
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown" id="watch">
                        <script>
                            // Set the date we're counting down to
                            var countDownDate = new Date("Sep 17, 2019 16:59:25").getTime();

                            // Update the count down every 1 second
                            var x = setInterval(function() {

                                // Get todays date and time
                                var now = new Date().getTime();

                                // Find the distance between now and the count down date
                                var distance = countDownDate - now;

                                // Time calculations for days, hours, minutes and seconds
                                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                // Output the result in an element with id="demo"
                                document.getElementById("watch").innerHTML =
                                    "<li><div><h3>"+days + "</h3><span>Days</span></div></li>"+
                                    "<li><div><h3>"+hours + "</h3><span>Hours</span></div></li>"+
                                    "<li><div><h3>"+minutes+ "</h3><span>Mins</span></div></li>"+
                                    "<li><div><h3>"+seconds+ "</h3><span>Secs</span></div></li>";

                                // If the count down is over, write some text
                                if (distance < 0) {
                                    clearInterval(x);
                                    document.getElementById("watch").innerHTML = "<div class='alert' style='font-size:60px; color:darkred;'>"+"Expired"+"</div>";
                                }
                            }, 1000);
                        </script>
                        {{--<li>--}}
                            {{--<div>--}}
                                {{--<h3>02</h3>--}}
                                {{--<span>Days</span>--}}
                            {{--</div>--}}
                        {{--</li>--}}
                        {{--<li>--}}
                            {{--<div>--}}
                                {{--<h3>10</h3>--}}
                                {{--<span>Hours</span>--}}
                            {{--</div>--}}
                        {{--</li>--}}
                        {{--<li>--}}
                            {{--<div>--}}
                                {{--<h3>34</h3>--}}
                                {{--<span>Mins</span>--}}
                            {{--</div>--}}
                        {{--</li>--}}
                        {{--<li>--}}
                            {{--<div>--}}
                                {{--<h3>60</h3>--}}
                                {{--<span>Secs</span>--}}
                            {{--</div>--}}
                        {{--</li>--}}
                    </ul>
                    <h2 class="text-uppercase">hot deal this week</h2>
                    <p>New Collection Up to 50% OFF</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->


<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">@lang('top_navbar.top_selling_computers')</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        @foreach($processors_top as $processor)
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="{{ asset('storage/'.thumbnail(json_decode($processor->images)[0], 'small')) }}" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="{{ route('protcessor.show', ['id'=>$processor->id]) }}">{{ $processor->getTranslatedAttribute('name') }}</a></h3>
                                @if($processor->price)
                                    <h4 class="product-price">{{ $processor->full_price }} so'm<del class="product-old-price">{{ $processor->old_price }} @if($processor->old_price) so'm @endif</del></h4>
                                @endif
                            </div>
                        </div>
                        <!-- /product widget -->
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">@lang('top_navbar.top_selling_notebooks')</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                         @foreach(\App\Notebook::findMany(\App\NewNotebook::all()->pluck('id')) as $notebook)
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="{{ asset('storage/'.thumbnail(json_decode($notebook->images)[0], 'small')) }}" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="{{ route('notebooks.show', ['id'=>$notebook->id]) }}">{{ $notebook->getTranslatedAttribute('name') }}</a></h3>
                                @if($notebook->price)
                                    <h4 class="product-price">{{ $notebook->price }} so'm<del class="product-old-price">{{ $notebook->old_price }} @if($notebook->old_price) so'm @endif</del></h4>
                                @endif
                            </div>
                        </div>
                        <!-- /product widget -->
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">@lang('top_navbar.top_selling_smartphones')</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        @foreach(\App\Smartphone::findMany(\App\NewSmartphone::all()->pluck('id')) as $smartphone)
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="{{ asset('storage/'.thumbnail(json_decode($smartphone->images)[0], 'small')) }}" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="{{ route('smartphones.show', ['id'=>$smartphone->id]) }}">{{ $smartphone->getTranslatedAttribute('name')}}</a></h3>
                                @if($smartphone->price)
                                    <h4 class="product-price">{{ $smartphone->price }} so'm<del class="product-old-price">{{ $smartphone->old_price }} @if($smartphone->old_price) so'm @endif</del></h4>
                                @endif
                            </div>
                        </div>
                        <!-- /product widget -->
                        @endforeach
                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

@endsection
