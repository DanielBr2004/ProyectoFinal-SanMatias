USE granjasanmatias;
-- ---------------------------- GENERAR PDF DETALLE VENTS ------------------------------
DROP PROCEDURE IF EXISTS `spu_detalleventas_pdf`;

CREATE PROCEDURE spu_detalleventas_pdf()
BEGIN
    -- Consulta para generar el reporte de detalle de ventas
    SELECT 
        d.iddetalleventa AS "ID Detalle",
        d.idventa AS "ID Venta",
        t.tiposHuevos AS "Nombre Huevo",
        d.cantidad AS "Cantidad",
        d.precioVenta AS "Precio Venta",
        d.UnidadMedida AS "Unidad de Medida"
    FROM 
        detalleventas d
    INNER JOIN 
        tipoHuevo t ON d.idhuevo = t.idhuevo; -- Relación para obtener el nombre del huevo
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
    FROM ventas VEN
    JOIN cliente CLI ON VEN.idcliente = CLI.idcliente
    JOIN personas PERCLI ON CLI.idpersona = PERCLI.idpersona
    JOIN colaboradores COL ON VEN.idcolaborador = COL.idcolaborador
    JOIN personas PERCOL ON COL.idpersona = PERCOL.idpersona
    ORDER BY VEN.idventa DESC;
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