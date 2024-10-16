USE granjasanmatias;

 -- ------------------------------------------- Registrar productos ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_productos`;
DELIMITER $$
CREATE PROCEDURE spu_registrar_productos(
IN _producto VARCHAR(60),
IN _descripcion VARCHAR(60))
BEGIN
	INSERT INTO productos 
		(producto, descripcion) VALUES 
        (_producto, _descripcion);
END $$
 -- ------------------------------------------- Listado productos ----------------------------------------------------- 
 drop procedure if exists `spu_listar_productos`;
DELIMITER $$
CREATE PROCEDURE spu_listar_productos()
BEGIN
    SELECT * FROM productos;
END $$

 -- ------------------------------------------- Editar productos -----------------------------------------------------
 drop procedure if exists `spu_editar_productos`;
 DELIMITER $$
CREATE PROCEDURE spu_editar_productos(
    IN _idproducto INT,
    IN _producto VARCHAR(100),
    IN _descripcion VARCHAR(100)
)
BEGIN
    UPDATE productos
    SET producto = _producto,
        descripcion = _descripcion
    WHERE idproducto = _idproducto;
END $$
 -- ------------------------------------------- Eliminar productos -----------------------------------------------------
 drop procedure if exists `spu_eliminar_productos`;
 DELIMITER $$
CREATE PROCEDURE spu_eliminar_productos(
    IN _idproducto INT
)
BEGIN
    DELETE FROM productos
    WHERE idproducto = _idproducto;
END $$
 -- ------------------------------------------- Validar productos -----------------------------------------------------
 drop procedure if exists `spu_existe_producto`;
  DELIMITER $$
CREATE PROCEDURE spu_existe_producto(IN _producto VARCHAR(90))
BEGIN
    SELECT * FROM Productos WHERE Producto = _producto;
END $$