<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Equipo;

class EquipoController extends Controller
{
    public function index()
    {
        return Equipo::all();
    }

    public function validar(Request $request)
    {
        $request->validate(['codigos' => 'required|array']);
        $codigos = $request->codigos;

        $encontrados = Equipo::where(function ($query) use ($codigos) {
            foreach ($codigos as $codigo) {
                $query->orWhere('codigo', 'like', "%{$codigo}%");
            }
        })->pluck('codigo')->toArray();

        $no_encontrados = [];
        foreach ($codigos as $codigoBuscado) {
            $hayCoincidencia = false;
            foreach ($encontrados as $codigoEncontrado) {
                if (stripos($codigoEncontrado, $codigoBuscado) !== false) {
                    $hayCoincidencia = true;
                    break;
                }
            }
            if (!$hayCoincidencia) {
                $no_encontrados[] = $codigoBuscado;
            }
        }
        return [
            'encontrados' => $encontrados,
            'no_encontrados' => $no_encontrados
        ];
    }
}
