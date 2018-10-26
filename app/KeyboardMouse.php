<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class KeyboardMouse extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'price'
    ];
    protected $table='keyboard_mouses';
}
