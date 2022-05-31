<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class response_job_offer extends Model
{
    protected $fillable = [
        'poll_job_offer_response',
        'poll_job_offer_id',
        'user_id',
    ];

    protected $primaryKey ="response_job_offer_id";
}
