USE granjasanmatias

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
