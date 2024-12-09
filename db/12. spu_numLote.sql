USE granjasanmatias;

 -- ------------------------------------------- Registrar Lote ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_numLote`;

CREATE PROCEDURE spu_registrar_numLote(
IN _numlote VARCHAR(60),
IN _CantInicio INT,
IN _descripcion VARCHAR(60))
BEGIN
	INSERT INTO numLote 
		(numLote, CantInicio,  descripcion) VALUES 
        (_numlote,_CantInicio, _descripcion);
    SELECT @@last_insert_id 'idlote';
END;
 -- ------------------------------------------- Validar lote -----------------------------------------------------
 drop procedure if exists `spu_existe_lote`;

CREATE PROCEDURE spu_existe_lote(IN _numlote VARCHAR(90))
BEGIN
    SELECT * FROM numLote WHERE numLote = _numlote;
END;
-- --------------------------------- LISTAR ------------------------------
/*
DROP PROCEDURE IF EXISTS `spu_listar_numLote`;

CREATE PROCEDURE spu_listar_numLote()
BEGIN
    SELECT * FROM numLote;
END;
*/
-- --------------------------------- LISTAR lotes ------------------------------

DROP PROCEDURE IF EXISTS `spu_listar_numLote`;
CREATE PROCEDURE spu_listar_numLote()
BEGIN
    SELECT 
        idlote,
        numLote,
        CantInicio,
        edadAve,
        estado,
        CASE estado
            WHEN 'A' THEN '✅'  -- Check verde
            WHEN 'I' THEN '➖'  -- Menos gris
            ELSE '❔'          -- Opcional: símbolo para estados desconocidos
        END AS estado_icono,
        descripcion,
        create_at 
    FROM 
        numLote
    ORDER BY create_at DESC;
END;

-- --------------------------------- destivar lote ------------------------------
DROP PROCEDURE IF EXISTS spu_desactivar_numLote;

CREATE PROCEDURE spu_desactivar_numLote(IN _idlote INT)
BEGIN
    UPDATE numLote 
    SET estado = 'I'
    WHERE idlote = _idlote;
END;

DROP PROCEDURE IF EXISTS spu_activar_numLote;
-- --------------------------------- activar lote ------------------------------
CREATE PROCEDURE spu_activar_numLote(IN _idlote INT)
BEGIN
    UPDATE numLote 
    SET estado = 'A'
    WHERE idlote = _idlote;
END;

-- --------------------------------- conseguir ultimo lote------------------------------
CREATE PROCEDURE spu_listar_ultimo_numLote()
BEGIN
    SELECT 
        numLote
    FROM numLote
    ORDER BY create_at DESC
    LIMIT 1;
END;