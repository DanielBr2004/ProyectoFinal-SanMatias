<?php
session_start();

require_once '../models/kardexAlmacenProducto.php';

$kardexproducto = new KardexProducto();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
      case 'add':
          $datosEnviar = [
              "idcolaborador"        => $_POST['idcolaborador'],
              "idproducto"           => $_POST['idproducto'],
              "tipomovimiento"       => $_POST['tipomovimiento'],
              "motivomovimiento"     => $_POST['motivomovimiento'],
              "cantidad"             => $_POST['cantidad']
          ];
          $status = $kardexproducto->add($datosEnviar);
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