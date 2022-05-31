<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostulantJobOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('postulant_job_offers', function (Blueprint $table) {
            $table->increments('postulant_job_offer_id');
            $table->integer('user_id')->nullable();
            $table->integer('job_offer_id')->nullable();
            $table->date('postulant_job_offer_date')->nullable();
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
        Schema::dropIfExists('postulant_job_offers');
    }
}
