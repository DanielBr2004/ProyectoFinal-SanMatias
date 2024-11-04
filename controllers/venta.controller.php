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
              "idcolaborador"     => $venta->limpiarCadena($_POST['idcolaborador']),
              "direccion"         => $venta->limpiarCadena($_POST['direccion'])
          ];
          $idobtenido = $venta->add($datosEnviar);
          echo json_encode(["idventa" => $idobtenido]);
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