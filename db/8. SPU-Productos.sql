USE granjasanmatias

 -- ------------------------------------------- Registrar productos ----------------------------------------------------- 
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
DELIMITER $$
CREATE PROCEDURE spu_listar_productos()
BEGIN
    SELECT * FROM productos;
END $$
CALL spu_listar_productos();
 -- ------------------------------------------- Editar productos -----------------------------------------------------
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
CALL spu_editar_productos(1, 'Soyas', '	Granos de soya ricos en proteínas para la alimentacion de los animales');
 -- ------------------------------------------- Eliminar productos -----------------------------------------------------
 DELIMITER $$
CREATE PROCEDURE spu_eliminar_productos(
    IN _idproducto INT
)
BEGIN
    DELETE FROM productos
    WHERE idproducto = _idproducto;
END $$
CALL spu_eliminar_productos(5);