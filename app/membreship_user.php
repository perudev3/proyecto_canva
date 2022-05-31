<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class membreship_user extends Model
{
    protected $fillable = [
        'membership_id',
        'user_id',
        'membership_user_date',
        'membership_user_status'
    ];

    protected $primaryKey ="membership_user_id";
}
