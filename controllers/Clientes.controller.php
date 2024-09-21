<?php
session_start();

require_once '../models/Clientes.php';

$cliente = new Cliente();

  //Función de Registrar Colaborador, guardando el id
  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
            $datos = [
                "idpersona"     => $_POST['idpersona'],
                "telefono"    => $_POST['telefono'],
                "razonsocial"   => $_POST['razonsocial'],
                "direccion"   => $_POST['direccion']

            ];
            $idobtenido = $cliente->add($datos);
            //Lo retonará en la vista como un JSON
            echo json_encode(["idcliente" => $idobtenido]);
            break;
    }
  }