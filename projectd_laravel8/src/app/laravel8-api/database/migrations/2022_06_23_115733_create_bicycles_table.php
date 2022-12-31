<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBicyclesTable extends Migration
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
        Schema::create('bicycles', function (Blueprint $table) {
            $table->bigIncrements('bicycles_id');
            $table->integer('spots_id')->index();;
            $table->integer('cameras_id')->index();;
            $table->string('labels_name');
            $table->integer('get_id');
            $table->string('bicycles_x_coordinate');
            $table->string('bicycles_y_coordinate');
            $table->string('bicycles_status');
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
        Schema::dropIfExists('bicycles');
    }
}
