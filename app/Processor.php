<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Processor extends Model
{
    use Translatable;
    protected $translatable = [
        'name',
        'description',
//        'price',
//        'rams',
//        'full_description',
//        'Processor_parameters',
//        'Socket',
//        'Number_of_Cores',
//        'Number_of_threads',
//        'Cache_processor',
//        'Chipset',
//        'Ethernet',
//        'USB_2_interface',
//        'USB_3_interface',
//        'Expansion_Slots',
//        'Number_of_memory_slots',
//        'Maximum_amount_of_memory',
//        'Number_of_SATA_connectors',
//        'Output_device_connectors',
//        'System_unit'

        ];

    public function rams()
    {
        return $this->belongsToMany(Ram::class, 'processor_ram', 'processor_id', 'ram_id');
    }
    public function motherboard()
    {
        return $this->belongsTo(Motherboard::class);
    }
}
