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
    SELECT @@last_insert_id AS idventa;
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
	JOIN personas PERCOL ON COL.idpersona = PERCOL.idpersona
    ORDER BY VEN.idventa DESC;
END $$
DELIMITER ;
 -- ------------------------------------------- editar ventas ----------------------------------------------------- 
  drop procedure if exists `sp_editar_venta`;
DELIMITER //
CREATE PROCEDURE sp_editar_venta(
    IN p_idventa INT,
    IN p_estado VARCHAR(30),
    IN p_direccion VARCHAR(50)
)
BEGIN
    UPDATE ventas
    SET 
        estado = IFNULL(p_estado, estado),
        direccion = IFNULL(p_direccion, direccion)
    WHERE idventa = p_idventa;
END //
DELIMITER ;
 -- ------------------------------------------- listar ventas ----------------------------------------------------- 
 
   drop procedure if exists `sp_eliminar_venta`;
DELIMITER //

CREATE PROCEDURE sp_eliminar_venta(
    IN p_idventa INT
)
BEGIN
    DELETE FROM ventas
    WHERE idventa = p_idventa;
END //
DELIMITER ;

