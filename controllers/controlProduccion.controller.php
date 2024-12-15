<?php
session_start();

require_once '../models/controlLote.php';

header("Content-type: application/json; charset=utf-8");

$controlLote = new ControlLote(); 

if(isset($_POST['operacion'])){
    switch($_POST['operacion']){
        case 'add':
            $datosEnviar = [
                "idlote"      => $controlLote->limpiarCadena($_POST['idlote']),
                "mortalidad"  => $controlLote->limpiarCadena($_POST['mortalidad']),
                "alimento"    => $controlLote->limpiarCadena($_POST['alimento'])
            ];
            $status = $controlLote->add($datosEnviar);
            echo json_encode(["estado" => $status]);
            break;

            case 'list':
                $idlote = intval($_POST['idlote']);
                $result = $controlLote->list($idlote);
                echo json_encode($result);
                break;
            case 'ValidarLote':
                $idlote = intval($_POST['idlote']);
                $result = $controlLote->ValidarLote($idlote);
                echo json_encode($result);
                break;
                case 'edit':
                    $datosRecibidos = [
                        "idlote"        => $_POST["idlote"],
                        "idcontrollote" => $_POST["idcontrollote"],
                        "mortalidad"    => $_POST["mortalidad"],
                        "alimento"      => $_POST["alimento"]
                    ];
                    $result = $controlLote->edit($datosRecibidos);
                    echo json_encode([
                        "status" => $result,
                        "message" => $result ? "Control lote actualizado" : "Error al actualizar"
                    ]);
                    break;
                    case 'delete':
                        $result = $controlLote->delete($_POST["idlote"], $_POST["idcontrollote"]);
                        echo json_encode([
                            "status" => $result,
                            "message" => $result ? "Control lote eliminado" : "Error al eliminar"
                        ]);
                        break;
    }
}

if(isset($_GET['operacion'])){
    switch($_GET['operacion']){
        case 'ChartLotes':
            echo json_encode($controlLote->ChartLotes(['idlote' => $_GET['idlote']]));
          break;
        case 'ChartLotes2':
            echo json_encode($controlLote->ChartLotes2(['idlote2' => $_GET['idlote2']]));
          break;
        case 'listLotes':
            $lotes = $controlLote->getAllLotes(); // Asumiendo que esta función retorna todos los lotes
            echo json_encode($lotes);
        break;
    }
}