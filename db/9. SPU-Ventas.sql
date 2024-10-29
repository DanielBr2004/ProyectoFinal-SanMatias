USE granjasanmatias;
 -- ------------------------------------------- Registrar ventas ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_ventas`;
DELIMITER $$
CREATE PROCEDURE spu_registrar_ventas
(
    IN _idcliente       INT,
    IN _idcolaborador   INT,
    IN _direccion       VARCHAR(90)
)
BEGIN 
    INSERT INTO ventas(idcliente, idcolaborador, direccion) 
    VALUES(_idcliente, _idcolaborador, _direccion);
    SELECT LAST_INSERT_ID() AS idventa;
END $$
DELIMITER ;

 -- ------------------------------------------- listar ventas ----------------------------------------------------- 
 drop procedure if exists `spu_listar_ventas`;
 DELIMITER $$
CREATE PROCEDURE spu_listar_ventas()
BEGIN
	SELECT 
		VEN.idventa,
        CASE
			WHEN CLI.tipodocumento ="RUC" THEN CLI.razonsocial
			WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PERCLI.nombres,' ',PERCLI.apematerno, ' ',PERCLI.apepaterno)
		END AS clientes,
        CONCAT(PERCOL.nombres, ' ',PERCOL.apepaterno, ' ',PERCOL.apematerno) AS Colaborador,
		VEN.fecha,
        VEN.direccion,
        VEN.estado
	FROM ventas VEN
	JOIN cliente CLI ON VEN.idcliente = CLI.idcliente
	JOIN personas PERCLI ON CLI.idpersona = PERCLI.idpersona
	JOIN colaboradores COL ON VEN.idcolaborador = COL.idcolaborador
	JOIN personas PERCOL ON COL.idpersona = PERCOL.idpersona;
END $$
DELIMITER ;