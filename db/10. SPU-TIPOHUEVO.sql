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
 -- ------------------------------------------- listar productos ----------------------------------------------------- 
CREATE PROCEDURE spu_listado_tipoHuevo()
BEGIN
    SELECT * FROM tipoHuevo;
END;

-- ------------------------------------------- editar producto -----------------------------------------------------
CREATE PROCEDURE spu_editar_tipoHuevo(
    IN _idhuevo INT,
    IN _tiposHuevos VARCHAR(50),
    IN _PrecioKg DECIMAL(6,2),
    IN _descripcion VARCHAR(250)
)
BEGIN
    UPDATE tipoHuevo
    SET tiposHuevos = _tiposHuevos,
        PrecioKg = _PrecioKg,
        descripcion = _descripcion
    WHERE idhuevo = _idhuevo;
END;
-- ------------------------------------------- eliminar producto -----------------------------------------------------

CREATE PROCEDURE spu_eliminar_tipoHuevo(
    IN _idhuevo INT
)
BEGIN
    DELETE FROM tipoHuevo
    WHERE idhuevo = _idhuevo;
END;
