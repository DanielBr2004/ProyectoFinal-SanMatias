<?php

require_once '../../vendor/autoload.php';
require_once '../../models/PdfReportHuevos.php';

use Spipu\Html2Pdf\Html2Pdf;

if (!isset($_GET['idAlmacenHuevos']) || empty($_GET['idAlmacenHuevos'])) {
    die('No se proporcionó el parámetro idAlmacenHuevos.');
}

$idAlmacenHuevos = $_GET['idAlmacenHuevos'];
$reporte = new ReportHuevos();

// Obtener datos desde el procedimiento almacenado
$detallesHuevos = $reporte->getDetallesHuevos();

// Filtrar datos específicos por `idAlmacenHuevos`
$detalleFiltrado = array_filter($detallesHuevos, function ($detalle) use ($idAlmacenHuevos) {
    return isset($detalle['idAlmacenHuevos']) && $detalle['idAlmacenHuevos'] == $idAlmacenHuevos;
});

// Validar si se encontraron datos
if (empty($detalleFiltrado)) {
    die('No se encontraron datos para el almacen de huevos especificado.');
}

// Preparar los datos para el PDF
$detalle = reset($detalleFiltrado); // Obtener el primer (y único) registro

try {
    ob_start(); // Inicia el buffer de salida

    // Estilos CSS en línea (basados en el diseño de la imagen proporcionada)
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

        .sub-title {
            font-size: 25px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .info-table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 30px;
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
    </style>

    <page backtop="10mm" backbottom="10mm" backleft="10mm" backright="10mm">
        <!-- Header con logo y título -->
        <div class="header">
            <img src="../../img/logoSanMatias.jpg" alt="Logo" />
            <div class="title"> Reporte Kardex Huevos</div>
        </div>

        <!-- Subtítulo -->
        <div class="sub-title">Detalles del Almacen de Huevos</div>

        <!-- Información de la venta -->
        <table class="info-table">
            <tr><th>ID Almacen:</th><td><?= $detalle['idAlmacenHuevos'] ?></td></tr>
            <tr><th>Colaborador:</th><td><?= $detalle['nombre_colaborador'] ?></td></tr>
            <tr><th>Tipo de Huevo:</th><td><?= $detalle['tipo_huevo'] ?></td></tr>
            <tr><th>Motivo Movimiento:</th><td><?= $detalle['motivomovimiento'] ?></td></tr>
            <tr><th>Stock Producto:</th><td><?= $detalle['stockProducto'] ?></td></tr>
            <tr><th>Cantidad:</th><td><?= $detalle['cantidad'] ?></td></tr>
            <tr><th>Descripción:</th><td><?= $detalle['descripcion'] ?></td></tr>
            <tr><th>Nº Lote:</th><td><?= $detalle['num_lote'] ?></td></tr>
        </table>

        <!-- Footer -->
        <div class="footer">
            <p>Reporte generado automáticamente El Sistema 2024 Granja Avícola "San Matias" S.A.C. - VERSION 1.0.0</p>
            
        </div>
    </page>
    <?php

    // Capturar el contenido generado
    $content = ob_get_clean();

    // Crear el objeto de Html2Pdf
    $html2pdf = new Html2Pdf('P', 'A4', 'es', true, 'UTF-8', 0);
    $html2pdf->writeHTML($content);
    $html2pdf->output('reporte_kardex_huevo_' . $idAlmacenHuevos . '.pdf');
} catch (Exception $e) {
    echo "Error generando el PDF: " . $e->getMessage();
}
?>
