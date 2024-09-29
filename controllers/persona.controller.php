<?php
session_start();

require_once '../models/Personas.php';

header("Content-type: application/json; charset=utf-8");

$persona = new Personas();

  //Insertar persona  
  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
        $datos = [
            "apepaterno"    => $persona->limpiarCadena($_POST['apepaterno']),
            "apematerno"    => $persona->limpiarCadena($_POST['apematerno']),
            "nombres"       => $persona->limpiarCadena($_POST['nombres']),
            "nrodocumento"  => $persona->limpiarCadena($_POST['nrodocumento'])
        ];
        $idobtenido = $persona->add($datos);
        echo json_encode(["idpersona" => $idobtenido]);
        break;
    }
    }
  