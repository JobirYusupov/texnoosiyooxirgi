<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
class Notebook extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'description',
        'full_description',
        'old_price',
        'price',
        'brands',
        'notebook_processsors',
        'Processor_parameters',
        'Number_of_Cores',
        'Number_of_threads',
        'Cache_processor',
        'Video_card',
        'Video_card_options',
        'RAM',
        'Type_of_RAM',
        'HDD',
        'Ethernet',
        'USB_2_interface',
        'USB_3_interface',
        'Output_device_connectors',
        'DVD_RW',
        'Web_Cams',
        'CardReader',
        'Bluetooth',
        'Wi_Fi',
        'Built_in_microphone',
        'Speakers',
        'operating_system',
        'size',
        'Screen_Type',
        'Screen_resolution',
        'Battery_Type',
        'Color'



    ];
    protected $fillable =  ['name', 'price', 'description', 'full_description', 'images'];
    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }
    public function processor()
    {
        return $this->belongsTo(Processor::class);
    }
}
