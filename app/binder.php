<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class binder extends Model
{
    protected $fillable = [
        'binder_name',
        'binder_date',
        'user_id',
        'binder_status',
    ];

    protected $primaryKey ="binder_id";
}
