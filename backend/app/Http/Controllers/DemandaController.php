<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;

class DemandaController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json([
            [
                'id' => 1,
                'descricao' => 'Aquisição de equipamentos de TI',
                'valor_estimado' => 150000,
                'status' => 'EM_ELABORACAO'
            ],
            [
                'id' => 2,
                'descricao' => 'Contratação de serviço de limpeza',
                'valor_estimado' => 80000,
                'status' => 'CONSOLIDADA'
            ]
        ]);
    }
}
