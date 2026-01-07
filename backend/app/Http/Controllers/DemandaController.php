<?php

namespace App\Http\Controllers;

use App\Models\Demanda;
use Illuminate\Http\JsonResponse;

class DemandaController extends Controller
{
    public function index(): JsonResponse
    {
        $demandas = Demanda::select(
            'id_demanda',
            'objeto',
            'status',
            'valor_estimado'
        )->orderBy('id_demanda')->get();

        return response()->json($demandas);
    }
}
