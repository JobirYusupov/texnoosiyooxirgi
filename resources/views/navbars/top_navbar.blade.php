
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="{{ route('welcome') }}">@lang('top_navbar.home')</a></li>
                <li><a href="{{ route('contact') }}">@lang('top_navbar.contact')</a></li>
                <li><a href="{{ route('smartphones.index') }}">@lang('top_navbar.smartphones')</a></li>
                <li><a href="{{ route('notebooks.index') }}">@lang('top_navbar.notebooks')</a></li>
                <li><a href="{{ route('protcessor.index') }}">@lang('top_navbar.personal_computer')</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->