<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Obra;
use Storage;

class ObraController extends Controller
{
      public function upload_photo(Request $request)
      {
          $userId = $request->user_id;
          $photoBase64 = $request->photo;
          $titulo = $request->titulo;
          $now = Carbon::now()->toDateTimeString();
          $path = 'fotos_usuarios/'. $userId. "_". $titulo. "_". $now. ".jpg";
          $path = str_replace(" ", "_", $path);

          $obra = new Obra;
          $obra->id_usuario = $userId;
          $obra->ruta = $path;
          $obra->titulo = $titulo;
          $guardado = $obra->save();

          if($guardado) {
              Storage::disk('local')->put($path, base64_decode($photoBase64));
              return response()->json([
                 'status' => 'success'
              ]);
          } else {
            return response()->json([
               'status' => 'failed'
            ]);
          }
      }

      public function get_top_10()
      {
          $paths = Obra::orderBy('id', 'desc')->select('titulo', 'ruta')->take(1)->get();

          $encodeImages = [];
          foreach ($paths as $pathObject)
              $encodeImages[] = [
                  "titulo"  => $pathObject->titulo,
                  "ruta"    => base64_encode(Storage::disk('local')->get($pathObject->ruta)),
              ];

          return response()->json([
              'encode_images' => $encodeImages
          ]);
      }
}
