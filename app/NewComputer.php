<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class NewComputer extends Model
{
    use Translatable;
    protected $translatable =  [
        'processors'
    ];
}
