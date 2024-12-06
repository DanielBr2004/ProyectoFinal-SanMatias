USE granjasanmatias;
-- ---------------------------- GENERAR PDF KARDEX HUEVOS ------------------------------
DROP PROCEDURE IF EXISTS `spu_kardexHuevos_pdf`;
CREATE PROCEDURE spu_kardexHuevos_pdf()
BEGIN
    SELECT 
        kh.idAlmacenHuevos,
        c.nomusuario AS nombre_colaborador,
        th.tiposHuevos AS tipo_huevo,
        kh.motivomovimiento,
        kh.stockProducto,
        kh.cantidad,
        kh.descripcion,
        nl.numLote AS num_lote,
        kh.creado AS fecha_creacion  
    FROM KardexAlmHuevo kh
    JOIN colaboradores c ON kh.idcolaborador = c.idcolaborador
    JOIN tipoHuevo th ON kh.idhuevo = th.idhuevo
    LEFT JOIN numLote nl ON kh.idlote = nl.idlote
    ORDER BY kh.creado DESC;
END;
call spu_kardexHuevos_pdf();