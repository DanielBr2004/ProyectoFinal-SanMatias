USE granjasanmatias

-- ------------------------------------------ Procedimiento de Validaciones para el Kardex --------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_insertar_kardexhuevo
(
    IN _idcolaborador INT,
    IN _idhuevo INT,
    IN _tipomovimiento CHAR(1),
    IN _motivomoviento VARCHAR(500),
    IN _cantidad SMALLINT
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
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, creado)
    VALUES (_idcolaborador, _idhuevo, _tipomovimiento, _motivomoviento, _stockProducto, _cantidad, NOW());
END $$