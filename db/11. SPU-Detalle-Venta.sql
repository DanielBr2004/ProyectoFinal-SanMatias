USE granjasanmatias;

 -- ------------------------------------------- Registrar Detalleventas ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_Detalleventas`;
DELIMITER $$
CREATE PROCEDURE spu_registrar_Detalleventas
(
	IN _idcolaborador		INT,
    IN _idventa       		INT,
    IN _idhuevo   			INT,
    IN _cantidad			INT,
    IN _pesoTotal			DECIMAL(7,2),
    IN _preciounitario      DECIMAL(6, 2),
    IN _preciototal			DECIMAL(10, 2)
)
BEGIN 
 -- declara variable de stock
	DECLARE _stockProducto DECIMAL(6,2) DEFAULT 0;
    
    -- obtiene el stock del producto elegido
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idhuevo = _idhuevo ORDER BY creado DESC LIMIT 1;
    
    -- realiza descuento al kardex por venta
    SET _stockProducto = _stockProducto - _cantidad;
    
    
     -- Registramos el kardex 
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idhuevo, 'S', 'Salida por Venta', _stockProducto, _cantidad, NULL, NOW());
    
    -- registramos en detalle venta
    INSERT INTO detalleventas(idventa, idhuevo, cantidad, PesoTotal, precioUnitario, precioTotal)
    VALUES(_idventa, _idhuevo, _cantidad, _pesoTotal, _preciounitario, _preciototal);
END $$
DELIMITER ;
