<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bicycle extends Model
{
    /**
     * データベース接続
     *
     * @var string
     */
    protected $connection = 'mysql_second';
}
