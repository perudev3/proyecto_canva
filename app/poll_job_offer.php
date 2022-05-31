<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class poll_job_offer extends Model
{
    protected $fillable = [
        'poll_job_offer_question',
        'job_offer_id',
    ];

    protected $primaryKey ="poll_job_offer_id";
}
