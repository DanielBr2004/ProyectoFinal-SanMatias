USE granjasanmatias;


 drop trigger if exists `trg_sumar_cantidad_kardex`;
DELIMITER $$

CREATE TRIGGER trg_sumar_cantidad_kardex
AFTER INSERT ON KardexAlmHuevo
FOR EACH ROW
BEGIN
    DECLARE totalCantidad INT;
    DECLARE numAves INT;
    DECLARE porcentajeproduccion DECIMAL(6,2);

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

    -- Obtener el número de aves del último registro en controlLote
    SELECT numaves INTO numAves
    FROM controlLote
    WHERE idlote = NEW.idlote
    ORDER BY idcontrollote DESC
    LIMIT 1;

    -- Calcular la producción solo si numAves es mayor que 0
    IF numAves > 0 THEN
        SET porcentajeproduccion = (totalCantidad / numAves) * 100;
    ELSE
        SET porcentajeproduccion = 0;
    END IF;

    -- Actualizar la columna produccion en el último registro de controlLote
    UPDATE controlLote
    SET produccion = porcentajeproduccion
    WHERE idlote = NEW.idlote
    ORDER BY idcontrollote DESC
    LIMIT 1;
END $$

DELIMITER ;