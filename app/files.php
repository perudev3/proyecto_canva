<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class files extends Model
{
    protected $fillable = [
        'categories_id',
        'files_name',
        'files_url',
        'files_date',
        'files_portada',
        'publish_content',
        'files_status',
    ];

    protected $primaryKey ="files_id";
}
