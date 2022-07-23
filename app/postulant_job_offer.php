<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class postulant_job_offer extends Model
{
    protected $fillable = [
        'user_id',
        'number_contact',
        'presentacion',
        'job_offer_id',
        'postulant_job_offer_date',
    ];

    protected $primaryKey ="postulant_job_offer_id";
}
