<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class file extends Model
{
    protected $fillable = [
        'binder_id',
        'file_url',
        'file_date',
        'file_status',
    ];

    protected $primaryKey ="file_id";
}
