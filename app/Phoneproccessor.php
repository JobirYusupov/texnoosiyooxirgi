<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Phoneproccessor extends Model
{
    use Translatable;
    protected $translatable = [
        'name'
    ];
    public function smartphones()
    {
        return $this->hasMany(Smartphone::class);
    }
}