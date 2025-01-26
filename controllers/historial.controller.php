<?php
session_start();

require_once '../models/Historial.php';

header("Content-type: application/json; charset=utf-8");

$historial = new Historial();


if (isset($_GET['operacion'])) {
  switch ($_GET['operacion']) {
      case 'getAll':
          echo json_encode($historial->getAllHistorialHuevos());
          break;
  }
}