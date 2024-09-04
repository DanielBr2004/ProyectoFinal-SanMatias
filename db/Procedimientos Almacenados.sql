USE granjasanmatias
-- ------------------------------------------------------------- LOGIN ------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_colaboradores_login(IN _nomusuario VARCHAR(150))
BEGIN 
	SELECT 
		COL.idcolaborador,
        PER.apepaterno, 
        PER.apematerno,
        PER.nombres,
        COL.nomusuario, COL.passusuario
		FROM colaboradores COL 
        INNER JOIN personas PER ON PER.idpersona = COL.idpersona
        WHERE COL.nomusuario = _nomusuario AND COL.inactive_at IS NULL; 
END $$
CALL spu_colaboradores_login('DanielBr');
-- ------------------------------------------------------- Procedimiento Registrar Persona -------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_personas_registrar
(
	IN _apepaterno		VARCHAR(60),
    IN _apematerno		VARCHAR(60),
    IN _nombres			VARCHAR(40),
    IN _nrodocumento	CHAR(8)
) 
BEGIN
	INSERT INTO personas 
		(apepaterno, apematerno, nombres, nrodocumento) VALUES 
        (_apepaterno, _apematerno, _nombres, _nrodocumento);
	SELECT @@last_insert_id 'idpersona';
END $$
CALL spu_personas_registrar ('Buleje','Rojas','Daniel',12314788);


-- ----------------------------------------- Procedimiento Registrar Colaborador -------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_colaboradores_registrar
(
	IN _idpersona 		INT,
    IN _nomusuario 		VARCHAR(150),
    IN _passusuario		VARCHAR(60)
)
BEGIN 
	INSERT INTO colaboradores 
		(idpersona, nomusuario, passusuario) VALUES
        (_idpersona, _nomusuario, _passusuario);
	SELECT @@last_insert_id 'idcolaborador';
END $$
CALL spu_colaboradores_registrar(1,'DanielBr','');
UPDATE colaboradores SET passusuario = '$2y$10$86IWpKbDSQDGRJjoIt2EYuSZtesF2ShaFnKNzeZWABJnib5wCADKK' WHERE idcolaborador = 1;
SELECT * FROM COLABORADORES

 -- ------------------------------------------- Buscar Colaborador por su DNI ----------------------------------------------------- 
DELIMITER $$
CREATE PROCEDURE spu_colaborador_buscar_dni(IN _nrodocumento CHAR(8))
BEGIN
	SELECT 
		PER.idpersona,
        COL.idcolaborador,
        PER.apepaterno, 
        PER.apematerno,
        PER.nombres
		FROM personas PER 
        LEFT JOIN colaboradores COL
        ON COL.idpersona = PER.idpersona 
        WHERE nrodocumento = _nrodocumento;
END $$
CALL spu_colaborador_buscar_dni(12314788);
