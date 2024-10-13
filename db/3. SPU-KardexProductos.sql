USE granjasanmatias;
-- ------------------------------------------ Procedimiento de Validaciones para el Kardex --------------------------------------------------
drop procedure if exists `spu_insertar_KardexAlmProducto`;
DELIMITER $$
CREATE PROCEDURE spu_insertar_KardexAlmProducto
(
    IN _idcolaborador INT,
    IN _idproducto INT,
    IN _tipomovimiento CHAR(1),
    IN _motivomoviento VARCHAR(100),
    IN _cantidad SMALLINT,
    IN _descripcion 	VARCHAR(100)
)
BEGIN
	-- Stock Actual declarada por defecto en 0
    DECLARE _stockProducto INT DEFAULT 0;

    -- Se obtendrá el stock actual dependiendo que producto se seleccione 
    SELECT stockProducto INTO _stockProducto FROM KardexAlmProducto WHERE idproducto = _idproducto ORDER BY creado DESC LIMIT 1;

    -- Se realiza una condicion dependiendo del tipo movimiento E(entrada) S(salida) 
    IF _tipomovimiento = 'E' THEN
        SET _stockProducto = _stockProducto + _cantidad;
    ELSEIF _tipomovimiento = 'S' THEN
        SET _stockProducto = _stockProducto - _cantidad;
    END IF;

    -- Registramos el kardex 
    INSERT INTO KardexAlmProducto (idcolaborador, idproducto, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idproducto, _tipomovimiento, _motivomoviento, _stockProducto, _cantidad, NULLIF(_descripcion, ''), NOW());
END $$
-- ------------------------------- LISTADO ----------------------------------
DELIMITER $$

CREATE PROCEDURE spu_listar_KardexAlmProducto()
BEGIN
    SELECT 
        k.idAlmacenProducto AS ID, -- Este es el ID que te falta
        c.nomusuario AS Colaborador,
        p.producto AS Producto,
        k.stockProducto AS 'Stock Actual',
        k.motivomovimiento AS 'Motivo de Movimiento',
        k.cantidad AS Cantidad,
        k.creado AS Creado
    FROM 
        KardexAlmProducto k
    JOIN 
        Productos p ON k.idproducto = p.idproducto
    JOIN 
        colaboradores c ON k.idcolaborador = c.idcolaborador
    ORDER BY 
        k.creado DESC;
END $$
CALL spu_listar_KardexAlmProducto();