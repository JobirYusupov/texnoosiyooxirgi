<!doctype html>
<html lang="{{session()->get('locale')}}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ setting('site.title') }}</title>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="{{ asset('css/slick.css') }}"/>
    <link type="text/css" rel="stylesheet" href="{{ asset('css/slick-theme.css') }}"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="{{ asset('css/nouislider.min.css') }}"/>
    <link rel="stylesheet" href="{{asset('css/font-awesome.min.css')}}">

    <link href="{{asset('css/custom.css')}}" rel="stylesheet">
    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="{{ asset('css/style.css') }}"/>
    <style>
        .twitter-typeahead,
        .tt-hint,
        .tt-input,
        .tt-menu{
            transform: translate(0px, -12.3%);
            width: auto ! important;
            font-weight: normal;
        }
    </style></head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> {{ setting('site.phone_number') }}</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> {{ setting('site.email') }}</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> {{ setting('site.address') }}</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                <li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="{{ route('welcome') }}" class="logo">
                            <img src="{{ asset('img/texno.png') }}" class="img ml-auto" style="width: 100px;" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->

                @include('layouts.partian.search')

                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <div>
                            <ul class="header-links pull-right">
                                <li><div @if(session()->get('locale') == 'uz') class="badge badge-primary" size='2em' @endif><a href="{{ route('lang', ['lang'=>'uz']) }}">UZ</a></div></li>
                                <li><div @if(session()->get('locale') == 'ru') class="badge badge-danger" @endif><a href="{{ route('lang', ['lang'=>'ru']) }}">RU</a></div></li>
                                <li><div @if(session()->get('locale') == 'en') class="badge badge-danger" @endif><a href="{{ route('lang', ['lang'=>'en']) }}">EN</a></div></li>
                            </ul>
                        </div>
                        <!-- Wishlist -->
                        {{--<div>--}}
                            {{--<a href="#">--}}
                                {{--<i class="fa fa-heart-o"></i>--}}
                                {{--<span>Your Wishlist</span>--}}
                                {{--<div class="qty">2</div>--}}
                            {{--</a>--}}
                        {{--</div>--}}
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        {{--<div class="dropdown">--}}
                            {{--<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">--}}
                                {{--<i class="fa fa-shopping-cart"></i>--}}
                                {{--<span>Your Cart</span>--}}
                                {{--<div class="qty">3</div>--}}
                            {{--</a>--}}
                            {{--<div class="cart-dropdown">--}}
                                {{--<div class="cart-list">--}}
                                    {{--<div class="product-widget">--}}
                                        {{--<div class="product-img">--}}
                                            {{--<img src="./img/product01.png" alt="">--}}
                                        {{--</div>--}}
                                        {{--<div class="product-body">--}}
                                            {{--<h3 class="product-name"><a href="#">product name goes here</a></h3>--}}
                                            {{--<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>--}}
                                        {{--</div>--}}
                                        {{--<button class="delete"><i class="fa fa-close"></i></button>--}}
                                    {{--</div>--}}

                                    {{--<div class="product-widget">--}}
                                        {{--<div class="product-img">--}}
                                            {{--<img src="./img/product02.png" alt="">--}}
                                        {{--</div>--}}
                                        {{--<div class="product-body">--}}
                                            {{--<h3 class="product-name"><a href="#">product name goes here</a></h3>--}}
                                            {{--<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>--}}
                                        {{--</div>--}}
                                        {{--<button class="delete"><i class="fa fa-close"></i></button>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                                {{--<div class="cart-summary">--}}
                                    {{--<small>3 Item(s) selected</small>--}}
                                    {{--<h5>SUBTOTAL: $2940.00</h5>--}}
                                {{--</div>--}}
                                {{--<div class="cart-btns">--}}
                                    {{--<a href="#">View Cart</a>--}}
                                    {{--<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>@lang('top_navbar.menu')</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
    @include('navbars.top_navbar')
<!-- NAVIGATION -->

@yield('content')

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">@lang('top_navbar.about_us')</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>{{ setting('site.address')   }}</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>{{ setting('site.phone_number') }}</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>{{ setting('site.email') }}</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">@lang('top_navbar.categories')</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">@lang('top_navbar.information')</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">@lang('top_navbar.service')</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-facebook-official bg-primary"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.min.js') }}"></script>
<!-- Import typeahead.js -->
<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>

<script src="{{ asset('js/slick.min.js') }}"></script>
<script src="{{ asset('js/nouislider.min.js') }}"></script>
<script src="{{ asset('js/jquery.zoom.min.js') }}"></script>
<script src="{{ asset('js/main.js')}}"></script>


<!-- Initialize typeahead.js on the input -->
<script src="{{ asset('js/autocomplate.js') }}"></script>

@yield('script')

</body>
</html>