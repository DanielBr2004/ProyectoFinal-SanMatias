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
END;
 -- ------------------------------------------- Validar lote -----------------------------------------------------
 drop procedure if exists `spu_existe_lote`;

CREATE PROCEDURE spu_existe_lote(IN _numlote VARCHAR(90))
BEGIN
    SELECT * FROM numLote WHERE numLote = _numlote;
END;
-- --------------------------------- LISTAR ------------------------------
DROP PROCEDURE IF EXISTS `spu_listar_numLote`;

CREATE PROCEDURE spu_listar_numLote()
BEGIN
    SELECT * FROM numLote;
END;