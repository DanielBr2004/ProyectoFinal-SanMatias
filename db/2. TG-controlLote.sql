USE granjasanmatias;


 drop trigger if exists `trg_sumar_cantidad_kardex`;

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
END;


-- -----------------------aumentar edad ---------------------------------------

CREATE EVENT evt_aumentar_edadAve
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    DECLARE _idlote INT;
    DECLARE _edadAve INT;

    -- Obtener el idlote del último registro en controlLote
    SELECT idlote INTO _idlote
    FROM controlLote
    ORDER BY create_at DESC
    LIMIT 1;

    -- Obtener la edadAve del último registro para el idlote obtenido
    SELECT edadAve INTO _edadAve
    FROM controlLote
    WHERE idlote = _idlote
    ORDER BY create_at DESC
    LIMIT 1;

    -- Incrementar la edadAve
    SET _edadAve = _edadAve + 1;

    -- Actualizar la edadAve del último registro para el idlote obtenido
    UPDATE controlLote
    SET edadAve = _edadAve
    WHERE idlote = _idlote
    ORDER BY create_at DESC
    LIMIT 1;
END;




