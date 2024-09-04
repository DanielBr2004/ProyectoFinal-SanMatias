<?php
session_start();

require_once '../models/Colaboradores.php';

$colaborador = new Colaborador();

  //Función de Registrar Colaborador, guardando el id
  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
            $datos = [
                "idpersona"     => $_POST['idpersona'],
                "nomusuario"    => $_POST['nomusuario'],
                "passusuario"   => $_POST['passusuario']
            ];
            $idobtenido = $colaborador->add($datos);
            //Lo retonará en la vista como un JSON
            echo json_encode(["idcolaborador" => $idobtenido]);
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
    }
  }

