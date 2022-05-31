<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMembreshipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('membreships', function (Blueprint $table) {
            $table->increments('membership_id');
            $table->LongText('membership_name')->nullable();
            $table->decimal('membership_price', 10,2)->nullable();
            $table->integer('membership_status')->nullable();
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
        Schema::dropIfExists('membreships');
    }
}
