USE granjasanmatias;

 -- ------------------------------------------- Registrar Detalleventas ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_Detalleventas`;

CREATE PROCEDURE spu_registrar_Detalleventas
(
    IN _idventa       		INT,
    IN _idhuevo   			INT,
    IN _pesototal            DECIMAL(6, 2),
    IN _cantidad			INT,
    IN _unidadMedida		VARCHAR(50),
    IN _precioVenta      DECIMAL(6, 2)
)
BEGIN 
 -- declara variable de stock
	DECLARE _stockProducto DECIMAL(6,2) DEFAULT 0;
    DECLARE _iduser INT;
    DECLARE _canthuevos INT;
    -- obtiene el stock del producto elegido
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idhuevo = _idhuevo ORDER BY creado DESC LIMIT 1;
    
    
    
    -- realiza descuento al kardex por venta
    SET _stockProducto = _stockProducto - _cantidad;
    
    SELECT idcolaborador INTO _iduser
    FROM ventas
	WHERE idventa = _idventa
    LIMIT 1;
    
     -- Registramos el kardex 
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_iduser, _idhuevo, 'S', 'Salida por Venta', _stockProducto, _cantidad, NULL, NOW());
    
    -- registramos en detalle venta
    INSERT INTO detalleventas(idventa, idhuevo, pesoTotal,  cantidad, precioVenta, UnidadMedida)
    VALUES(_idventa, _idhuevo, _pesototal, _cantidad, _precioVenta, _unidadMedida);
    SELECT @@last_insert_id AS iddetalleventa;
END;

-- ------------------------------------------- Listar Detalleventas ----------------------------------------------------- 
DROP PROCEDURE IF EXISTS `spu_listar_Detalleventas`;
CREATE PROCEDURE spu_listar_Detalleventas()
BEGIN
    -- Consulta para obtener todos los detalles de ventas registrados junto con el nombre del tipo de huevo
    SELECT 
        d.iddetalleventa,
        d.idventa,
        d.pesoTotal,
        t.tiposHuevos AS nombreHuevo,  -- Traemos el nombre del tipo de huevo
        d.cantidad,
        d.precioVenta,
        d.UnidadMedida
    FROM 
        detalleventas d
    INNER JOIN 
        tipoHuevo t ON d.idhuevo = t.idhuevo;  -- Realizamos el JOIN para obtener el tipo de huevo
END;

-- elimianr -------------------------------------------------------------------------------


DROP PROCEDURE IF EXISTS `spu_eliminar_Detalleventas`;
CREATE PROCEDURE spu_eliminar_Detalleventas(
    IN _iddetalleventa INT
)
BEGIN
    -- Declarar variables para almacenar los datos de la venta a eliminar
    DECLARE _idventa INT;
    DECLARE _idhuevo INT;
    DECLARE _cantidad INT;
    DECLARE _stockProducto DECIMAL(6, 2);
    DECLARE _iduser INT;

    -- Obtener los datos del detalle de venta antes de eliminar
    SELECT 
        d.idventa, 
        d.idhuevo, 
        d.cantidad 
    INTO 
        _idventa, 
        _idhuevo, 
        _cantidad
    FROM 
        detalleventas d
    WHERE 
        d.iddetalleventa = _iddetalleventa;

    -- Obtener el stock actual del producto
    SELECT 
        stockProducto 
    INTO 
        _stockProducto
    FROM 
        KardexAlmHuevo 
    WHERE 
        idhuevo = _idhuevo 
    ORDER BY 
        creado DESC 
    LIMIT 1;

    -- Obtener el colaborador relacionado con la venta
    SELECT 
        idcolaborador 
    INTO 
        _iduser
    FROM 
        ventas 
    WHERE 
        idventa = _idventa;

    -- Actualizar el stock sumando la cantidad eliminada
    SET _stockProducto = _stockProducto + _cantidad;

    -- Registrar el movimiento de entrada en el Kardex
    INSERT INTO KardexAlmHuevo (
        idcolaborador, 
        idhuevo, 
        tipomovimiento, 
        motivomovimiento, 
        stockProducto, 
        cantidad, 
        descripcion, 
        creado
    )
    VALUES (
        _iduser, 
        _idhuevo, 
        'E',  -- Movimiento de Entrada
        'Entrada por eliminación de detalle de venta', 
        _stockProducto, 
        _cantidad, 
        NULL, 
        NOW()
    );

    -- Eliminar el detalle de venta
    DELETE FROM detalleventas 
    WHERE 
        iddetalleventa = _iddetalleventa;
END;