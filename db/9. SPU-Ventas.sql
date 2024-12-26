USE granjasanmatias;
 -- ------------------------------------------- Registrar ventas ----------------------------------------------------- 
 DROP PROCEDURE IF EXISTS `spu_registrar_ventas`;

CREATE PROCEDURE spu_registrar_ventas
(
    IN _idcliente       INT,
    IN _idcolaborador   INT
)
BEGIN 
    INSERT INTO ventas(idcliente, idcolaborador) 
    VALUES(_idcliente, _idcolaborador);
    SELECT @@last_insert_id AS idventa;
END;
 -- ------------------------------------------- listar ventas ----------------------------------------------------- 
 DROP PROCEDURE IF EXISTS `spu_listar_ventas`;

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
        VEN.estado
	FROM ventas VEN
	JOIN cliente CLI ON VEN.idcliente = CLI.idcliente
	JOIN personas PERCLI ON CLI.idpersona = PERCLI.idpersona
	JOIN colaboradores COL ON VEN.idcolaborador = COL.idcolaborador
	JOIN personas PERCOL ON COL.idpersona = PERCOL.idpersona
    ORDER BY VEN.idventa DESC;
END;
 -- ------------------------------------------- editar ventas ----------------------------------------------------- 
  DROP PROCEDURE IF EXISTS `sp_editar_venta`;
CREATE PROCEDURE sp_editar_venta(
    IN p_idventa INT,
    IN p_estado VARCHAR(30)
)
BEGIN
    UPDATE ventas
    SET 
        estado = IFNULL(p_estado, estado)
    WHERE idventa = p_idventa;
END;

 -- ------------------------------------------- listar ventas ----------------------------------------------------- 
 
   DROP PROCEDURE IF EXISTS `sp_eliminar_venta`;
CREATE PROCEDURE sp_eliminar_venta(
    IN p_idventa INT
)
BEGIN
    -- Eliminar primero los detalles de la venta
    DELETE FROM detalleventas
    WHERE idventa = p_idventa;

    -- Luego, eliminar la venta
    DELETE FROM ventas
    WHERE idventa = p_idventa;
END;


