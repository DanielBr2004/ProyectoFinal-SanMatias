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
 
-- ELIMINAR NUEVO ----------------------
DROP PROCEDURE IF EXISTS sp_eliminar_venta;
delimiter $$
CREATE PROCEDURE sp_eliminar_venta(
    IN p_idventa INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_idhuevo INT;
    DECLARE v_cantidad INT;
    DECLARE v_stockProducto INT;

    -- Cursor para iterar sobre los detalles de la venta
    DECLARE cur_detalle CURSOR FOR
        SELECT idhuevo, cantidad
        FROM detalleventas
        WHERE idventa = p_idventa;

    -- Manejador de excepciones del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrimos el cursor
    OPEN cur_detalle;

    -- Iteramos sobre cada detalle de la venta
    read_loop: LOOP
        FETCH cur_detalle INTO v_idhuevo, v_cantidad;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Actualizamos el stock en el Kardex devolviendo los productos
        INSERT INTO KardexAlmHuevo(
            idcolaborador,
            idhuevo,
            tipomovimiento,
            motivomovimiento,
            idlote,
            stockProducto,
            cantidad,
            descripcion,
            creado
        )
        SELECT 
            (SELECT idcolaborador FROM ventas WHERE idventa = p_idventa),
            v_idhuevo,
            'E', -- Tipo de movimiento 'Entrada'
            'Devolución por eliminación de venta',
            idlote,
            stockProducto + v_cantidad,
            v_cantidad,
            'Devolución al stock',
            NOW()
        FROM KardexAlmHuevo
        WHERE idhuevo = v_idhuevo
        ORDER BY creado DESC
        LIMIT 1;
    END LOOP;

    -- Cerramos el cursor
    CLOSE cur_detalle;

    -- Luego, eliminamos la venta
        UPDATE ventas
    SET estado = 'Anulado'
    WHERE idventa = p_idventa;
END;