<?php

require_once '../models/Productos.php';

$producto = new Producto();

  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
          if (isset($_POST['Producto']) && trim($_POST['Producto']) != '') {
              $datos = [
                "Producto"    => $_POST['Producto'],
                "descripcion"       => $_POST['descripcion']
            ];
            $idobtenido = $producto->add($datos);
            //Lo retornará como un JSON
            echo json_encode(["idproducto" => $idobtenido]);
            }
            
            break;
        
    }
  }

  if(isset($_GET['operacion'])){
    switch($_GET['operacion']){
        case 'getAll':
            echo json_encode($producto->getAll());
            break;
    }
  }