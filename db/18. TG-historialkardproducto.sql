USE granjasanmatias;


-- ---------------------- TGR EDICION --------------------
 drop trigger if exists `tr_kardex_producto_after_update`;
DELIMITER $$
CREATE TRIGGER tr_kardex_producto_after_update
AFTER UPDATE ON KardexAlmProducto
FOR EACH ROW
BEGIN
    INSERT INTO HistorialKardexProducto (
        idAlmacenProducto,
        idcolaborador,
        accion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        OLD.idAlmacenProducto,
        NEW.idcolaborador,
        'EDICION',
        CONCAT('Producto: ', (SELECT producto FROM Productos WHERE idproducto = OLD.idproducto),
               ', Motivo: ', OLD.motivomovimiento,
               ', Cantidad: ', OLD.cantidad,
               ', Stock: ', OLD.stockProducto),
        CONCAT('Producto: ', (SELECT producto FROM Productos WHERE idproducto = NEW.idproducto),
               ', Motivo: ', NEW.motivomovimiento,
               ', Cantidad: ', NEW.cantidad,
               ', Stock: ', NEW.stockProducto)
    );
END;

-- ---------------------- TGR ELIMINACION  --------------------
 drop trigger if exists `tr_kardex_producto_before_delete`;
DELIMITER $$
CREATE TRIGGER tr_kardex_producto_before_delete
BEFORE DELETE ON KardexAlmProducto
FOR EACH ROW
BEGIN
    INSERT INTO HistorialKardexProducto (
        idAlmacenProducto,
        idcolaborador,
        accion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        OLD.idAlmacenProducto,
        OLD.idcolaborador,
        'ELIMINACION',
        CONCAT('Producto: ', (SELECT producto FROM Productos WHERE idproducto = OLD.idproducto),
               ', Motivo: ', OLD.motivomovimiento,
               ', Cantidad: ', OLD.cantidad,
               ', Stock: ', OLD.stockProducto),
        ''
    );
END;

--  ------------------ PROCEDIMIENTO HISTORIAL --------------------
delimiter $$
CREATE PROCEDURE spu_ver_historial_producto()
BEGIN
    SELECT 
        h.idHistorial,
        h.idAlmacenProducto,
        c.nomusuario AS usuario,
        h.accion,
        h.datos_anteriores,
        h.datos_nuevos,
        DATE_FORMAT(h.fecha_accion, '%d/%m/%Y %H:%i:%s') AS fecha
    FROM HistorialKardexProducto h
    INNER JOIN colaboradores c ON h.idcolaborador = c.idcolaborador
    ORDER BY h.fecha_accion DESC;
END;
call spu_ver_historial_producto();
