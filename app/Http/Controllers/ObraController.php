<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Obra;
use Storage;

class ObraController extends Controller
{

      public function index(Request $request)
      {
          $maxId = Obra::select('obras.id')->orderBy('id', 'desc')
                                  ->take(1)
                                  ->get()
                                  ->first()
                                  ->id;
          $minId = Obra::select('obras.id')->orderBy('id', 'asc')
                                  ->take(1)
                                  ->get()
                                  ->first()
                                  ->id;

          $images = [];
          $count = 0;
          while($count < 9){
             $randId = rand($minId, $maxId);
              if (!isset($images[$randId])){
                  $count++;
                  $obra = Obra::find($randId);
                  $images[$randId] = [
                      "user_id" => $obra->id_usuario,
                      "titulo" => $obra->titulo,
                      "base64_image" => base64_encode(Storage::disk('local')->get($obra->ruta)),
                  ];
              }
          }

          return response()->json($images);

      }

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

      public function get_all_photos()
      {
          $paths = Obra::orderBy('id', 'desc')->select('titulo', 'ruta')->get();

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

      public function get_all_photos_by_user(Request $request)
      {
          $obras = Obra::where("id_usuario", $request->user_id)->get();

          foreach ($obras as $obra) {
            $obra->base64_photo = base64_encode(Storage::disk('local')->get($obra->ruta));
          }
          return response()->json($obras);
      }

      public function search_by_name(Request $request)
      {
          if (!isset($request->titulo))
              return response()->json([]);

          $obras = Obra::where('titulo', 'like', '%'. $request->titulo. '%')->select(['id', 'titulo', 'ruta', 'id_usuario'])->get();

          $images = [];
          $i = 0;
          foreach ($obras as $obra) {
            $images[$i++] = [
              'user_id' => $obra->id_usuario,
              'obra_id' => $obra->id,
              'titulo' => $obra->titulo,
              'base64_photo' => base64_encode(Storage::disk('local')->get($obra->ruta)),
            ];
          }

          return response()->json($images);
      }
}
