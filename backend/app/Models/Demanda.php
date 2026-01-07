<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Demanda extends Model
{
    protected $table = 'demanda';

    protected $primaryKey = 'id_demanda';

    public $timestamps = false;

    protected $fillable = [
        'id_ciclo',
        'id_unidade',
        'id_responsavel',
        'objeto',
        'justificativa',
        'status',
        'valor_estimado'
    ];
}
