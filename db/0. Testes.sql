use granjasanmatias;

CALL spu_personas_registrar ('Buleje','Rojas','Daniel',12314788);

CALL spu_personas_registrar ('','','',12457852147);

CALL spu_colaboradores_registrar(1,'DanielBr','');
UPDATE colaboradores SET passusuario = '$2y$10$86IWpKbDSQDGRJjoIt2EYuSZtesF2ShaFnKNzeZWABJnib5wCADKK' WHERE idcolaborador = 1;

CALL spu_colaboradores_login('DanielBr');

CALL spu_colaborador_buscar_dni(12314788);

CALL spu_insertar_kardexhuevo(1,1,'E','Venta realizada',200);

select * from KardexAlmHuevo;

SELECT * FROM VENTAS;

select * from  KardexAlmHuevo;

select * from personas;

select * from cliente;

SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = 1 ORDER BY creado DESC LIMIT 1;

CALL spu_clientes_registrar(3,'','Avicola San Matias S.A.C.','Av la mar S/N');