<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Equipo;

class EquipoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Equipo::create([
            'codigo' => 'EQ001',
            'tipo' => 'Laptop',
            'cliente' => 'Cliente A',
            'estado' => 'Disponible',
            'fecha_entrega' => '2025-08-15'
        ]);

        Equipo::create([
            'codigo' => 'EQ002',
            'tipo' => 'Tablet',
            'cliente' => 'Cliente B',
            'estado' => 'Ocupado',
            'fecha_entrega' => '2025-08-20'
        ]);
    }
}
