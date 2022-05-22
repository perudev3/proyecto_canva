<?php

use Illuminate\Database\Seeder;

class RolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            'roles_name' => 'Administrador',
        ]);

        DB::table('roles')->insert([
            'roles_name' => 'Usuario',
        ]);
    }
}
