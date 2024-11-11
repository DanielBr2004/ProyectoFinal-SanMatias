USE granjasanmatias;

 -- ------------------------------------------- Registrar productos ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_productos`;

CREATE PROCEDURE spu_registrar_productos(
IN _producto VARCHAR(60),
IN _stockminimo INT,
IN _descripcion VARCHAR(60))
BEGIN
	INSERT INTO productos 
		(producto,stockminimo , descripcion) VALUES 
        (_producto,_stockminimo, _descripcion);
END;
 -- ------------------------------------------- Listado productos ----------------------------------------------------- 
 drop procedure if exists `spu_listar_productos`;

CREATE PROCEDURE spu_listar_productos()
BEGIN
    SELECT * FROM productos;
END;
 -- ------------------------------------------- Editar productos -----------------------------------------------------
 drop procedure if exists `spu_editar_productos`;

CREATE PROCEDURE spu_editar_productos(
    IN _idproducto INT,
    IN _producto VARCHAR(60),
    IN _stockminimo INT,
    IN _descripcion VARCHAR(60)
)
BEGIN
    UPDATE Productos
    SET 
        producto = _producto,
        stockminimo = _stockminimo,
        descripcion = _descripcion
    WHERE idproducto = _idproducto;
END;
 -- ------------------------------------------- Eliminar productos -----------------------------------------------------
 drop procedure if exists `spu_eliminar_productos`;
CREATE PROCEDURE spu_eliminar_productos(
    IN _idproducto INT
)
BEGIN
    DELETE FROM productos
    WHERE idproducto = _idproducto;
END;
 -- ------------------------------------------- Validar productos -----------------------------------------------------
 drop procedure if exists `spu_existe_producto`;

CREATE PROCEDURE spu_existe_producto(IN _producto VARCHAR(90))
BEGIN
    SELECT * FROM Productos WHERE Producto = _producto;
END;

CREATE VIEW vista_productos_stock_minimo AS
SELECT 
    p.producto,
    k.stockProducto
FROM 
    Productos p
JOIN 
    KardexAlmProducto k ON p.idproducto = k.idproducto
WHERE 
    k.creado = (
        SELECT MAX(k2.creado)
        FROM KardexAlmProducto k2
        WHERE k2.idproducto = p.idproducto
    )
    AND k.stockProducto <= p.stockminimo;