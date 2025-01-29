USE granjasanmatias;


 drop trigger if exists `trg_sumar_cantidad_kardex`;

-- Trigger para manejar inserciones
CREATE TRIGGER trg_sumar_cantidad_kardex_insert
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

-- Trigger para manejar actualizaciones
CREATE TRIGGER trg_sumar_cantidad_kardex_update
AFTER UPDATE ON KardexAlmHuevo
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

-- Trigger para manejar eliminaciones

CREATE TRIGGER trg_actualizar_cantidad_kardex_edit
AFTER UPDATE ON KardexAlmHuevo
FOR EACH ROW
BEGIN
    DECLARE diferencia INT;
    DECLARE totalCantidad INT;
    
    -- Calcular la diferencia entre la cantidad nueva y antigua
    SET diferencia = NEW.cantidad - OLD.cantidad;
    
    -- Obtener el total actualizado
    SELECT SUM(cantidad) INTO totalCantidad
    FROM KardexAlmHuevo
    WHERE DATE(creado) = DATE(NEW.creado) AND idlote = NEW.idlote;
    
    -- Actualizar la columna cantHuevos en controlLote
    UPDATE controlLote
    SET cantHuevos = totalCantidad
    WHERE idlote = NEW.idlote
    ORDER BY idcontrollote DESC
    LIMIT 1;
END;

