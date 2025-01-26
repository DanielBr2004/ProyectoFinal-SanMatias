USE granjasanmatias;

-- ---------------------- TGR EDICION --------------------
 drop trigger if exists `tr_kardex_after_update`;
CREATE TRIGGER tr_kardex_after_update
AFTER UPDATE ON KardexAlmHuevo
FOR EACH ROW
BEGIN
    INSERT INTO HistorialKardexHuevo (
        idAlmacenHuevos,
        idcolaborador,
        accion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        OLD.idAlmacenHuevos,
        NEW.idcolaborador,
        'EDICION',
        CONCAT('Tipo: ', (SELECT tiposHuevos FROM tipoHuevo WHERE idhuevo = OLD.idhuevo),
               ', Motivo: ', OLD.motivomovimiento,
               ', Cantidad: ', OLD.cantidad,
               ', Stock: ', OLD.stockProducto),
        CONCAT('Tipo: ', (SELECT tiposHuevos FROM tipoHuevo WHERE idhuevo = NEW.idhuevo),
               ', Motivo: ', NEW.motivomovimiento,
               ', Cantidad: ', NEW.cantidad,
               ', Stock: ', NEW.stockProducto)
    );
END;

-- ---------------------- TGR ELIMINACION  --------------------
 drop trigger if exists `tr_kardex_before_delete`;
CREATE TRIGGER tr_kardex_before_delete
BEFORE DELETE ON KardexAlmHuevo
FOR EACH ROW
BEGIN
    INSERT INTO HistorialKardexHuevo (
        idAlmacenHuevos,
        idcolaborador,
        accion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        OLD.idAlmacenHuevos,
        OLD.idcolaborador,
        'ELIMINACION',
        CONCAT('Tipo: ', (SELECT tiposHuevos FROM tipoHuevo WHERE idhuevo = OLD.idhuevo),
               ', Motivo: ', OLD.motivomovimiento,
               ', Cantidad: ', OLD.cantidad,
               ', Stock: ', OLD.stockProducto),
        ''  -- Empty string instead of NULL
    );
END;
--  ------------------ PROCEDIMIENTO HISTORIAL --------------------
 drop procedure if exists `spu_ver_historial`;
CREATE PROCEDURE spu_ver_historial()
BEGIN
    SELECT 
        h.idHistorial,
        c.nomusuario AS usuario,
        h.accion,
        h.datos_anteriores,
        h.datos_nuevos,
        DATE_FORMAT(h.fecha_accion, '%d/%m/%Y %H:%i:%s') AS fecha
    FROM HistorialKardexHuevo h
    INNER JOIN colaboradores c ON h.idcolaborador = c.idcolaborador
    ORDER BY h.fecha_accion DESC;
END;
call spu_ver_historial();
