<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Smartphone extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'description',
        'price',
        'old_price',
        'full_description',
        'phoneprocessors',
        'phonebrands',
        'Model',
        'Video_Accelerator',
        'RAM',
        'Inner_memory',
        'SD_Memory',
        'Display',
        'Main_camera',
        'Front_camera',
        'Battery',
        'Network_Support',
        'SIM_card_type',
        'OS_Android_version',
        'Dimensions_and_weight',
        'Bluetooth',
        'Wi_Fi',
        'Fingerprint_reader',
        'USB_standard',
        'Support_USB_OTG'
    ];
    protected $fillable=['name', 'price', 'description', 'fulldescription'];
    public function phoneproccessor()
    {
        return $this->belongsTo(Phoneproccessor::class);
    }
}
