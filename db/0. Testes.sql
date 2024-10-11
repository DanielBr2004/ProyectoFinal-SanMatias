use granjasanmatias;

CALL spu_personas_registrar ('Buleje','Rojas','Daniel',76363997);

CALL spu_personas_registrar ('','','',12457852147);

CALL spu_colaboradores_registrar(1,'BBuleje','');
UPDATE colaboradores SET passusuario = '$2y$10$86IWpKbDSQDGRJjoIt2EYuSZtesF2ShaFnKNzeZWABJnib5wCADKK' WHERE idcolaborador = 1;

CALL spu_colaboradores_login('BBuleje');

CALL spu_colaborador_buscar_dni(12314788);

CALL spu_insertar_kardexhuevo(1,1,'E','Venta realizada',200);

select * from KardexAlmHuevo;

SELECT * FROM VENTAS;

select * from  KardexAlmHuevo;

select * from tipoHuevo;

select * from colaboradores;

select * from KardexAlmProducto;

select * from personas;

select * from cliente;

SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = 1 ORDER BY creado DESC LIMIT 1;

CALL spu_clientes_registrar(3,'','Avicola San Matias S.A.C.','Av la mar S/N');

CALL spu_insertar_KardexAlmProducto(1,1,'E','Stock Repuesto',200,'');

CALL spu_insertar_kardexhuevo(1,1,'E','por produccion',150,'dwdwdw');
SELECT stockProducto  FROM KardexAlmProducto WHERE idproducto = 1 ORDER BY creado DESC LIMIT 1;

CALL spu_vista_kardexhuevo();