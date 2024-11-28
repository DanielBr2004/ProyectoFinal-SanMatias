<?php
session_start();

require_once '../models/Clientes.php';

header("Content-type: application/json; charset=utf-8");

$cliente = new Cliente();

  if(isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'add':
            $datos = [
                "idpersona"       => $cliente->limpiarCadena($_POST['idpersona']),
                "telefono"        => $cliente->limpiarCadena($_POST['telefono']),
                "tipodocumento"   => $cliente->limpiarCadena($_POST['tipodocumento']),
                "razonsocial"     => $cliente->limpiarCadena($_POST['razonsocial']),
                "direccion"       => $cliente->limpiarCadena($_POST['direccion']),
                "email"           => $cliente->limpiarCadena($_POST['email'])

            ];
            $idobtenido = $cliente->add($datos);
            //Lo retonará en la vista como un JSON
            echo json_encode(["idcliente" => $idobtenido]);
            break;

            case 'edit':
              $datos = [
                  "idcliente"       => $cliente->limpiarCadena($_POST['idcliente']),
                  "nrodocumento"    => $cliente->limpiarCadena($_POST['nrodocumento']),
                  "tipodocumento"   => $cliente->limpiarCadena($_POST['tipodocumento']),
                  "cliente_nombre"  => $cliente->limpiarCadena($_POST['cliente_nombre'])
              ];
              $resultado = $cliente->edit($datos);
              if ($resultado) {
                  echo json_encode(["mensaje" => "Cliente actualizado correctamente."]);
              } else {
                  echo json_encode(["mensaje" => "Error al actualizar el cliente."]);
              }
              break;

              case 'delete':
                $idcliente = $cliente->limpiarCadena($_POST['idcliente']);
                $resultado = $cliente->delete($idcliente);
                if ($resultado) {
                    echo json_encode(["mensaje" => "Cliente eliminado correctamente."]);
                } else {
                    echo json_encode(["mensaje" => "Error al eliminar el cliente."]);
                }
                break;
    }
  }

    //Listar Nombre de Usuarios (kardex)
    if(isset($_GET['operacion'])){

      switch($_GET['operacion']){
          case 'searchByDoc':
              echo json_encode($cliente->searchByDoc(['nrodocumento' => $_GET['nrodocumento']]));
              break;
          case 'getAllClient':
              echo json_encode($cliente->getAllClient());
              break;
      }
    }