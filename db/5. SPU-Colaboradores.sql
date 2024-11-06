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

 -- ------------------------------------------- Listar colaboradores ----------------------------------------------------- 
 /*
 DELIMITER $$
CREATE PROCEDURE spu_listar_Colaboradores()
BEGIN
	SELECT 
		PER.nrodocumento,
        PER.apepaterno,
        PER.apematerno,
        PER.nombres,
		COL.nomusuario
		FROM colaboradores COL 
        LEFT JOIN personas PER
        ON PER.idpersona = COL.idpersona 
        ORDER BY idcolaborador DESC ;
END $$
call spu_listar_Colaboradores();
*/
DELIMITER $$
CREATE PROCEDURE spu_listar_Colaboradores()
BEGIN
	SELECT 
		COL.idcolaborador,
		PER.nrodocumento,
        PER.apepaterno,
        PER.apematerno,
        PER.nombres,
		COL.nomusuario
	FROM colaboradores COL 
    LEFT JOIN personas PER ON PER.idpersona = COL.idpersona 
    ORDER BY COL.idcolaborador DESC;
END $$
call spu_listar_Colaboradores();
 -- ------------------------------------------- Editar colaboradores ----------------------------------------------------- 
 DELIMITER $$
CREATE PROCEDURE spu_editar_colaborador
(
    IN _idcolaborador INT,
    IN _apepaterno VARCHAR(100),
    IN _apematerno VARCHAR(100),
    IN _nombres VARCHAR(100)
)
BEGIN
    UPDATE personas PER
    INNER JOIN colaboradores COL ON COL.idpersona = PER.idpersona
    SET 
        PER.apepaterno = _apepaterno,
        PER.apematerno = _apematerno,
        PER.nombres = _nombres
    WHERE COL.idcolaborador = _idcolaborador;
END $$
CALL spu_editar_colaborador(3, 'OLO', 'ROJAS', 'STIVEN');

-- ------------------------------- ELIMINAR ----------------------------------

