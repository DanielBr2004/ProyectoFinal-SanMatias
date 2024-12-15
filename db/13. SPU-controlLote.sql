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
    SELECT numaves  INTO _AvesInicio FROM controlLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;

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

-- ------------------------------------------- Listar Control Lote -----------------------------------------------------
DROP PROCEDURE IF EXISTS SPU_LISTAR_CONTROLLOTE;
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
-- ------------------------------------------- Listar Producción Lote -----------------------------------------------------
CREATE PROCEDURE spu_listar_produccionLote(
    IN _numLote INT
)
BEGIN
    SELECT * FROM (
        SELECT 
            cl.idlote,
            cl.alimentoAve,
            DATE(cl.create_at) AS fecha,
            CONCAT(ROUND((cl.cantHuevos / cl.numaves) * 100, 2)) AS produccion
        FROM 
            controlLote cl
        JOIN 
            numLote nl ON cl.idlote = nl.idlote
        WHERE 
            nl.numLote = _numLote
            AND nl.estado = 'A' -- Filtrar solo los lotes activos
        ORDER BY 
            cl.create_at DESC
        LIMIT 30
    ) AS subquery
    ORDER BY 
        fecha ASC;
END;

-- ------------------------------------------- Mortalidad Acumulada -----------------------------------------------------

CREATE PROCEDURE spu_mortalidad_acumulada
(
    IN _idlote INT
)
BEGIN
    -- Variables to store results
    DECLARE _cantInicio INT;
    DECLARE _mortalidadTotal INT;
    DECLARE _cantActual INT;
    DECLARE _edadAve INT;
    DECLARE _ratio DECIMAL(10, 2);

    -- Get initial quantity and age only for active lots
    SELECT CantInicio, edadAve INTO _cantInicio, _edadAve
    FROM numLote 
    WHERE idlote = _idlote 
    AND estado = 'A';

    -- Calculate total mortality
    SELECT IFNULL(SUM(mortalidad), 0) INTO _mortalidadTotal
    FROM controlLote
    WHERE idlote = _idlote;

    -- Calculate current quantity
    SET _cantActual = _cantInicio - _mortalidadTotal;

    -- Calculate ratio
    IF _mortalidadTotal > 0 THEN
        SET _ratio = (_mortalidadTotal / _cantInicio) * 100;
    ELSE
        SET _ratio = 0;
    END IF;

    -- Return results
    SELECT 
        nl.numLote,
        _cantInicio AS cantidad_inicial,
        _mortalidadTotal AS mortalidad_acumulada,
        _edadAve AS edad_ave,
        DATE(nl.create_at) AS create_at,
        _ratio AS ratio
    FROM numLote nl
    WHERE nl.idlote = _idlote 
    AND nl.estado = 'A';

END;

-- ------------------------------------------- Validar Producción -----------------------------------------------------
CREATE PROCEDURE spu_validar_produccion
(
    IN _idlote INT
)
BEGIN
    SELECT * 
    FROM controlLote 
    WHERE idlote =  _idlote
    AND DATE(create_at) = CURRENT_DATE();
END;

-- ------------------------------------------- Validar Produccto Registrado -----------------------------------------------------
CREATE PROCEDURE spu_validar_producc_registrado
(
    IN _idHuevo INT,
    IN _idlote INT
)
BEGIN
    SELECT idHuevo, idlote, creado 
    FROM KardexAlmHuevo 
    WHERE idHuevo = _idHuevo
    AND idlote = _idlote 
    AND DATE(creado) = CURRENT_DATE();
END;


-- ------------------------------------------- Comparar Mortalidad -----------------------------------------------------

DROP PROCEDURE IF EXISTS spu_comparar_mortalidad;

CREATE PROCEDURE spu_comparar_mortalidad(IN _idLote INT)
BEGIN
    DECLARE totalCantidad INT;
    DECLARE NumGallinas INT;
    DECLARE resultado BOOLEAN; -- Declarar la variable resultado

    -- Inicializar la variable resultado
    SET resultado = FALSE;

    -- Sumar la cantidad de todos los registros que coincidan con el idlote
    SELECT SUM(mortalidad) INTO totalCantidad
    FROM controlLote
    WHERE idlote = _idLote;

    -- Obtener CantInicio de la tabla numLote
    SELECT CantInicio INTO NumGallinas
    FROM numLote
    WHERE idlote = _idLote;

    -- Comparar totalCantidad con cantInicio
    IF totalCantidad = NumGallinas THEN
        SET resultado = 1;
    ELSE
        SET resultado = 0;
    END IF;

    -- Devolver el resultado
    SELECT totalCantidad AS CantInicio, NumGallinas AS NumGallinas, resultado;
END;

-- 15/12/24
