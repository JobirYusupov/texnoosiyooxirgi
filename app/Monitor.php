<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Monitor extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'price'
    ];
}
