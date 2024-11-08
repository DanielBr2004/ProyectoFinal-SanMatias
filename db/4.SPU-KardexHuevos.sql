USE granjasanmatias;
-- ------------------------------------------ Procedimiento de Validaciones para el Kardex --------------------------------------------------
drop procedure if exists `spu_insertar_kardexhuevo`;
DELIMITER $$
CREATE PROCEDURE spu_insertar_kardexhuevo
(
    IN _idcolaborador INT,
    IN _idhuevo INT,
    IN _tipomovimiento CHAR(1),
    IN _motivomoviento VARCHAR(500),
    IN _idlote INT,
    IN _cantidad SMALLINT,
    IN _descripcion VARCHAR(100)
    
)
BEGIN
	-- Stock Actual declarada por defecto en 0
    DECLARE _stockProducto INT DEFAULT 0;

    -- Se obtendrá el stock actual dependiendo que producto se seleccione 
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idhuevo = _idhuevo ORDER BY creado DESC LIMIT 1;

    -- Se realiza una condicion dependiendo del tipo movimiento E(entrada) S(salida) 
    IF _tipomovimiento = 'E' THEN
        SET _stockProducto = _stockProducto + _cantidad;
    ELSEIF _tipomovimiento = 'S' THEN
        SET _stockProducto = _stockProducto - _cantidad;
    END IF;

    -- Registramos el kardex 
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento,idlote, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idhuevo, _tipomovimiento, _motivomoviento,_idlote, _stockProducto, _cantidad, NULLIF(_descripcion,''), NOW());
END $$
-- ----------------------- LISTAR -----------------------
DROP PROCEDURE IF EXISTS `spu_listar_kardexhuevo`;
DELIMITER $$

CREATE PROCEDURE spu_listar_kardexhuevo()
BEGIN
    SELECT 
        kh.idAlmacenHuevos,
        c.nomusuario AS nombre_colaborador,
        th.tiposHuevos AS tipo_huevo,
        kh.motivomovimiento,
        kh.stockProducto,
        kh.cantidad,
        kh.descripcion,
        kh.creado
    FROM KardexAlmHuevo kh
    JOIN colaboradores c ON kh.idcolaborador = c.idcolaborador
    JOIN tipoHuevo th ON kh.idhuevo = th.idhuevo
    ORDER BY kh.creado DESC;
END $$
CALL spu_listar_kardexhuevo();

-- ------------------------------------------ Procedimiento para editar un registro en el Kardex --------------------------------------------------
DROP PROCEDURE IF EXISTS `spu_editar_kardexhuevo`;
DELIMITER $$
CREATE PROCEDURE spu_editar_kardexhuevo(
    IN _idAlmacenHuevos INT,
    IN _motivomovimiento VARCHAR(500),
    IN _cantidad SMALLINT,
    IN _descripcion VARCHAR(100)
)
BEGIN
    DECLARE _stockProducto INT;
    -- Obtener el stock actual antes de la actualización
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idAlmacenHuevos = _idAlmacenHuevos;
    -- Actualizar la cantidad y el motivo de movimiento
    UPDATE KardexAlmHuevo
    SET 
        motivomovimiento = _motivomovimiento,
        cantidad = _cantidad,
        descripcion = NULLIF(_descripcion, ''),
        creado = NOW()
    WHERE idAlmacenHuevos = _idAlmacenHuevos;

    -- Actualizar el stock de productos basado en el nuevo movimiento
    IF _motivomovimiento LIKE 'Salida%' THEN
        SET _stockProducto = _stockProducto - _cantidad;  -- Salida
    ELSEIF _motivomovimiento LIKE 'Entrada%' THEN
        SET _stockProducto = _stockProducto + _cantidad;  -- Entrada
    END IF;
    -- Actualizar el stock en el registro
    UPDATE KardexAlmHuevo
    SET stockProducto = _stockProducto
    WHERE idAlmacenHuevos = _idAlmacenHuevos;
END $$

-- ------------------------------- ELIMINAR ----------------------------------
DROP PROCEDURE IF EXISTS `spu_eliminar_kardexhuevo`;
DELIMITER $$

CREATE PROCEDURE spu_eliminar_kardexhuevo(
    IN _idAlmacenHuevos INT
)
BEGIN
    -- Elimina el registro de la tabla KardexAlmHuevo basado en el ID proporcionado
    DELETE FROM KardexAlmHuevo WHERE idAlmacenHuevos = _idAlmacenHuevos;
END $$
