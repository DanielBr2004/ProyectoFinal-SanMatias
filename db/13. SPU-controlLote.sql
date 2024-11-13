USE granjasanmatias;

 -- ------------------------------------------- Registrar Control Lote ----------------------------------------------------- 
CREATE PROCEDURE spu_registrar_controlLote(
    IN _idlote INT,
    IN _mortalidad INT,
    IN _Alimento DECIMAL(6,2)
)
BEGIN
    DECLARE _AvesInicio INT;
    DECLARE _numaves INT;
    DECLARE _avesActuales INT;
    DECLARE _alimentoAve DECIMAL(6,2);

    -- Inicializar _AvesInicio desde la tabla numLote
    SELECT CantInicio INTO _AvesInicio FROM numLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;

    -- Inicializar _numaves con _AvesInicio
    SET _numaves = _AvesInicio;

    -- Actualizar _numaves con el último registro de la tabla controlLote si existe
    SELECT numaves INTO _numaves FROM controlLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;

    -- Calcular el número actual de aves y el alimento por ave
    SET _avesActuales = _numaves - _mortalidad;
    SET _alimentoAve = (_Alimento * 1000) / _numaves;

    -- Insertar el nuevo registro en la tabla controlLote
    INSERT INTO controlLote(idlote, numaves, mortalidad, alimento, alimentoAve, produccion, cantHuevos)
    VALUES (_idlote, _avesActuales, _mortalidad, _Alimento, _alimentoAve, NULL, NULL);

END;

CREATE PROCEDURE SPU_LISTAR_CONTROLLOTE(IN _idlote INT)
BEGIN
    SELECT
        create_at,
        idlote,
        numaves,
        mortalidad,
        alimento,
        alimentoAve,
        CONCAT(ROUND((cantHuevos / numaves) * 100, 2), '%') AS produccion,
        cantHuevos
    FROM controlLote
    WHERE idlote = _idlote;
END;    

CREATE PROCEDURE spu_listar_produccionLote(
    IN _numLote INT
)
BEGIN
    SELECT 
        cl.idlote,
        DATE(cl.create_at) AS fecha,
        CONCAT(ROUND((cl.cantHuevos / cl.numaves) * 100, 2), '%') AS produccion
    FROM 
        controlLote cl
    JOIN 
        numLote nl ON cl.idlote = nl.idlote
    WHERE 
        nl.numLote = _numLote
        AND nl.estado = 'A' -- Filtrar solo los lotes activos
    ORDER BY 
        cl.create_at DESC
    LIMIT 30;
END;