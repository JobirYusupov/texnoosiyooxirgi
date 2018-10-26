<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class DVD_RW extends Model
{
    use Translatable;
    protected $translatable = ['name', 'price'];
    protected  $table = 'dvd_rws';
}
