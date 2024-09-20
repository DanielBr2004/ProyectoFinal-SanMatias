use granjasanmatias;

CALL spu_personas_registrar ('Buleje','Rojas','Daniel',12314788);

CALL spu_colaboradores_registrar(1,'DanielBr','');
UPDATE colaboradores SET passusuario = '$2y$10$86IWpKbDSQDGRJjoIt2EYuSZtesF2ShaFnKNzeZWABJnib5wCADKK' WHERE idcolaborador = 1;

CALL spu_colaboradores_login('DanielBr');

CALL spu_colaborador_buscar_dni(12314788);

CALL spu_insertar_kardexhuevo(1,1,'E','Venta realizada',200);

select * from KardexAlmHuevo;

<<<<<<< HEAD
=======
SELECT * FROM VENTAS;

>>>>>>> DevSENATI
select * from  KardexAlmHuevo;

SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = 1 ORDER BY creado DESC LIMIT 1