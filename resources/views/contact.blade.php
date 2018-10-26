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
                        <li class="active">@lang('top_navbar.contact')</li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->
    <div class="container-fluid" style="margin-top: 45px;margin-bottom: 20px;margin-left: 40px;margin-right: 40px;">


        <!-- Section: Contact v.3 -->
    <section class="contact-section my-5">

        <!-- Form with header -->
        <div class="card">

            <!-- Grid row -->
            <div class="row">

                <!-- Grid column -->
                <div class="col-lg-8">

                <form action="{{route('message')}}" method="POST">
                    {{csrf_field()}}
                    <div class="card-body form">

                        <!-- Header -->
                        <h3 class="mt-4"><i class="fa fa-envelope pr-2"></i>@lang('top_navbar.write_to_us'):</h3>

                        <!-- Grid row -->
                        <div class="row">

                            <!-- Grid column -->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" id="form-contact-name" class="form-control" name="fname">
                                    <label for="form-contact-name" class="">@lang('top_navbar.fname'):</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="text" id="form-contact-email" class="form-control" name="lname">
                                    <label for="form-contact-email" class="">@lang('top_navbar.lname'):</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                        <!-- Grid row -->
                        <div class="row">

                            <!-- Grid column -->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="tel" id="form-contact-phone" class="form-control" name="phone">
                                    <label for="form-contact-phone" class="">@lang('top_navbar.phone_number')</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                    <input type="email" id="form-contact-company" class="form-control" name="email">
                                    <label for="form-contact-company" class="">@lang('top_navbar.your_email')</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                        <!-- Grid row -->
                        <div class="row">

                            <!-- Grid column -->
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                    <textarea type="text"  name="message" id="form-contact-message" class="form-control md-textarea" rows="3"></textarea>
                                    <label for="form-contact-message">Your message</label>
                                    <a class="btn-floating btn-lg" type="submit">
                                        <i class="fa fa-send-o " style="font-size: 30px; text-shadow: 4px 2px 10px black;"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                    </div>
                </form>
                </div>

                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-lg-4">
                    <div class="card-body contact text-center h-100 white-text">

                        <h3 class="my-4 pb-2">Contact information</h3>
                        <ul class="text-lg-left list-unstyled ml-4">
                            <li>
                                <p><i class="fa fa-map-marker pr-2"></i>New York, 94126, USA</p>
                            </li>
                            <li>
                                <p><i class="fa fa-phone pr-2"></i>+ 01 234 567 89</p>
                            </li>
                            <li>
                                <p><i class="fa fa-envelope pr-2"></i>contact@example.com</p>
                            </li>
                        </ul>
                        <hr class="hr-light my-4">
                        <ul class="list-inline text-center list-unstyled">
                            <li class="list-inline-item">
                                <a class="p-2 fa-lg tw-ic">
                                    <i class="fa fa-twitter" style="font-size: 30px;"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="p-2 fa-lg li-ic">
                                    <i class="fa fa-linkedin" style="font-size: 30px;"> </i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="p-2 fa-lg ins-ic">
                                    <i class="fa fa-instagram" style="font-size: 30px;"> </i>
                                </a>
                            </li>
                        </ul>

                    </div>

                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row -->

        </div>
        <!-- Form with header -->

    </section>
    </div>
    <div class="container-fluid">
        <div id="map" ></div>
    </div>
@endsection