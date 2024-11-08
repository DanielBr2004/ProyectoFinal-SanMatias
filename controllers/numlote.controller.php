<?php
session_start();

require_once '../models/numlote.php';

$numlote = new NumLote();

header("Content-type: application/json; charset=utf-8");

if(isset($_GET['operacion'])){
  switch($_GET['operacion']){
      case 'getAll':
          $consulta = $numlote->getAll();
          echo json_encode($consulta);
          break;
  }
}