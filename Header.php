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

        
        <!-- chart-js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



        <!--DATATABLE-->
        <link
        rel="stylesheet"
        type="text/css"
        href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"
        />
        <link
        rel="stylesheet"
        type="text/css"
        href="https://cdn.datatables.net/buttons/2.3.3/css/buttons.bootstrap5.min.css"
         />
      
        <!--/DATATABLE -->
        <!-- Bootstrap-->
        <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
        />
        <!--/Bootstrap-->
        <!-- Font Awesome -->
        <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
        />
        <!-- /Font Awesome -->

       




      

        <title>Inicio</title>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <div class="container">
                <a class="navbar-brand" href="<?= $host ?>views/home.php"><i class="fa-solid fa-egg"></i> Granja San Matias</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<?= $host ?>views/home.php"><i class="fa-solid fa-house"></i> Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/InventarioAlmacen"><i class="fa-regular fa-clipboard"></i> Inventario Almacen</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/InventarioMolino"><i class="fa-solid fa-clipboard"></i> Inventario Molino</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/produccion"><i class="fa-solid fa-arrow-up-wide-short"></i> Produccion</a></li>
                        <li class="nav-item"><a class="nav-link active" href="<?= $host ?>/views/Venta"><i class="fa-solid fa-cart-shopping"></i> Venta</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link " id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-bars"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <p style="text-align: center;"><i class="fa-solid fa-user"></i> <br><?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['nombres'] ?></p>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Clientes"><i class="fa-solid fa-user-check"></i> Clientes</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Colaboradores"><i class="fa-solid fa-user-gear"></i> Usuarios</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/Productos"><i class="fa-solid fa-file-powerpoint"></i> Productos</a></li>
                                <li><a class="dropdown-item" href="<?= $host ?>/views/reportes-ventas"><i class="fa-brands fa-shopify"></i> Registro Ventas</a></li>
                                
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item text-center" href="http://localhost/ProyectoFinal-SanMatias/controllers/login.controller.php?operacion=destroy"> Cerrar sesion <br> <i class="fa-solid fa-power-off"></i></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>