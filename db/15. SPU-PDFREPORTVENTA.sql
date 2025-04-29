USE granjasanmatias;
-- ---------------------------- GENERAR PDF DETALLE VENTAS ------------------------------
DROP PROCEDURE IF EXISTS `spu_detalleventas_pdf`;

CREATE PROCEDURE spu_detalleventas_pdf( IN _idventa INT )
BEGIN
    DECLARE _totalVenta DECIMAL(10, 2);
    DECLARE _igv DECIMAL(10, 2);
    DECLARE _totalConIgv DECIMAL(10, 2);

    -- Calcular el total de la venta
    SELECT 
        ROUND(SUM(d.pesoTotal * d.precioVenta), 2) INTO _totalVenta
    FROM 
        detalleventas d
    WHERE 
        d.idventa = _idventa;

    -- Calcular el IGV y el total con IGV
    SET _igv = ROUND(_totalVenta * 0.18, 2);
    SET _totalConIgv = ROUND(_totalVenta + _igv, 2);

    -- Consulta para generar el reporte de detalle de ventas
    SELECT 
        d.iddetalleventa AS "ID Detalle",
        d.idventa AS "ID Venta",
        d.pesoTotal AS "Peso Total",
        t.tiposHuevos AS "Nombre Huevo",
        d.cantidad AS "Cantidad",
        d.precioVenta AS "Precio Venta",
        d.UnidadMedida AS "Unidad de Medida",
        ROUND(d.pesoTotal * d.precioVenta, 2) AS "Total a Pagar",
        _totalVenta AS "Total Venta",
        _igv AS "IGV",
        _totalConIgv AS "Total con IGV"
    FROM 
        detalleventas d
    INNER JOIN 
        tipoHuevo t ON d.idhuevo = t.idhuevo -- Relación para obtener el nombre del huevo
    WHERE 
        d.idventa = _idventa;
END;

-- ---------------------------- GENERAR PDF VENTAS ------------------------------
DROP PROCEDURE IF EXISTS `spu_ventas_pdf`;

CREATE PROCEDURE spu_ventas_pdf()
BEGIN
    SELECT 
        VEN.idventa AS "ID Venta",
        CASE
            WHEN CLI.tipodocumento = "RUC" THEN CLI.razonsocial
            WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PERCLI.nombres, ' ', PERCLI.apematerno, ' ', PERCLI.apepaterno)
        END AS "Cliente",
        CONCAT(PERCOL.nombres, ' ', PERCOL.apepaterno, ' ', PERCOL.apematerno) AS "Colaborador",
        VEN.fecha AS "Fecha de Venta",
        VEN.estado AS "Estado"
    FROM 
        ventas VEN
    INNER JOIN 
        cliente CLI ON VEN.idcliente = CLI.idcliente
    LEFT JOIN 
        personas PERCLI ON CLI.idpersona = PERCLI.idpersona
    LEFT JOIN 
        colaboradores COL ON VEN.idcolaborador = COL.idcolaborador
    LEFT JOIN 
        personas PERCOL ON COL.idpersona = PERCOL.idpersona;
END;

-- ---------------------------- GENERAR PDF CLIENTES ------------------------------
DROP PROCEDURE IF EXISTS `spu_clientes_pdf`;

CREATE PROCEDURE spu_clientes_pdf()
BEGIN
    SELECT 
        CLI.idcliente AS "ID Cliente",
        PER.nrodocumento AS "Documento",
        CLI.tipodocumento AS "Tipo de Documento",
        CASE
            WHEN CLI.tipodocumento = "RUC" THEN CLI.razonsocial
            WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PER.nombres, ' ', PER.apematerno, ' ', PER.apepaterno)
        END AS "Nombre Cliente"
    FROM cliente CLI
    INNER JOIN personas PER
    ON PER.idpersona = CLI.idpersona
    ORDER BY CLI.idcliente DESC;
END;