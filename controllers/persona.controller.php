<?php
session_start();

require_once '../models/Personas.php';

$persona = new Personas();

  //Insertar persona  
  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
        $datos = [
            "apepaterno"    => $_POST['apepaterno'],
            "apematerno"    => $_POST['apematerno'],
            "nombres"       => $_POST['nombres'],
            "nrodocumento"  => $_POST['nrodocumento']
        ];
        $idobtenido = $persona->add($datos);
        echo json_encode(["idpersona" => $idobtenido]);
        break;
    }
    }
  