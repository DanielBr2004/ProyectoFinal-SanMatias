use granjasanmatias;

CALL spu_personas_registrar ('BULEJE','ROJAS','BRAULIO DANIEL',76363997);

CALL spu_personas_registrar ('','','',12457852147);

CALL spu_colaboradores_registrar(1,'BBuleje','');
UPDATE colaboradores SET passusuario = '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS' WHERE idcolaborador = 1;
CALL spu_colaboradores_login('BBuleje');

CALL spu_existe_producto('');
CALL spu_colaborador_buscar_dni(12314788);

CALL spu_insertar_kardexhuevo(1,1,'E','Venta realizada',200);

CALL spu_cliente_documento_dni(76363996);
select * from KardexAlmHuevo;

SELECT * FROM VENTAS;

select * from  KardexAlmHuevo;
CALL spu_insertar_tipoHuevo('Huevo rojo',5.2,'nuevo tipo');
CALL spu_listar_tipohuevo();

SELECT * FROM numLote WHERE estado = 'A';

insert into numLote(numLote) VALUES(4);


call spu_registrar_numLote(1,7200,null);
select * from tipoHuevo;
select * from colaboradores;

call spu_registrar_controlLote(1,4,925);

INSERT INTO controlLote (idlote, numaves, mortalidad, alimento, alimentoAve, produccion, cantHuevos, create_at)
VALUES (2, 100, 2, 50.00, 0.50, NULL, 500, '2023-10-01');
SELECT *  FROM controlLote;

select * from vista_productos_stock_minimo;
SELECT * FROM Productos;

call spu_listar_produccionLote();

select * from KardexAlmProducto;

CALL SPU_LISTAR_CONTROLLOTE(1);

select * from personas;

select * from productos;

CALL spu_listar_produccionLote(9);


select * from numLote;

SELECT numlote  FROM numLote ORDER BY idlote DESC LIMIT 1;
call spu_listar_ultimo_numLote();
select * from cliente;

CALL spu_registrar_Ventas(2,1,'nose donde');
CALL spu_listar_ventas();

select * from ventas;
select * from detalleventas;

call spu_listar_cliente;

CALL spu_listar_ventas();

SELECT * FROM ventas;
select  * from productos;
UPDATE employees SET first_name = 'John' WHERE employee_id = 3;
DELETE FROM empleados WHERE idEmpleado = 123;

SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = 1 ORDER BY creado DESC LIMIT 1;

CALL spu_clientes_registrar(1,'','DNI','','sunampe','daniel@gmail.com');

CALL spu_totalprecioventa_update(2);

CALL spu_insertar_KardexAlmProducto(1,1,'E','Stock Repuesto',200,'');

CALL spu_insertar_kardexhuevo(1,1,'E','por produccion',150,'dwdwdw');
SELECT stockProducto  FROM KardexAlmProducto WHERE idproducto = 1 ORDER BY creado DESC LIMIT 1;
CALL spu_listar_Colaboradores();
CALL spu_listar_kardexhuevo();
CALL spu_registrar_Ventas(2,1,'nose donde');
CALL spu_registrar_Detalleventas(79,1,220,1500.10,4.8,3000.45);
select * from detalleventas;