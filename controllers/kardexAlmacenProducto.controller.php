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
  }
}

if(isset($_GET['operacion'])){

  switch($_GET['operacion']){
      case 'mostrarStockActual':
          echo json_encode($kardexproducto->mostrarStockActual(['idproducto' => $_GET['idproducto']]));
          break;
  }
}