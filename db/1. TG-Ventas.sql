USE granjasanmatias;


 drop trigger if exists `spu_registrar_controlLote`;

CREATE TRIGGER trg_actualizar_precioVenta
AFTER INSERT ON detalleventas
FOR EACH ROW
BEGIN
    DECLARE _PrecioVenta DECIMAL(10, 2);

    -- Calcular la suma de precioTotal para el idventa correspondiente
    SELECT SUM(precioTotal) INTO _PrecioVenta
    FROM detalleventas
    WHERE idventa = NEW.idventa;

    -- Actualizar la columna PrecioVenta en la tabla ventas
    UPDATE ventas SET PrecioVenta = _PrecioVenta WHERE idventa = NEW.idventa;
END;
