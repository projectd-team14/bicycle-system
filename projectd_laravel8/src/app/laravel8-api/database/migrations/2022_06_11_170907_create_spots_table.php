<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSpotsTable extends Migration
{
    /**
     * マイグレーションが使用するデータベース接続
     *
     * @var string
     */
    protected $connection = 'mysql_second';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('spots', function (Blueprint $table) {
            $table->bigIncrements('spots_id');
            $table->integer('users_id')->index();
            $table->string('spots_name')->index();
            $table->string('spots_latitude');
            $table->string('spots_longitude');
            $table->string('spots_address');
            $table->string('spots_status')->defalut('None');
            $table->text('spots_count_day1')->defalut('None');
            $table->text('spots_count_week1')->defalut('None');
            $table->text('spots_count_month1')->defalut('None');
            $table->text('spots_count_month3')->defalut('None');
            $table->text('spots_violations')->defalut('None');
            $table->integer('spots_over_time')->defalut('None');
            $table->integer('spots_max')->defalut('None');
            $table->string('spots_url');
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP'));
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('spots');
    }
}
