<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class membreship extends Model
{
    protected $fillable = [
        'membership_name',
        'membership_description',
        'membership_price',
        'membership_status'
    ];

    protected $primaryKey ="membership_id";
}
