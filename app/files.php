<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class files extends Model
{
    protected $fillable = [
        'files_name',
        'files_url',
        'files_date',
        'files_portada',
        'files_status',
    ];

    protected $primaryKey ="files_id";
}
