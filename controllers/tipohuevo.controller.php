<?php

require_once '../models/TipoHuevo.php';

$tipohuevo = new TipoHuevo();

header("Content-type: application/json; charset=utf-8");

    //Listar Nombre de Usuarios (kardex)
    if(isset($_GET['operacion'])){

      switch($_GET['operacion']){
          case 'getAllHuevos':
              echo json_encode($tipohuevo->getAllHuevos());
              break;

          case 'getAllTiposHuevos':
              echo json_encode($tipohuevo->getAllTiposHuevos());
              break;
        case 'getTiposHuevos':
            echo json_encode($tipohuevo->getTiposHuevos());
            break;
      }
    }

    // Manejo de operaciones POST EDITAR Y ELIMINAR
    if(isset($_POST['operacion'])) {
      switch ($_POST['operacion']) {
          case 'editar':
              if (isset($_POST['idhuevo']) && isset($_POST['tiposHuevos']) && trim($_POST['tiposHuevos']) != '' && isset($_POST['PrecioKg'])) {
                  $datos = [
                      "idhuevo" => $_POST['idhuevo'],
                      "tiposHuevos" => $tipohuevo->limpiarCadena($_POST['tiposHuevos']),
                      "PrecioKg" => (int)$_POST['PrecioKg'],  
                      "descripcion" => $tipohuevo->limpiarCadena($_POST['descripcion'])
                  ];
                  $tipohuevo->editarTipoHuevos($datos);
                  echo json_encode(["status" => "success", "message" => "Tipo de huevo actualizado exitosamente."]);
              } else {
                  echo json_encode(["status" => "error", "message" => "Datos incompletos para editar el tipo de huevo."]);
              }
              break;

          case 'eliminar':
              if (isset($_POST['idhuevo'])) {
                  $tipohuevo->eliminarProducto($_POST['idhuevo']);
                  echo json_encode(["status" => "success"]);
              } else {
                  echo json_encode(["status" => "error", "message" => "ID no proporcionado."]);
              }
              break; 
      }

      

    }