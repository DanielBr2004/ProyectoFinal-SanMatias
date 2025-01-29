USE granjasanmatias;

CALL spu_insertar_tipoHuevo('comercial', 1.50, 'Huevo comercial estándar');
CALL spu_insertar_tipoHuevo('pardo', 1.75, 'Huevo de color pardo');
CALL spu_insertar_tipoHuevo('sucio', 1.20, 'Huevo con suciedad');
CALL spu_insertar_tipoHuevo('doble yema', 2.00, 'Huevo con doble yema');
CALL spu_insertar_tipoHuevo('margarito', 1.80, 'Huevo tipo margarito');
CALL spu_insertar_tipoHuevo('merma', 0.90, 'Huevo de merma');

call spu_listado_tipohuevo();

