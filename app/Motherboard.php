<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class Motherboard extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'price'
    ];
    public function processors()
    {
        return $this->hasMany(Processor::class);
    }
}
