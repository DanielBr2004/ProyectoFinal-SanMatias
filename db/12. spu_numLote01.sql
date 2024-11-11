USE granjasanmatias;


DROP PROCEDURE IF EXISTS `spu_listar_numLote`;
CREATE PROCEDURE spu_listar_numLote()
BEGIN
    SELECT 
        idlote,
        numLote,
        CantInicio,
        edadAve,
        FechaIngreso,
        estado,
        CASE estado
            WHEN 'A' THEN '✅'  -- Check verde
            WHEN 'I' THEN '➖'  -- Menos gris
            ELSE '❔'          -- Opcional: símbolo para estados desconocidos
        END AS estado_icono,
        descripcion,
        create_at
    FROM 
        numLote;
END;

DROP PROCEDURE IF EXISTS spu_desactivar_numLote;

CREATE PROCEDURE spu_desactivar_numLote(IN _idlote INT)
BEGIN
    UPDATE numLote 
    SET estado = 'I'
    WHERE idlote = _idlote;
END;

DROP PROCEDURE IF EXISTS spu_activar_numLote;

CREATE PROCEDURE spu_activar_numLote(IN _idlote INT)
BEGIN
    UPDATE numLote 
    SET estado = 'A'
    WHERE idlote = _idlote;
END;