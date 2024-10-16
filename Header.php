<?php
session_start();

if(!isset($_SESSION['login']) || (isset($_SESSION['login']) && !$_SESSION['login']['permitido'])){ 
    header('Location:index.php');
}
//Usando .ENV
$host = "http://localhost/ProyectoFinal-SanMatias/";
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <link rel="stylesheet" href="<?= $host ?>css/StyleHome.css">
        <link rel="icon" href="<?= $host ?>/img/icon.png">
        <link rel="stylesheet" href="<?= $host ?>js/Spanish.json">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

          <!--DATATABLE-->
  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.css">

      

        <title>Inicio</title>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <div class="container">
                <a class="navbar-brand" href="<?= $host ?>/home.php">Granja San Matias</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<?= $host ?>/home.php">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/InventarioAlmacen"><i class="fa-solid fa-users-viewfinder"></i> Inventario Almacen</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/InventarioMolino">Inventario Molino</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/Venta">Venta</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link " id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-list"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <p style="text-align: center;"><?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['nombres'] ?></p>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Clientes">Clientes</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Colaboradores"><i class="fa-solid fa-users-viewfinder"></i> Usuarios</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/ActualizarDatos">Actualizar Datos</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Productos">Productos</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="http://localhost/ProyectoFinal-SanMatias/controllers/login.controller.php?operacion=destroy">Cerrar sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>