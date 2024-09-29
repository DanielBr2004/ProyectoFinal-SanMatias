<?php
session_start();

require_once '../models/Clientes.php';

header("Content-type: application/json; charset=utf-8");

$cliente = new Cliente();

  //Función de Registrar Colaborador, guardando el id
  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
            $datos = [
                "idpersona"       => $cliente->limpiarCadena($_POST['idpersona']),
                "telefono"        => $cliente->limpiarCadena($_POST['telefono']),
                "razonsocial"     => $cliente->limpiarCadena($_POST['razonsocial']),
                "direccion"       => $cliente->limpiarCadena($_POST['direccion'])

            ];
            $idobtenido = $cliente->add($datos);
            //Lo retonará en la vista como un JSON
            echo json_encode(["idcliente" => $idobtenido]);
            break;
    }
  }

    //Listar Nombre de Usuarios (kardex)
    if(isset($_GET['operacion'])){

      switch($_GET['operacion']){
          case 'searchByDoc':
              echo json_encode($cliente->searchByDoc(['nrodocumento' => $_GET['nrodocumento']]));
              break;
      }
    }