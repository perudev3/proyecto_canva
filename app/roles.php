<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class roles extends Model
{
    protected $fillable = [
        'roles_name'
    ];

    protected $primaryKey ="roles_id";
}
