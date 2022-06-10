<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class job_offer extends Model
{
    protected $fillable = [
        'job_offer_name',
        'job_offer_description',
        'user_id',
        'job_offer_date',
        'job_offer_finished',
        'job_offer_status',
    ];

    protected $primaryKey ="job_offer_id";

    public function empresa()
    {
        return $this->belongsTo('App\User', 'user_id', 'id')->where('roles_id', 3);
    }
}
