USE granjasanmatias;

-- ----------------------------------------- Procedimiento Registrar cliente -------------------------------------------
drop procedure if exists `spu_clientes_registrar`;
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
 drop procedure if exists `spu_cliente_documento_dni`;
DELIMITER $$
CREATE PROCEDURE spu_cliente_documento_dni(IN _nrodocumento CHAR(12))
BEGIN
	SELECT 
		PER.nrodocumento,
		PER.idpersona,
        CLI.idcliente,
        CASE
        WHEN CLI.tipodocumento ="RUC" THEN CLI.razonsocial
        WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PER.nombres,' ',PER.apematerno, ' ',PER.apepaterno)
		END AS clientes,
        CLI.tipodocumento,
        CLI.telefono,
        CLI.direccion,
        CLI.email
		FROM cliente CLI 
        LEFT JOIN personas PER
        ON PER.idpersona = CLI.idpersona 
        WHERE nrodocumento = _nrodocumento;
END $$

 -- ------------------------------------------- Listar Clientes ----------------------------------------------------- 
 drop procedure if exists `spu_listar_cliente`;
 DELIMITER $$
CREATE PROCEDURE spu_listar_cliente()
BEGIN
	SELECT 
		CLI.idcliente,
		PER.nrodocumento,
        CLI.tipodocumento,
        CASE
        WHEN CLI.tipodocumento ="RUC" THEN CLI.razonsocial
        WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PER.nombres,' ',PER.apematerno, ' ',PER.apepaterno)
		END AS clientes
		FROM cliente CLI
        INNER JOIN personas PER
        ON PER.idpersona = CLI.idpersona ORDER BY idcliente DESC;
END $$
call  spu_listar_cliente();
