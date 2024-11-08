USE granjasanmatias;

 -- ------------------------------------------- Registrar Lote ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_numLote`;
DELIMITER $$
CREATE PROCEDURE spu_registrar_numLote(
IN _numlote VARCHAR(60),
IN _descripcion VARCHAR(60))
BEGIN
	INSERT INTO numLote 
		(numLote, descripcion) VALUES 
        (_numlote,_descripcion);
END $$

 -- ------------------------------------------- Validar lote -----------------------------------------------------
 drop procedure if exists `spu_existe_lote`;
  DELIMITER $$
CREATE PROCEDURE spu_existe_lote(IN _numlote VARCHAR(90))
BEGIN
    SELECT * FROM numLote WHERE numLote = _numlote;
END $$