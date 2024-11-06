<?php
session_start();

require_once '../models/kardexAlmacenProducto.php';

header("Content-type: application/json; charset=utf-8");

$kardexproducto = new KardexProducto();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcolaborador"        => $kardexproducto->limpiarCadena($_POST['idcolaborador']),
              "idproducto"           => $kardexproducto->limpiarCadena($_POST['idproducto']),
              "tipomovimiento"       => $kardexproducto->limpiarCadena($_POST['tipomovimiento']),
              "motivomovimiento"     => $kardexproducto->limpiarCadena($_POST['motivomovimiento']),
              "cantidad"             => $kardexproducto->limpiarCadena($_POST['cantidad']),
              "descripcion"          => $kardexproducto->limpiarCadena($_POST['descripcion'])
          ];
          $status = $kardexproducto->add($datosEnviar);
          echo json_encode(["estado" => $status]);
          break;

                case 'edit':
          $datosEditar = [
              "idAlmacenProducto"   => $kardexproducto->limpiarCadena($_POST['idAlmacenProducto']),
              "motivomovimiento"    => $kardexproducto->limpiarCadena($_POST['motivomovimiento']),
              "cantidad"            => $kardexproducto->limpiarCadena($_POST['cantidad'])
          ];
          $status = $kardexproducto->edit($datosEditar);
          echo json_encode(["estado" => $status]);
          break;

          case 'delete':
            $idAlmacenProducto = $kardexproducto->limpiarCadena($_POST['idAlmacenProducto']);
            $status = $kardexproducto->delete($idAlmacenProducto);
            echo json_encode(["estado" => $status]);
            break;
  }
}

if(isset($_GET['operacion'])){

  switch($_GET['operacion']){
      case 'mostrarStockActual':
          echo json_encode($kardexproducto->mostrarStockActual(['idproducto' => $_GET['idproducto']]));
          break;
  }
}

if (isset($_GET['operacion'])) {
  switch ($_GET['operacion']) {
      case 'getAll':
          echo json_encode($kardexproducto->getAll());
          break;
      // Otros casos...
  }
}