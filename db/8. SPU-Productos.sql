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
