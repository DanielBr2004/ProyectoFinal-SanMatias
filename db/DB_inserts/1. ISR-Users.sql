USE granjasanmatias;

CALL spu_personas_registrar ('BULEJE','ROJAS','BRAULIO DANIEL',76363997);
CALL spu_colaboradores_registrar(1,'BBuleje','');
UPDATE colaboradores SET passusuario = '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS' WHERE idcolaborador = 1;

CALL spu_personas_registrar ('ORTIZ','JACOBO','EMERSSON ALEJANDRO',73039705);
CALL spu_colaboradores_registrar(2,'EOrtiz','');
UPDATE colaboradores SET passusuario = '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS' WHERE idcolaborador = 2;