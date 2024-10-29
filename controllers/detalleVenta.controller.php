<?php
session_start();

require_once '../models/detalleVenta.php';

header("Content-type: application/json; charset=utf-8");

$detalleVenta = new DetalleVenta();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcolaborador"     => $detalleVenta->limpiarCadena($_POST['idcolaborador']),
              "idventa"           => $detalleVenta->limpiarCadena($_POST['idventa']),
              "idhuevo"           => $detalleVenta->limpiarCadena($_POST['idhuevo']),
              "cantidad"          => $detalleVenta->limpiarCadena($_POST['cantidad']),
              "PesoTotal"         => $detalleVenta->limpiarCadena($_POST['PesoTotal']),
              "precioUnitario"    => $detalleVenta->limpiarCadena($_POST['precioUnitario']),
              "precioTotal"       => $detalleVenta->limpiarCadena($_POST['precioTotal'])
          ];
          $status = $detalleVenta->add($datosEnviar);
          echo json_encode(["estado" => $status]);
          break;
  }
}