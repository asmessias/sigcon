<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DemandaController;

Route::prefix('v1')->group(function () {

    Route::get('/health', function () {
        return response()->json([
            'status' => 'ok',
            'service' => 'SIGCON API'
        ]);
    });

    Route::get('/demandas', [DemandaController::class, 'index']);
});

