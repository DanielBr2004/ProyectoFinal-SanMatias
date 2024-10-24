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

select * from tipoHuevo;

select * from colaboradores;

select * from KardexAlmProducto;

select * from personas;

select * from cliente;

call spu_listar_cliente;

select  * from productos;

SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = 1 ORDER BY creado DESC LIMIT 1;

CALL spu_clientes_registrar(1,'','DNI','','sunampe','daniel@gmail.com');

CALL spu_insertar_KardexAlmProducto(1,1,'E','Stock Repuesto',200,'');

CALL spu_insertar_kardexhuevo(1,1,'E','por produccion',150,'dwdwdw');
SELECT stockProducto  FROM KardexAlmProducto WHERE idproducto = 1 ORDER BY creado DESC LIMIT 1;
CALL spu_listar_Colaboradores();
CALL spu_vista_kardexhuevo();