USE granjasanmatias;

CALL spu_personas_registrar ('BULEJE','ROJAS','BRAULIO DANIEL',76363997);
CALL spu_colaboradores_registrar(1,'BBuleje','');
UPDATE colaboradores SET passusuario = '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS' WHERE idcolaborador = 1;

CALL spu_personas_registrar ('ORTIZ','JACOBO','EMERSSON ALEJANDRO',73039705);
CALL spu_colaboradores_registrar(2,'EOrtiz','');
UPDATE colaboradores SET passusuario = '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS' WHERE idcolaborador = 2;

CALL spu_personas_registrar('','','',20506539600);
CALL spu_clientes_registrar(3,'','RUC','INDUSTRIA MULTIPRODUCTOS SOCIEDAD ANONIMA CERRADA','Car. Panamericana Sur Km. 36 Int. 210 Mercado Virgen de las Mer (Dentro del Mercado Virgen de las Mercede)','');