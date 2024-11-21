<?php

require_once '../models/DetalleVenta.php';

$detalleVenta = new DetalleVenta();

if (isset($_POST['operacion'])) {
  switch ($_POST['operacion']) {
    case 'add':
      if (isset($_POST['idventa'])) {
        $idventa = $_POST['idventa'];

        // Verifica si los datos de los huevos están presentes
        if (isset($_POST['huevos']) && is_array($_POST['huevos'])) {
          $huevos = $_POST['huevos'];
          $datos = [];
          foreach ($huevos as $huevo) {
            $datosEnviar = [
              "idventa"        => $idventa,
              "idhuevo"        => $huevo['idhuevo'],
              "cantidad"       => $huevo['cantidad'],
              "unidadMedida" => $huevo['unidadMedida'],
              "precioVenta"      => $huevo['precioVenta']
              
            ];
            $dato = $detalleVenta->add($datosEnviar);
            $datos[] = $dato;
          }
          echo json_encode(["iddetalleventa" => $datos]);
        } else {
          echo json_encode(["error" => "Datos de huevos no proporcionados o incorrectos"]);
        }
      } else {
        echo json_encode(["error" => "ID de venta no proporcionado"]);
      }
      break;
  }
}