USE granjasanmatias;

 -- ------------------------------------------- Listado productos ----------------------------------------------------- 
 drop procedure if exists `spu_listar_tipohuevo`;
DELIMITER $$
CREATE PROCEDURE spu_listar_tipohuevo()
BEGIN
    SELECT * FROM tipohuevo;
END $$