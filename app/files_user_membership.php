<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\files;

class files_user_membership extends Model
{
    protected $fillable = [
        'user_id',
        'files_id',
        'status',
    ];

    protected $primaryKey ="files_user_memberships_id";

    public function user()
    {
        return $this->hasMany(User::class, 'user_id' , 'id'); 
    }

    public function file()
    {
        return $this->hasMany(files::class, 'files_id' , 'files_id'); 
    }
}
