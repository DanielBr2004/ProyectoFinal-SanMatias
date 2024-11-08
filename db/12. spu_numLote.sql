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