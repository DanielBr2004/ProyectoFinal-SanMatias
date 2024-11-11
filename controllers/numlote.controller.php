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
      case 'searchLote':
          echo json_encode($numlote->searchLote(['numLote' => $_GET['numLote']]));
          break;
        case 'getAllLote': // Llamada corregida para getAllLote
            $consulta = $numlote->getAllLote();
            echo json_encode($consulta);
            break;
        case 'getLastDate':
            $consulta = $numlote->getLastDate();
            echo json_encode($consulta);
            break;
  }
}

if(isset($_POST['operacion'])){
  switch($_POST['operacion']){
      case 'add':
          $datos = [
              "numLote"     => $numlote->limpiarCadena($_POST['numLote']),
              "CantInicio" =>$numlote->limpiarCadena($_POST['CantInicio']),
              "descripcion"   => $numlote->limpiarCadena($_POST['descripcion'])
          ];
          $idobtenido = $numlote->add($datos);
          echo json_encode(["idlote" => $idobtenido]);
          break;


          case 'deactivateLote':
            $idlote = $_POST['idlote'] ?? null; // Asegurarse de que idlote se está capturando correctamente
            if ($idlote) {
                $result = $numlote->deactivateLote($idlote); // Llama al modelo para desactivar el lote
                echo json_encode(['success' => $result]); // Devuelve true o false según el resultado
            } else {
                echo json_encode(['success' => false, 'error' => 'IDLote no proporcionado']);
            }
            break;

            case 'activateLote':
              $idlote = $_POST['idlote'] ?? null;
              if ($idlote) {
                  $result = $numlote->activateLote($idlote); // Llama al método del modelo
                  echo json_encode(['success' => $result]);
              } else {
                  echo json_encode(['success' => false, 'error' => 'IDLote no proporcionado']);
              }
              break;


  }
  
}

