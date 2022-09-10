<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // デモアカウントを作成
        DB::table('users')->insert([
            'name' => 'test',
            'email' => 'test@test',
            'password' => bcrypt('test'),
        ]);
    }
}