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
$detalleVentas = $reporte->getDetalleVentas();
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

    // Incluir los estilos desde el archivo
    echo file_get_contents('../../views/reportes-ventas/estilos.html');

    // Generar el contenido del reporte
    ?>
    <page>
        <h1>Reporte de Venta</h1>
        <h3>Información de la Venta</h3>
        <table class="info-table">
            <tr><th>ID Venta:</th><td><?= $venta['ID Venta'] ?></td></tr>
            <tr><th>Cliente:</th><td><?= $venta['Cliente'] ?></td></tr>
            <tr><th>Colaborador:</th><td><?= $venta['Colaborador'] ?></td></tr>
            <tr><th>Fecha de Venta:</th><td><?= $venta['Fecha de Venta'] ?></td></tr>
            <tr><th>Estado:</th><td><?= $venta['Estado'] ?></td></tr>
        </table>

        <h3>Detalles de los Productos</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>ID Detalle</th>
                    <th>Nombre del Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Unidad de Medida</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($detalles as $detalle): ?>
                <tr>
                    <td><?= $detalle['ID Detalle'] ?></td>
                    <td><?= $detalle['Nombre Huevo'] ?></td>
                    <td><?= $detalle['Cantidad'] ?></td>
                    <td><?= $detalle['Precio Venta'] ?></td>
                    <td><?= $detalle['Unidad de Medida'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
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
