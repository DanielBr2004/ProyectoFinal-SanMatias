USE granjasanmatias

-- ----------------------------------------- Procedimiento Registrar cliente -------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_clientes_registrar
(
	IN _idpersona 		INT,
    IN _telefono 		CHAR(9),
    IN _tipodocumento	CHAR(3),
    IN _razonsocial		VARCHAR(90),
    IN _direccion		VARCHAR(90),
    IN _email			VARCHAR(90)
)
BEGIN 
	INSERT INTO Cliente
		(idpersona, telefono , tipodocumento, razonsocial, direccion, email) VALUES
        (_idpersona, _telefono,_tipodocumento, _razonsocial, _direccion, _email);
	SELECT @@last_insert_id 'idcliente';
END $$

 -- ------------------------------------------- Buscar Colaborador por su DNI ----------------------------------------------------- 
DELIMITER $$
CREATE PROCEDURE spu_cliente_documento_dni(IN _nrodocumento CHAR(12))
BEGIN
	SELECT 
		PER.idpersona,
        CLI.idcliente,
        PER.apepaterno, 
        PER.apematerno,
        PER.nombres,
        CLI.tipodocumento,
        CLI.telefono,
        CLI.razonsocial,
        CLI.direccion
		FROM personas PER 
        LEFT JOIN cliente CLI
        ON CLI.idpersona = PER.idpersona 
        WHERE nrodocumento = _nrodocumento;
END $$

 -- ------------------------------------------- Listar Clientes ----------------------------------------------------- 
 
 DELIMITER $$
CREATE PROCEDURE spu_listar_Colaboradores()
BEGIN
	SELECT 
			*
		FROM cliente ;
END $$