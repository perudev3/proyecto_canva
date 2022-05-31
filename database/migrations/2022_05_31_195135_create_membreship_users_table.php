<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMembreshipUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('membreship_users', function (Blueprint $table) {
            $table->increments('membership_user_id');
            $table->integer('membership_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->date('membership_user_date')->nullable();
            $table->integer('membership_user_status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('membreship_users');
    }
}
