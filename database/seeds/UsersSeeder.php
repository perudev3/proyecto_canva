<?php

use Illuminate\Database\Seeder;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Administrador',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('123456'),
            'roles_id' => 1,
            'status' => 1
        ]);

        DB::table('users')->insert([
            'name' => 'Usuario',
            'email' => 'user@gmail.com',
            'password' => bcrypt('123456'),
            'roles_id' => 2,
            'status' => 1,
            'status_membership' => 0,
        ]);

    }
}
