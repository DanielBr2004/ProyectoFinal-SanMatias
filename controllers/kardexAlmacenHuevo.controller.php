<?php
session_start();

require_once '../models/kardexAlmcenHuevos.php';

$kardexhuevo = new KardexHuevo();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcolaborador"     => $_POST['idcolaborador'],
              "idhuevo"           => $_POST['idhuevo'],
              "tipomovimiento"    => $_POST['tipomovimiento'],
              "motivomovimiento"  => $_POST['motivomovimiento'],
              "cantidad"          => $_POST['cantidad'],
              "descripcion"        => $_POST['descripcion']
          ];
          //Retornará un booleano 
          $status = $kardexhuevo->add($datosEnviar);
          //Se envía el valor del status como un booleano
          echo json_encode(["estado" => $status]);
          break;
  }
}

if(isset($_GET['operacion'])){

  switch($_GET['operacion']){
      case 'mostrarStockActual':
          echo json_encode($kardexhuevo->mostrarStockActual(['idhuevo' => $_GET['idhuevo']]));
          break;
  }
}
