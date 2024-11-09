USE granjasanmatias;

-- ------------------------------------------------------- Procedimiento Registrar Persona -------------------------------------------

CREATE PROCEDURE spu_personas_registrar
(
	IN _apepaterno		VARCHAR(60),
    IN _apematerno		VARCHAR(60),
    IN _nombres			VARCHAR(40),
    IN _nrodocumento	CHAR(12)
) 
BEGIN
	INSERT INTO personas 
		(apepaterno, apematerno, nombres, nrodocumento) VALUES 
        (_apepaterno, _apematerno, _nombres, _nrodocumento);
	SELECT @@last_insert_id 'idpersona';
END;


