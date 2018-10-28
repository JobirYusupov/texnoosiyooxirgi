<div class="col-md-6">
    <div class="header-search" style="z-index: 5;">
        <form method="GET" action="{{ route('search') }}">
            @csrf
            <select class="input-select" name="category" id="categories_select">
                <option value="smartphones">@lang('top_navbar.smartphones')</option>
                <option value="notebooks">@lang('top_navbar.notebooks')</option>
                <option value="personal_computer">@lang('top_navbar.personal_computer')</option>
            </select>
            <input class="input" name="search" id="search" placeholder="@lang('top_navbar.search_here')" autocomplete="off" title="@lang('top_navbar.info')">
            <button class="search-btn">@lang('top_navbar.search')</button>
        </form>
    </div>
</div>