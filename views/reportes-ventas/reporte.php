<?php

require_once '../../vendor/autoload.php';
require_once '../../models/PdfReportVentas.php';

use Spipu\Html2Pdf\Html2Pdf;

if (!isset($_GET['idventa']) || empty($_GET['idventa'])) {
    die('No se proporcionó el parámetro idventa.');
}

$idVenta = $_GET['idventa'];
$reporte = new ReportVentas();

// Obtener datos desde los procedimientos almacenados
$detalleVentas = $reporte->getDetalleVentas(['idventa' => $idVenta]);
$ventas = $reporte->getVentas();

// Filtrar datos específicos por `idventa`
$ventaFiltrada = array_filter($ventas, function ($venta) use ($idVenta) {
    return isset($venta['ID Venta']) && $venta['ID Venta'] == $idVenta;
});
$detalleFiltrado = array_filter($detalleVentas, function ($detalle) use ($idVenta) {
    return isset($detalle['ID Venta']) && $detalle['ID Venta'] == $idVenta;
});

// Validar si se encontraron datos
if (empty($ventaFiltrada)) {
    die('No se encontraron datos para la venta especificada.');
}

// Preparar los datos para el PDF
$venta = reset($ventaFiltrada); // Obtener el primer (y único) registro de la venta
$detalles = $detalleFiltrado;

try {
    ob_start(); // Inicia el buffer de salida

    // Incluir los estilos CSS directamente en el archivo PHP
    ?>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .header {
            background-color: #f5f5f5;
            padding: 20px 0;
        }

        .header img {
            width: 100px;
            margin-left: 20px;
            vertical-align: middle;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }

        /* Subtítulo centrado */
        h3 {
            font-size: 25px;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .info-table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 30px;
            margin-left: 50px;
        }

        .info-table th, .info-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .info-table th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }

        .info-table td {
            background-color: #fff;
            color: #555;
        }

        .footer {
            margin-top: 30px;
            font-size: 12px;
            color: #777;
            text-align: center;
        }

        /* Estilos para la tabla de detalles */
        .details-table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 130px;
        }

        .details-table th, .details-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .details-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Ajustes generales para centrar el contenido */
        .content-wrapper {
            width: 90%;
            margin: 0 auto;
        }
    </style>

    <page backtop="10mm" backbottom="10mm" backleft="10mm" backright="10mm">
        <!-- Header con logo -->
        <div class="header">
            
            <img src="../../img/logoSanMatias.jpg" alt="Logo" />
            <div class="title">Reporte de Venta</div>
        </div>

        <!-- Información de la venta -->
        <div class="content-wrapper">
            <h3>Información de la Venta</h3>
            <table class="info-table">
                <tr><th>ID Venta:</th><td><?= $venta['ID Venta'] ?></td></tr>
                <tr><th>Cliente:</th><td><?= $venta['Cliente'] ?></td></tr>
                <tr><th>Colaborador:</th><td><?= $venta['Colaborador'] ?></td></tr>
                <tr><th>Fecha de Venta:</th><td><?= $venta['Fecha de Venta'] ?></td></tr>
                <tr><th>Estado:</th><td><?= $venta['Estado'] ?></td></tr>
            </table>

            <!-- Detalles de la venta en tabla horizontal centrada -->
            <h3>Detalles de los Productos</h3>
            <table class="details-table">
                <thead>
                    <tr>
                        <th>Nombre del Producto</th>
                        <th>Cantidad</th>
                        <th>Peso Total</th>
                        <th>Precio</th>
                        <th>Unidad de Medida</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($detalles as $detalle): ?>
                    <tr>
                        <td><?= $detalle['Nombre Huevo'] ?></td>
                        <td><?= $detalle['Cantidad'] ?></td>
                        <td><?= $detalle['Peso Total']?></td>
                        <td>s/.<?= $detalle['Precio Venta'] ?></td>
                        <td><?= $detalle['Unidad de Medida'] ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="2">IGV:</th>
                        <td colspan="2">s/.<?= $detalle['IGV'] ?></td>
                    </tr>
                    <tr>
                        <th colspan="2">Total:</th>
                        <td colspan="2">s/.<?= $detalle['Total Venta'] ?></td>
                    </tr>
                    <tr>
                        <th colspan="2">Total con IGV:</th>
                        <td colspan="2">s/.<?= $detalle['Total con IGV'] ?></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p> Reporte Sistematizado por el Sistema S.M Granja Avícola "San Matias" S.A.C. 2024 - VERSION 1.0.0</p>
        </div>
    </page>

    <?php
    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es', true, 'UTF-8', 0);
    $html2pdf->writeHTML($content);
    $html2pdf->output('reporte_venta_' . $idVenta . '.pdf');
} catch (Exception $e) {
    echo "Error generando el PDF: " . $e->getMessage();
}
?>
