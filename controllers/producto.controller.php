<?php

require_once '../models/Productos.php';

$producto = new Producto();

header("Content-type: application/json; charset=utf-8");

// Manejo de operaciones POST
if (isset($_POST['operacion'])) {
  switch ($_POST['operacion']) {
      case 'add':
          if (isset($_POST['Producto']) && trim($_POST['Producto']) != '') {
              $datos = [
                  "Producto" => $producto->limpiarCadena($_POST['Producto']),
                  "descripcion" => $producto->limpiarCadena($_POST['descripcion'])
              ];
              $idobtenido = $producto->add($datos);
              echo json_encode(["idproducto" => $idobtenido]);
          }
          break;

      case 'editar':
          if (isset($_POST['idproducto']) && isset($_POST['Producto']) && trim($_POST['Producto']) != '') {
              $datos = [
                  "idproducto" => $_POST['idproducto'],
                  "Producto" => $producto->limpiarCadena($_POST['Producto']),
                  "descripcion" => $producto->limpiarCadena($_POST['descripcion'])
              ];
              $producto->editarProducto($datos);
              echo json_encode(["status" => "success", "message" => "Producto actualizado exitosamente."]);
          } else {
              echo json_encode(["status" => "error", "message" => "Datos incompletos para editar el producto."]);
          }
          break;

      case 'eliminar':
          if (isset($_POST['idproducto'])) {
              $producto->eliminarProducto($_POST['idproducto']);
              echo json_encode(["status" => "success"]);
          } else {
              echo json_encode(["status" => "error", "message" => "ID no proporcionado."]);
          }
          break; 
  }
}

  if(isset($_GET['operacion'])){
    switch($_GET['operacion']){
        case 'getAll':
            // Llamamos al procedimiento almacenado para listar productos
            $consulta = $producto->getAll(); // Asumiendo que has implementado el método para llamar al procedimiento
            echo json_encode($consulta);
            break;
    }
}

