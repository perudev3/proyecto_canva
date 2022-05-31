<?php

use Illuminate\Database\Seeder;

class CategoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            'categories_name' => 'Categoria 1',
            'categories_status' => 1,
        ]);

        DB::table('categories')->insert([
            'categories_name' => 'Categoria 2',
            'categories_status' => 1,
        ]);

        DB::table('categories')->insert([
            'categories_name' => 'Categoria 3',
            'categories_status' => 1,
        ]);
    }
}
