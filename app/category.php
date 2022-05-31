<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    protected $fillable = [
        'categories_name',
        'categories_status',
    ];

    protected $primaryKey ="categories_id";
}
