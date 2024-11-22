<?php
session_start();

require_once '../models/venta.php';

header("Content-type: application/json; charset=utf-8");

$venta = new Venta();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcliente"         => $venta->limpiarCadena($_POST['idcliente']),
              "idcolaborador"     => $venta->limpiarCadena($_POST['idcolaborador'])
          ];
          $idobtenido = $venta->add($datosEnviar);
          echo json_encode(["idventa" => $idobtenido]);
          break;

          case 'update':
            $datosActualizar = [
                "idventa"   => $venta->limpiarCadena($_POST['idventa']),
                "estado"    => $venta->limpiarCadena($_POST['estado']),
            ];
            $resultado = $venta->update($datosActualizar);
            echo json_encode(["success" => $resultado]);
            break;

  }
}

if (isset($_GET['operacion'])) {
  switch ($_GET['operacion']) {
      case 'getAll':
          echo json_encode($venta->getAll());
          break;
      // Otros casos...
  }
}