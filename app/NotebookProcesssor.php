<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class NotebookProcesssor extends Model
{
    use Translatable;
    protected $translatable = [
        'name'
    ];
    protected $fillable=['name'];

    public function notebooks()
    {
        return $this->hasMany(Notebook::class, 'processor_id', 'id');
    }
}
