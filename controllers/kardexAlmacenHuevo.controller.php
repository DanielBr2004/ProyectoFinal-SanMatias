<?php
session_start();

require_once '../models/kardexAlmcenHuevos.php';

header("Content-type: application/json; charset=utf-8");

$kardexhuevo = new KardexHuevo();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcolaborador"     => $kardexhuevo->limpiarCadena($_POST['idcolaborador']),
              "idhuevo"           => $kardexhuevo->limpiarCadena($_POST['idhuevo']),
              "tipomovimiento"    => $kardexhuevo->limpiarCadena($_POST['tipomovimiento']),
              "motivomovimiento"  => $kardexhuevo->limpiarCadena($_POST['motivomovimiento']),
              "idlote"            => $kardexhuevo->limpiarCadena($_POST['idlote']),
              "cantidad"          => $kardexhuevo->limpiarCadena($_POST['cantidad']),
              "descripcion"       => $kardexhuevo->limpiarCadena($_POST['descripcion'])
          ];
          //Retornará un booleano 
          $status = $kardexhuevo->add($datosEnviar);
          //Se envía el valor del status como un booleano
          echo json_encode(["estado" => $status]);
          break;


            case 'eliminarKardex':
              $idAlmacenHuevos = $kardexhuevo->limpiarCadena($_POST['idAlmacenHuevos']);
              $status = $kardexhuevo->eliminarKardexHuevo($idAlmacenHuevos);
              echo json_encode(["estado" => $status]);
              break;

              case 'editarKardex':
                $datosEditar = [
                    "idAlmacenHuevos"   => $kardexhuevo->limpiarCadena($_POST['idAlmacenHuevos']),
                    "motivomovimiento"  => $kardexhuevo->limpiarCadena($_POST['motivomovimiento']),
                    "cantidad"          => $kardexhuevo->limpiarCadena($_POST['cantidad']),
                    "descripcion"       => $kardexhuevo->limpiarCadena($_POST['descripcion']),
                    "idlote"            => $kardexhuevo->limpiarCadena($_POST['idlote'])
                ];
                $status = $kardexhuevo->editarKardexHuevo($datosEditar);
                echo json_encode(["estado" => $status]);
                break;
  }
}

if(isset($_GET['operacion'])){
  switch($_GET['operacion']){
      case 'mostrarStockActual':
          echo json_encode($kardexhuevo->mostrarStockActual(['idhuevo' => $_GET['idhuevo']]));
          break;
      case 'getAll':
          echo json_encode($kardexhuevo->getAll());
        break;
  }
}

if (isset($_GET['operacion'])) {
  switch ($_GET['operacion']) {
      case 'getAlls':
          echo json_encode($kardexhuevo->getAlls());
          break;
      // Otros casos...
  }
}