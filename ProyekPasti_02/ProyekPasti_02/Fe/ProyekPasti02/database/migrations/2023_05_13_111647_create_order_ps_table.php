<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order_ps', function (Blueprint $table){
            $table->id();
            $table->integer('id_product');
            $table->bigInteger('id_order');
            $table->integer('quantity');
            $table->string('harga');
            $table->string('total_harga');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_ps');
    }
};
