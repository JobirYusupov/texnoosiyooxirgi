<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class TopNotebook extends Model
{
    use Translatable;
    protected $translatable = ['notebooks'];
}