<?php
session_start();

require_once '../models/Colaboradores.php';

header("Content-type: application/json; charset=utf-8");

$colaborador = new Colaborador();

  //Función de Registrar Colaborador, guardando el id
  if(isset($_POST['operacion'])){
    switch($_POST['operacion']){
        case 'add':
            $datos = [
                "idpersona"     => $colaborador->limpiarCadena($_POST['idpersona']),
                "nomusuario"    => $colaborador->limpiarCadena($_POST['nomusuario']),
                "passusuario"   => $colaborador->limpiarCadena($_POST['passusuario'])
            ];
            $idobtenido = $colaborador->add($datos);
            //Lo retonará en la vista como un JSON
            echo json_encode(["idcolaborador" => $idobtenido]);
            break;

            case 'delete':
              $idcolaborador = $colaborador->limpiarCadena($_POST['idcolaborador']);
              $success = $colaborador->delete($idcolaborador);
              echo json_encode(["success" => $success]);
              break;

    }
  }

  //Listar Nombre de Usuarios (kardex)
  if(isset($_GET['operacion'])){

    switch($_GET['operacion']){
        case 'getAll':
            echo json_encode($colaborador->getAll());
            break;
        case 'searchByDoc':
            echo json_encode($colaborador->searchByDoc(['nrodocumento' => $_GET['nrodocumento']]));
            break;
        case 'getAllUser':
          echo json_encode($colaborador->getAllUser());
          break;
    }
  }

  if(isset($_POST['operacion'])) {
    switch($_POST['operacion']) {
        case 'edit':
            error_log("Entrando en el caso 'edit'"); // Registro temporal
            $datos = [
                "idcolaborador" => $colaborador->limpiarCadena($_POST['idcolaborador']),
                "apepaterno"    => $colaborador->limpiarCadena($_POST['apepaterno']),
                "apematerno"    => $colaborador->limpiarCadena($_POST['apematerno']),
                "nombres"       => $colaborador->limpiarCadena($_POST['nombres'])
            ];
            $success = $colaborador->edit($datos);
            echo json_encode(["success" => $success]);
            break;
    }
 }

