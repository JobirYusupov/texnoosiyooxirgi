<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class TopComputer extends Model
{
    use Translatable;
    protected $translatable = ['processors'];
}
