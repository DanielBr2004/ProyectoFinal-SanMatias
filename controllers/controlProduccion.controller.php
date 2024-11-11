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

            case 'listLotes':
                $lotes = $controlLote->getAllLotes(); // Asumiendo que esta función retorna todos los lotes
                echo json_encode($lotes);
                break;
    }
}

