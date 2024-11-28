USE granjasanmatias;


 drop trigger if exists `trg_sumar_cantidad_kardex`;

-- Trigger para sumar la cantidad de huevos en el último registro de controlLote
CREATE TRIGGER trg_sumar_cantidad_kardex
AFTER INSERT ON KardexAlmHuevo
FOR EACH ROW
BEGIN
    DECLARE totalCantidad INT;
    -- Sumar la cantidad de todos los registros que coincidan con la misma fecha y idlote
    SELECT SUM(cantidad) INTO totalCantidad
    FROM KardexAlmHuevo
    WHERE DATE(creado) = DATE(NEW.creado) AND idlote = NEW.idlote;

    -- Actualizar la columna cantHuevos en el último registro de controlLote
    UPDATE controlLote
    SET cantHuevos = totalCantidad
    WHERE idlote = NEW.idlote
    ORDER BY idcontrollote DESC
    LIMIT 1;
END;



