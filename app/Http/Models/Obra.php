<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Obra extends Model
{
    public $timestamps = false;
    protected $fillable = [
        "id_usuario",
        "id_categoria",
        "ruta",
        "titulo",
    ];
}
