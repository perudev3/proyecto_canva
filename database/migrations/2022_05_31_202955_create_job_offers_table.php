<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJobOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('job_offers', function (Blueprint $table) {
            $table->increments('job_offer_id');
            $table->LongText('job_offer_name')->nullable();
            $table->LongText('job_offer_description')->nullable();
            $table->integer('user_id')->nullable();
            $table->date('job_offer_date')->nullable();
            $table->date('job_offer_finished')->nullable();
            $table->integer('job_offer_status')->nullable();
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
        Schema::dropIfExists('job_offers');
    }
}
