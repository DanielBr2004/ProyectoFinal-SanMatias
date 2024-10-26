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
      }
    }