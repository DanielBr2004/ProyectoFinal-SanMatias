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
 -- ------------------------------------------- Registrar productos ----------------------------------------------------- 
DELIMITER $$
CREATE PROCEDURE spu_registrar_productos(
IN _producto VARCHAR(60),
IN _descripcion VARCHAR(60))
BEGIN
	INSERT INTO productos 
		(producto, descripcion) VALUES 
        (_producto, _descripcion);
END $$
-- ------------------------------------------ Procedimiento de Validaciones para el Kardex --------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_insertar_kardexhuevo
(
    IN _idcolaborador INT,
    IN _idhuevo INT,
    IN _tipomovimiento CHAR(1),
    IN _motivomoviento VARCHAR(500),
    IN _cantidad SMALLINT
)
BEGIN
	-- Stock Actual declarada por defecto en 0
    DECLARE _stockProducto INT DEFAULT 0;

    -- Se obtendrá el stock actual dependiendo que producto se seleccione 
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idhuevo = _idhuevo ORDER BY creado DESC LIMIT 1;

    -- Se realiza una condicion dependiendo del tipo movimiento E(entrada) S(salida) 
    IF _tipomovimiento = 'E' THEN
        SET _stockProducto = _stockProducto + _cantidad;
    ELSEIF _tipomovimiento = 'S' THEN
        SET _stockProducto = _stockProducto - _cantidad;
    END IF;

    -- Registramos el kardex 
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, creado)
    VALUES (_idcolaborador, _idhuevo, _tipomovimiento, _motivomoviento, _stockProducto, _cantidad, NOW());
END $$

-- ------------------------------------------ Procedimiento de ubigeo --------------------------------------------------
DELIMITER //

CREATE PROCEDURE sp_listar_distritos_por_nombre(
    IN p_nombre_distrito VARCHAR(255)
)
BEGIN
    SELECT 
        d.iddistrito,
        d.distrito,
        p.provincia,
        dep.departamento
    FROM 
        Distritos d
    JOIN 
        Provincias p ON d.idprovincia = p.idprovincia
    JOIN 
        Departamentos dep ON p.iddepartamento = dep.iddepartamento
    WHERE 
        d.distrito LIKE CONCAT('%', p_nombre_distrito, '%');
END //

DELIMITER ;

CALL sp_listar_distritos_por_nombre('pueblo')

