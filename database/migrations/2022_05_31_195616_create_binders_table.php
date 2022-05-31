<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBindersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('binders', function (Blueprint $table) {
            $table->increments('binder_id');
            $table->LongText('binder_name')->nullable();
            $table->date('binder_date')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('binder_status')->nullable();
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
        Schema::dropIfExists('binders');
    }
}
