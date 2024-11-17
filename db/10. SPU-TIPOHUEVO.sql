USE granjasanmatias;

 -- ------------------------------------------- Listado productos ----------------------------------------------------- 
 drop procedure if exists `spu_listar_tipohuevo`;

CREATE PROCEDURE spu_listar_tipohuevo()
BEGIN
    SELECT * FROM tipohuevo;
END;
 -- ------------------------------------------- registrar productos ----------------------------------------------------- 

CREATE PROCEDURE spu_insertar_tipoHuevo(
    IN _tiposHuevos VARCHAR(50),
    IN _PrecioKg DECIMAL(6,2),
    IN _descripcion VARCHAR(250)
)
BEGIN
    INSERT INTO tipoHuevo (tiposHuevos, PrecioKg, descripcion)
    VALUES (_tiposHuevos, _PrecioKg, _descripcion);
END;