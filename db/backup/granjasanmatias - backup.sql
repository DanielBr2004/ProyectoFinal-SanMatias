-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2024 a las 17:15:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `granjasanmatias`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevolote1` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            1,
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2017-03-01', INTERVAL FLOOR(RAND() * 471) DAY) -- Genera una fecha aleatoria entre 2017-03-01 y 2018-06-15
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevolote2` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            2, -- idlote establecido en 2
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2018-06-15', INTERVAL FLOOR(RAND() * 452) DAY) -- Genera una fecha aleatoria entre 2018-06-15 y 2019-09-10
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote4` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            4, -- idlote establecido en 4
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2020-12-25', INTERVAL FLOOR(RAND() * 55) DAY) -- Genera una fecha aleatoria entre 2020-12-25 y 2021-02-18
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote5` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            5, -- idlote establecido en 5
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2021-02-18', INTERVAL FLOOR(RAND() * 447) DAY) -- Genera una fecha aleatoria entre 2021-02-18 y 2022-05-11
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote6` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            6, -- idlote establecido en 6
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2022-05-11', INTERVAL FLOOR(RAND() * 435) DAY) -- Genera una fecha aleatoria entre 2022-05-11 y 2023-07-20
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote7` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            7, -- idlote establecido en 7
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2023-07-20', INTERVAL FLOOR(RAND() * 107) DAY) -- Genera una fecha aleatoria entre 2023-07-20 y 2023-11-04
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote8` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            8, -- idlote establecido en 8
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2023-11-04', INTERVAL FLOOR(RAND() * 79) DAY) -- Genera una fecha aleatoria entre 2023-11-04 y 2024-01-22
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoLote9` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            9, -- idlote establecido en 9
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2024-01-22', INTERVAL FLOOR(RAND() * 159) DAY) -- Genera una fecha aleatoria entre 2024-01-22 y 2024-06-30
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateKardexAlmHuevoUpdatedLote3` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Movimiento de prueba ', i),
            3, -- idlote establecido en 3
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Movimiento de prueba',
            DATE_ADD('2019-09-10', INTERVAL FLOOR(RAND() * 472) DAY) -- Genera una fecha aleatoria entre 2019-09-10 y 2020-12-25
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_activar_numLote` (IN `_idlote` INT)   BEGIN
    UPDATE numLote 
    SET estado = 'A'
    WHERE idlote = _idlote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_clientes_registrar` (IN `_idpersona` INT, IN `_telefono` CHAR(9), IN `_tipodocumento` CHAR(3), IN `_razonsocial` VARCHAR(90), IN `_direccion` VARCHAR(90), IN `_email` VARCHAR(90))   BEGIN 
	INSERT INTO Cliente
		(idpersona, telefono , tipodocumento, razonsocial, direccion, email) VALUES
        (_idpersona, _telefono,_tipodocumento, _razonsocial, _direccion, _email);
	SELECT @@last_insert_id 'idcliente';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cliente_documento_dni` (IN `_nrodocumento` CHAR(12))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cliente_editar` (IN `_idcliente` INT, IN `_nrodocumento` CHAR(12), IN `_tipodocumento` CHAR(3), IN `_cliente_nombre` VARCHAR(90))   BEGIN
    DECLARE _idpersona INT;

    -- Obtener el idpersona asociado con el idcliente proporcionado
    SELECT idpersona INTO _idpersona
    FROM cliente
    WHERE idcliente = _idcliente;

    -- Actualizar el campo `tipodocumento` en la tabla `cliente`
    UPDATE cliente
    SET 
        tipodocumento = _tipodocumento
    WHERE idcliente = _idcliente;

    -- Actualizar el campo `nrodocumento` en la tabla `personas`
    UPDATE personas
    SET 
        nrodocumento = _nrodocumento
    WHERE idpersona = _idpersona;

    -- Actualizar el nombre o razón social en función del `tipodocumento`
    IF _tipodocumento = 'DNI' THEN
        -- Si es DNI, actualizar el nombre completo en la tabla `personas`
        UPDATE personas
        SET 
            nombres = _cliente_nombre,
            apepaterno = '',   -- Aquí puedes agregar lógica si tienes el apellido paterno
            apematerno = ''    -- Aquí puedes agregar lógica si tienes el apellido materno
        WHERE idpersona = _idpersona;
    ELSEIF _tipodocumento = 'RUC' THEN
        -- Si es RUC, actualizar la razón social en la tabla `cliente`
        UPDATE cliente
        SET 
            razonsocial = _cliente_nombre
        WHERE idcliente = _idcliente;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cliente_eliminar` (IN `_idcliente` INT)   BEGIN
    -- Eliminar el cliente de la tabla `cliente`
    DELETE FROM cliente
    WHERE idcliente = _idcliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_colaboradores_login` (IN `_nomusuario` VARCHAR(150))   BEGIN 
	SELECT 
		COL.idcolaborador,
        PER.apepaterno, 
        PER.apematerno,
        PER.nombres,
        COL.nomusuario, COL.passusuario
		FROM colaboradores COL 
        INNER JOIN personas PER ON PER.idpersona = COL.idpersona
        WHERE COL.nomusuario = _nomusuario AND COL.inactive_at IS NULL; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_colaboradores_registrar` (IN `_idpersona` INT, IN `_nomusuario` VARCHAR(150), IN `_passusuario` VARCHAR(60))   BEGIN 
	INSERT INTO colaboradores 
		(idpersona, nomusuario, passusuario) VALUES
        (_idpersona, _nomusuario, _passusuario);
	SELECT @@last_insert_id 'idcolaborador';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_colaborador_buscar_dni` (IN `_nrodocumento` CHAR(8))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_desactivar_numLote` (IN `_idlote` INT)   BEGIN
    UPDATE numLote 
    SET estado = 'I'
    WHERE idlote = _idlote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_colaborador` (IN `_idcolaborador` INT, IN `_apepaterno` VARCHAR(100), IN `_apematerno` VARCHAR(100), IN `_nombres` VARCHAR(100))   BEGIN
    UPDATE personas PER
    INNER JOIN colaboradores COL ON COL.idpersona = PER.idpersona
    SET 
        PER.apepaterno = _apepaterno,
        PER.apematerno = _apematerno,
        PER.nombres = _nombres
    WHERE COL.idcolaborador = _idcolaborador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_KardexAlmProducto` (IN `_idAlmacenProducto` INT, IN `_nuevoMotivoMovimiento` VARCHAR(100), IN `_nuevaCantidad` SMALLINT)   BEGIN
    DECLARE _idProducto INT;
    DECLARE _stockProductoActual INT DEFAULT 0;
    DECLARE _stockNuevo INT DEFAULT 0;
    
    SELECT idproducto, stockProducto INTO _idProducto, _stockProductoActual 
    FROM KardexAlmProducto
    WHERE idAlmacenProducto = _idAlmacenProducto;

    IF _nuevoMotivoMovimiento = 'Entrada por compra' THEN
        SET _stockNuevo = _stockProductoActual + _nuevaCantidad; 
    ELSEIF _nuevoMotivoMovimiento = 'Salida por uso' THEN
        SET _stockNuevo = _stockProductoActual - _nuevaCantidad;  
    ELSEIF _nuevoMotivoMovimiento = 'Salida por merma' THEN
        SET _stockNuevo = _stockProductoActual - _nuevaCantidad;  
    END IF;
    
    UPDATE KardexAlmProducto 
    SET 
        motivomovimiento = NULLIF(_nuevoMotivoMovimiento, ''),  
        cantidad = _nuevaCantidad,                             
        stockProducto = _stockNuevo,                           
        creado = NOW()                                         
    WHERE 
        idAlmacenProducto = _idAlmacenProducto;                
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_kardexhuevo` (IN `_idAlmacenHuevos` INT, IN `_motivomovimiento` VARCHAR(500), IN `_cantidad` SMALLINT, IN `_descripcion` VARCHAR(100), IN `_idlote` INT)   BEGIN
    -- Declaración de variables
    DECLARE _stockProducto INT;

    -- Mostrar los valores de entrada para depuración
    SELECT _idAlmacenHuevos, _motivomovimiento, _cantidad, _descripcion, _idlote;

    -- Obtener el stock actual antes de la actualización
    SELECT stockProducto INTO _stockProducto 
    FROM KardexAlmHuevo 
    WHERE idAlmacenHuevos = _idAlmacenHuevos;

    -- Ajustar el stock según el tipo de movimiento
    IF _motivomovimiento LIKE 'Salida%' THEN
        SET _stockProducto = _stockProducto - _cantidad;
    ELSEIF _motivomovimiento LIKE 'Entrada%' THEN
        SET _stockProducto = _stockProducto + _cantidad;
    END IF;

    -- Actualizar el registro
    UPDATE KardexAlmHuevo
    SET 
        motivomovimiento = _motivomovimiento,
        cantidad = _cantidad,
        descripcion = NULLIF(_descripcion, ''),
        idlote = _idlote,
        stockProducto = _stockProducto
    WHERE idAlmacenHuevos = _idAlmacenHuevos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_productos` (IN `_idproducto` INT, IN `_producto` VARCHAR(60), IN `_stockminimo` INT, IN `_descripcion` VARCHAR(60))   BEGIN
    UPDATE Productos
    SET 
        producto = _producto,
        stockminimo = _stockminimo,
        descripcion = _descripcion
    WHERE idproducto = _idproducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_colaborador` (IN `_idcolaborador` INT)   BEGIN
    -- Elimina al colaborador de la tabla colaboradores basado en el ID proporcionado
    DELETE FROM colaboradores WHERE idcolaborador = _idcolaborador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_KardexAlmProducto` (IN `_idAlmacenProducto` INT)   BEGIN
    -- Elimina el registro de la tabla KardexAlmProducto basado en el ID proporcionado
    DELETE FROM KardexAlmProducto WHERE idAlmacenProducto = _idAlmacenProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_kardexhuevo` (IN `_idAlmacenHuevos` INT)   BEGIN
    -- Elimina el registro de la tabla KardexAlmHuevo basado en el ID proporcionado
    DELETE FROM KardexAlmHuevo WHERE idAlmacenHuevos = _idAlmacenHuevos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_productos` (IN `_idproducto` INT)   BEGIN
    DELETE FROM productos
    WHERE idproducto = _idproducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_existe_lote` (IN `_numlote` VARCHAR(90))   BEGIN
    SELECT * FROM numLote WHERE numLote = _numlote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_existe_producto` (IN `_producto` VARCHAR(90))   BEGIN
    SELECT * FROM Productos WHERE Producto = _producto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_insertar_KardexAlmProducto` (IN `_idcolaborador` INT, IN `_idproducto` INT, IN `_tipomovimiento` CHAR(1), IN `_motivomoviento` VARCHAR(100), IN `_cantidad` DECIMAL(6,2), IN `_descripcion` VARCHAR(100))   BEGIN
	-- Stock Actual declarada por defecto en 0
    DECLARE _stockProducto DECIMAL(6,2) DEFAULT 0;

    -- Se obtendrá el stock actual dependiendo que producto se seleccione 
    SELECT stockProducto INTO _stockProducto FROM KardexAlmProducto WHERE idproducto = _idproducto ORDER BY creado DESC LIMIT 1;

    -- Se realiza una condicion dependiendo del tipo movimiento E(entrada) S(salida) 
    IF _tipomovimiento = 'E' THEN
        SET _stockProducto = _stockProducto + _cantidad;
    ELSEIF _tipomovimiento = 'S' THEN
        SET _stockProducto = _stockProducto - _cantidad;
    END IF;

    -- Registramos el kardex 
    INSERT INTO KardexAlmProducto (idcolaborador, idproducto, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idproducto, _tipomovimiento, _motivomoviento, _stockProducto, _cantidad, NULLIF(_descripcion, ''), NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_insertar_kardexhuevo` (IN `_idcolaborador` INT, IN `_idhuevo` INT, IN `_tipomovimiento` CHAR(1), IN `_motivomoviento` VARCHAR(500), IN `_idlote` INT, IN `_cantidad` SMALLINT, IN `_descripcion` VARCHAR(100))   BEGIN
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
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento,idlote, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idhuevo, _tipomovimiento, _motivomoviento,_idlote, _stockProducto, _cantidad, NULLIF(_descripcion,''), NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_cliente` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_Colaboradores` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTAR_CONTROLLOTE` (IN `_idlote` INT)   BEGIN
    SELECT
        create_at,
        idlote,
        numaves,
        mortalidad,
        alimento,
        alimentoAve,
        CONCAT(ROUND((cantHuevos / numaves) * 100, 2), '%') AS produccion,
        cantHuevos
    FROM controlLote
    WHERE idlote = _idlote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_KardexAlmProducto` ()   BEGIN
    SELECT 
        k.idAlmacenProducto AS ID, -- Este es el ID que te falta
        c.nomusuario AS Colaborador,
        p.producto AS Producto,
        k.stockProducto AS 'Stock Actual',
        k.motivomovimiento AS 'Motivo de Movimiento',
        k.cantidad AS Cantidad,
        k.creado AS Creado
    FROM 
        KardexAlmProducto k
    JOIN 
        Productos p ON k.idproducto = p.idproducto
    JOIN 
        colaboradores c ON k.idcolaborador = c.idcolaborador
    ORDER BY 
        k.creado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_kardexhuevo` ()   BEGIN
    SELECT 
        kh.idAlmacenHuevos,
        c.nomusuario AS nombre_colaborador,
        th.tiposHuevos AS tipo_huevo,
        kh.motivomovimiento,
        kh.stockProducto,
        kh.cantidad,
        kh.descripcion,
        nl.numLote AS num_lote  -- Traemos el campo numLote de la tabla numLote
    FROM KardexAlmHuevo kh
    JOIN colaboradores c ON kh.idcolaborador = c.idcolaborador
    JOIN tipoHuevo th ON kh.idhuevo = th.idhuevo
    LEFT JOIN numLote nl ON kh.idlote = nl.idlote  -- Join con numLote para obtener el número de lote
    ORDER BY kh.creado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_numLote` ()   BEGIN
    SELECT 
        idlote,
        numLote,
        CantInicio,
        edadAve,
        estado,
        CASE estado
            WHEN 'A' THEN '✅'  -- Check verde
            WHEN 'I' THEN '➖'  -- Menos gris
            ELSE '❔'          -- Opcional: símbolo para estados desconocidos
        END AS estado_icono,
        descripcion,
        create_at
    FROM 
        numLote;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_produccionLote` (IN `_numLote` INT)   BEGIN
    SELECT * FROM (
        SELECT 
            cl.idlote,
            DATE(cl.create_at) AS fecha,
            CONCAT(ROUND((cl.cantHuevos / cl.numaves) * 100, 2)) AS produccion
        FROM 
            controlLote cl
        JOIN 
            numLote nl ON cl.idlote = nl.idlote
        WHERE 
            nl.numLote = _numLote
            AND nl.estado = 'A' -- Filtrar solo los lotes activos
        ORDER BY 
            cl.create_at DESC
        LIMIT 30
    ) AS subquery
    ORDER BY 
        fecha ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_productos` ()   BEGIN
    SELECT * FROM productos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_tipohuevo` ()   BEGIN
    SELECT * FROM tipohuevo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_ultimo_numLote` ()   BEGIN
    SELECT 
        numLote
    FROM numLote
    ORDER BY create_at DESC
    LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_ventas` ()   BEGIN
	SELECT 
		VEN.idventa,
        CASE
			WHEN CLI.tipodocumento ="RUC" THEN CLI.razonsocial
			WHEN CLI.tipodocumento = "DNI" THEN CONCAT(PERCLI.nombres,' ',PERCLI.apematerno, ' ',PERCLI.apepaterno)
		END AS clientes,
        CONCAT(PERCOL.nombres, ' ',PERCOL.apepaterno, ' ',PERCOL.apematerno) AS Colaborador,
		VEN.fecha,
        VEN.direccion,
        VEN.estado
	FROM ventas VEN
	JOIN cliente CLI ON VEN.idcliente = CLI.idcliente
	JOIN personas PERCLI ON CLI.idpersona = PERCLI.idpersona
	JOIN colaboradores COL ON VEN.idcolaborador = COL.idcolaborador
	JOIN personas PERCOL ON COL.idpersona = PERCOL.idpersona
    ORDER BY VEN.idventa DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_registrar` (IN `_apepaterno` VARCHAR(60), IN `_apematerno` VARCHAR(60), IN `_nombres` VARCHAR(40), IN `_nrodocumento` CHAR(12))   BEGIN
	INSERT INTO personas 
		(apepaterno, apematerno, nombres, nrodocumento) VALUES 
        (_apepaterno, _apematerno, _nombres, _nrodocumento);
	SELECT @@last_insert_id 'idpersona';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_controlLote` (IN `_idlote` INT, IN `_mortalidad` INT, IN `_Alimento` DECIMAL(6,2))   BEGIN
    DECLARE _AvesInicio INT;
    DECLARE _numaves INT;
    DECLARE _avesActuales INT;
    DECLARE _alimentoAve DECIMAL(6,2);

    -- Inicializar _AvesInicio desde la tabla numLote
    SELECT CantInicio INTO _AvesInicio FROM numLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;

    -- Inicializar _numaves con _AvesInicio
    SET _numaves = _AvesInicio;

    -- Actualizar _numaves con el último registro de la tabla controlLote si existe
    SELECT numaves INTO _numaves FROM controlLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;

    -- Calcular el número actual de aves y el alimento por ave
    SET _avesActuales = _numaves - _mortalidad;
    SET _alimentoAve = (_Alimento * 1000) / _numaves;

    -- Insertar el nuevo registro en la tabla controlLote
    INSERT INTO controlLote(idlote, numaves, mortalidad, alimento, alimentoAve, produccion, cantHuevos)
    VALUES (_idlote, _avesActuales, _mortalidad, _Alimento, _alimentoAve, NULL, NULL);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_Detalleventas` (IN `_idventa` INT, IN `_idhuevo` INT, IN `_cantidad` INT, IN `_pesoTotal` DECIMAL(7,2), IN `_preciounitario` DECIMAL(6,2), IN `_preciototal` DECIMAL(10,2))   BEGIN 
 -- declara variable de stock
	DECLARE _stockProducto DECIMAL(6,2) DEFAULT 0;
    DECLARE _iduser INT;
    DECLARE _canthuevos INT;
    -- obtiene el stock del producto elegido
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idhuevo = _idhuevo ORDER BY creado DESC LIMIT 1;
    
    
    
    -- realiza descuento al kardex por venta
    SET _stockProducto = _stockProducto - _cantidad;
    
    SELECT idcolaborador INTO _iduser
    FROM ventas
	WHERE idventa = _idventa
    LIMIT 1;
    
     -- Registramos el kardex 
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_iduser, _idhuevo, 'S', 'Salida por Venta', _stockProducto, _cantidad, NULL, NOW());
    
    -- registramos en detalle venta
    INSERT INTO detalleventas(idventa, idhuevo, cantidad, PesoTotal, precioUnitario, precioTotal)
    VALUES(_idventa, _idhuevo, _cantidad, _pesoTotal, _preciounitario, _preciototal);
    SELECT @@last_insert_id AS iddetalleventa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_numLote` (IN `_numlote` VARCHAR(60), IN `_CantInicio` INT, IN `_descripcion` VARCHAR(60))   BEGIN
	INSERT INTO numLote 
		(numLote, CantInicio,  descripcion) VALUES 
        (_numlote,_CantInicio, _descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_productos` (IN `_producto` VARCHAR(60), IN `_stockminimo` INT, IN `_descripcion` VARCHAR(60))   BEGIN
	INSERT INTO productos 
		(producto,stockminimo , descripcion) VALUES 
        (_producto,_stockminimo, _descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_ventas` (IN `_idcliente` INT, IN `_idcolaborador` INT, IN `_direccion` VARCHAR(90))   BEGIN 
    INSERT INTO ventas(idcliente, idcolaborador, direccion) 
    VALUES(_idcliente, _idcolaborador, _direccion);
    SELECT @@last_insert_id AS idventa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_venta` (IN `p_idventa` INT, IN `p_estado` VARCHAR(30), IN `p_direccion` VARCHAR(50))   BEGIN
    UPDATE ventas
    SET 
        estado = IFNULL(p_estado, estado),
        direccion = IFNULL(p_direccion, direccion)
    WHERE idventa = p_idventa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_venta` (IN `p_idventa` INT)   BEGIN
    DELETE FROM ventas
    WHERE idventa = p_idventa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `tipodocumento` char(3) NOT NULL,
  `razonsocial` varchar(90) DEFAULT NULL,
  `direccion` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `idcolaborador` int(11) NOT NULL,
  `nomusuario` varchar(60) NOT NULL,
  `passusuario` varchar(120) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colaboradores`
--

INSERT INTO `colaboradores` (`idcolaborador`, `nomusuario`, `passusuario`, `idpersona`, `create_at`, `inactive_at`) VALUES
(1, 'BBuleje', '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS', 1, '2024-11-15 10:52:36', NULL),
(2, 'EOrtiz', '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS', 2, '2024-11-15 10:52:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controllote`
--

CREATE TABLE `controllote` (
  `idcontrollote` int(11) NOT NULL,
  `idlote` int(11) NOT NULL,
  `numaves` int(11) NOT NULL,
  `mortalidad` int(11) NOT NULL,
  `alimento` decimal(6,2) NOT NULL,
  `alimentoAve` decimal(6,2) NOT NULL,
  `produccion` decimal(6,2) DEFAULT NULL,
  `cantHuevos` int(11) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `controllote`
--

INSERT INTO `controllote` (`idcontrollote`, `idlote`, `numaves`, `mortalidad`, `alimento`, `alimentoAve`, `produccion`, `cantHuevos`, `create_at`) VALUES
(1, 1, 3000, 3, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(2, 1, 2997, 2, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(3, 1, 2995, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(4, 1, 2993, 2, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(5, 1, 2991, 4, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(6, 1, 2987, 3, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(7, 1, 2984, 1, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(8, 1, 2983, 3, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(9, 1, 2980, 3, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(10, 1, 2977, 3, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(11, 1, 2974, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(12, 1, 2973, 4, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(13, 1, 2969, 3, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(14, 1, 2966, 4, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(15, 1, 2962, 4, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(16, 1, 2958, 1, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(17, 1, 2957, 1, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(18, 1, 2956, 2, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(19, 1, 2954, 4, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(20, 1, 2950, 4, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(21, 1, 2946, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(22, 1, 2943, 1, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(23, 1, 2942, 2, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(24, 1, 2940, 4, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(25, 1, 2936, 3, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(26, 1, 2933, 2, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(27, 1, 2931, 1, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(28, 1, 2930, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(29, 1, 2929, 4, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(30, 1, 2925, 3, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(31, 1, 2922, 3, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(32, 1, 2919, 1, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(33, 1, 2918, 3, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(34, 1, 2915, 3, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(35, 1, 2912, 3, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(36, 1, 2909, 3, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(37, 1, 2906, 3, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(38, 1, 2903, 4, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(39, 1, 2899, 1, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(40, 1, 2898, 2, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(41, 1, 2896, 4, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(42, 1, 2892, 3, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(43, 1, 2889, 4, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(44, 1, 2885, 3, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(45, 1, 2882, 3, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(46, 1, 2879, 3, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(47, 1, 2876, 2, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(48, 1, 2874, 2, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(49, 1, 2872, 4, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(50, 1, 2868, 2, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(51, 1, 2866, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(52, 1, 2863, 4, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(53, 1, 2859, 4, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(54, 1, 2855, 3, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(55, 1, 2852, 3, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(56, 1, 2849, 2, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(57, 1, 2847, 4, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(58, 1, 2843, 4, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(59, 1, 2839, 2, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(60, 1, 2837, 4, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(61, 1, 2833, 2, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(62, 1, 2831, 4, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(63, 1, 2827, 1, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(64, 1, 2826, 2, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(65, 1, 2824, 3, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(66, 1, 2821, 2, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(67, 1, 2819, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(68, 1, 2816, 1, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(69, 1, 2815, 3, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(70, 1, 2812, 1, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(71, 1, 2811, 2, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(72, 1, 2809, 2, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(73, 1, 2807, 1, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(74, 1, 2806, 1, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(75, 1, 2805, 3, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(76, 1, 2802, 2, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(77, 1, 2800, 1, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(78, 1, 2799, 1, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(79, 1, 2798, 2, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(80, 1, 2796, 1, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(81, 1, 2795, 2, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(82, 1, 2793, 1, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(83, 1, 2792, 1, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(84, 1, 2791, 4, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(85, 1, 2787, 2, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(86, 1, 2785, 4, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(87, 1, 2781, 1, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(88, 1, 2780, 4, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(89, 1, 2776, 4, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(90, 1, 2772, 2, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(91, 1, 2770, 1, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(92, 1, 2769, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(93, 1, 2767, 1, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(94, 1, 2766, 2, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(95, 1, 2764, 4, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(96, 1, 2760, 4, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(97, 1, 2756, 1, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(98, 1, 2755, 3, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(99, 1, 2752, 3, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(100, 1, 2749, 1, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(101, 1, 2748, 2, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(102, 1, 2746, 1, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(103, 1, 2745, 2, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(104, 1, 2743, 4, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(105, 1, 2739, 4, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(106, 1, 2735, 1, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(107, 1, 2734, 2, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(108, 1, 2732, 4, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(109, 1, 2728, 3, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(110, 1, 2725, 3, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(111, 1, 2722, 4, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(112, 1, 2718, 2, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(113, 1, 2716, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(114, 1, 2712, 2, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(115, 1, 2710, 2, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(116, 1, 2708, 3, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(117, 1, 2705, 1, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(118, 1, 2704, 4, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(119, 1, 2700, 4, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(120, 1, 2696, 2, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(121, 1, 2694, 4, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(122, 1, 2690, 4, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(123, 1, 2686, 2, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(124, 1, 2684, 1, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(125, 1, 2683, 2, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(126, 1, 2681, 1, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(127, 1, 2680, 4, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(128, 1, 2676, 3, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(129, 1, 2673, 3, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(130, 1, 2670, 3, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(131, 1, 2667, 3, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(132, 1, 2664, 2, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(133, 1, 2662, 2, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(134, 1, 2660, 1, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(135, 1, 2659, 3, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(136, 1, 2656, 2, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(137, 1, 2654, 2, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(138, 1, 2652, 3, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(139, 1, 2649, 2, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(140, 1, 2647, 1, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(141, 1, 2646, 2, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(142, 1, 2644, 1, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(143, 1, 2643, 2, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(144, 1, 2641, 4, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(145, 1, 2637, 4, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(146, 1, 2633, 1, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(147, 1, 2632, 2, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(148, 1, 2630, 4, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(149, 1, 2626, 4, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(150, 1, 2622, 1, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(151, 1, 2621, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(152, 1, 2619, 2, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(153, 1, 2617, 4, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(154, 1, 2613, 3, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(155, 1, 2610, 2, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(156, 1, 2608, 2, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(157, 1, 2606, 1, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(158, 1, 2605, 1, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(159, 1, 2604, 2, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(160, 1, 2602, 2, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(161, 1, 2600, 2, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(162, 1, 2598, 1, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(163, 1, 2597, 1, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(164, 1, 2596, 1, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(165, 1, 2595, 4, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(166, 1, 2591, 3, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(167, 1, 2588, 1, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(168, 1, 2587, 1, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(169, 1, 2586, 1, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(170, 1, 2585, 3, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(171, 1, 2582, 3, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(172, 1, 2579, 3, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(173, 1, 2576, 1, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(174, 1, 2575, 1, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(175, 1, 2574, 2, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(176, 1, 2572, 4, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(177, 1, 2568, 4, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(178, 1, 2564, 1, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(179, 1, 2563, 2, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(180, 1, 2561, 4, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(181, 1, 2557, 1, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(182, 1, 2556, 3, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(183, 1, 2553, 1, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(184, 1, 2552, 2, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(185, 1, 2550, 1, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(186, 1, 2549, 4, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(187, 1, 2545, 3, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(188, 1, 2542, 3, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(189, 1, 2539, 3, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(190, 1, 2536, 1, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(191, 1, 2535, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(192, 1, 2533, 3, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(193, 1, 2530, 4, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(194, 1, 2526, 2, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(195, 1, 2524, 3, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(196, 1, 2521, 2, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(197, 1, 2519, 1, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(198, 1, 2518, 2, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(199, 1, 2516, 3, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(200, 1, 2513, 2, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(201, 1, 2511, 2, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(202, 1, 2509, 3, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(203, 1, 2506, 3, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(204, 1, 2503, 4, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(205, 1, 2499, 4, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(206, 1, 2495, 3, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(207, 1, 2492, 1, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(208, 1, 2491, 3, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(209, 1, 2488, 2, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(210, 1, 2486, 3, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(211, 1, 2483, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(212, 1, 2479, 2, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(213, 1, 2477, 2, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(214, 1, 2475, 2, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(215, 1, 2473, 2, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(216, 1, 2471, 4, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(217, 1, 2467, 2, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(218, 1, 2465, 1, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(219, 1, 2464, 4, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(220, 1, 2460, 4, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(221, 1, 2456, 1, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(222, 1, 2455, 3, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(223, 1, 2452, 1, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(224, 1, 2451, 3, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(225, 1, 2448, 2, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(226, 1, 2446, 3, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(227, 1, 2443, 1, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(228, 1, 2442, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(229, 1, 2441, 2, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(230, 1, 2439, 1, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(231, 1, 2438, 1, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(232, 1, 2437, 1, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(233, 1, 2436, 1, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(234, 1, 2435, 1, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(235, 1, 2434, 2, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(236, 1, 2432, 4, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(237, 1, 2428, 1, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(238, 1, 2427, 3, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(239, 1, 2424, 3, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(240, 1, 2421, 4, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(241, 1, 2417, 2, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(242, 1, 2415, 1, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(243, 1, 2414, 2, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(244, 1, 2412, 4, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(245, 1, 2408, 4, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(246, 1, 2404, 3, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(247, 1, 2401, 4, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(248, 1, 2397, 1, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(249, 1, 2396, 1, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(250, 1, 2395, 4, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(251, 2, 4000, 3, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(252, 2, 3997, 1, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(253, 2, 3996, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(254, 2, 3994, 1, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(255, 2, 3993, 2, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(256, 2, 3991, 1, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(257, 2, 3990, 3, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(258, 2, 3987, 1, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(259, 2, 3986, 2, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(260, 2, 3984, 4, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(261, 2, 3980, 3, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(262, 2, 3977, 2, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(263, 2, 3975, 3, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(264, 2, 3972, 1, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(265, 2, 3971, 1, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(266, 2, 3970, 2, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(267, 2, 3968, 3, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(268, 2, 3965, 4, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(269, 2, 3961, 3, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(270, 2, 3958, 1, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(271, 2, 3957, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(272, 2, 3954, 2, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(273, 2, 3952, 4, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(274, 2, 3948, 3, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(275, 2, 3945, 4, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(276, 2, 3941, 3, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(277, 2, 3938, 2, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(278, 2, 3936, 3, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(279, 2, 3933, 1, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(280, 2, 3932, 1, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(281, 2, 3931, 4, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(282, 2, 3927, 3, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(283, 2, 3924, 2, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(284, 2, 3922, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(285, 2, 3921, 3, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(286, 2, 3918, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(287, 2, 3917, 3, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(288, 2, 3914, 1, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(289, 2, 3913, 2, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(290, 2, 3911, 4, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(291, 2, 3907, 2, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(292, 2, 3905, 2, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(293, 2, 3903, 4, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(294, 2, 3899, 4, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(295, 2, 3895, 3, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(296, 2, 3892, 1, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(297, 2, 3891, 4, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(298, 2, 3887, 2, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(299, 2, 3885, 3, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(300, 2, 3882, 1, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(301, 2, 3881, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(302, 2, 3878, 1, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(303, 2, 3877, 3, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(304, 2, 3874, 1, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(305, 2, 3873, 4, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(306, 2, 3869, 1, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(307, 2, 3868, 3, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(308, 2, 3865, 4, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(309, 2, 3861, 2, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(310, 2, 3859, 2, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(311, 2, 3857, 1, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(312, 2, 3856, 1, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(313, 2, 3855, 1, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(314, 2, 3854, 1, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(315, 2, 3853, 3, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(316, 2, 3850, 2, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(317, 2, 3848, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(318, 2, 3845, 4, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(319, 2, 3841, 3, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(320, 2, 3838, 3, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(321, 2, 3835, 1, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(322, 2, 3834, 3, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(323, 2, 3831, 2, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(324, 2, 3829, 3, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(325, 2, 3826, 4, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(326, 2, 3822, 1, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(327, 2, 3821, 4, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(328, 2, 3817, 1, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(329, 2, 3816, 4, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(330, 2, 3812, 1, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(331, 2, 3811, 4, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(332, 2, 3807, 4, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(333, 2, 3803, 2, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(334, 2, 3801, 2, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(335, 2, 3799, 4, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(336, 2, 3795, 4, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(337, 2, 3791, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(338, 2, 3789, 1, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(339, 2, 3788, 4, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(340, 2, 3784, 4, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(341, 2, 3780, 3, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(342, 2, 3777, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(343, 2, 3775, 2, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(344, 2, 3773, 1, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(345, 2, 3772, 1, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(346, 2, 3771, 3, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(347, 2, 3768, 4, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(348, 2, 3764, 2, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(349, 2, 3762, 4, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(350, 2, 3758, 2, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(351, 2, 3756, 4, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(352, 2, 3752, 4, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(353, 2, 3748, 1, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(354, 2, 3747, 2, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(355, 2, 3745, 4, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(356, 2, 3741, 4, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(357, 2, 3737, 1, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(358, 2, 3736, 3, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(359, 2, 3733, 1, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(360, 2, 3732, 1, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(361, 2, 3731, 2, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(362, 2, 3729, 2, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(363, 2, 3727, 2, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(364, 2, 3725, 3, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(365, 2, 3722, 2, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(366, 2, 3720, 3, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(367, 2, 3717, 2, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(368, 2, 3715, 2, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(369, 2, 3713, 1, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(370, 2, 3712, 3, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(371, 2, 3709, 1, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(372, 2, 3708, 1, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(373, 2, 3707, 3, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(374, 2, 3704, 3, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(375, 2, 3701, 4, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(376, 2, 3697, 2, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(377, 2, 3695, 1, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(378, 2, 3694, 4, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(379, 2, 3690, 4, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(380, 2, 3686, 3, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(381, 2, 3683, 4, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(382, 2, 3679, 3, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(383, 2, 3676, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(384, 2, 3675, 4, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(385, 2, 3671, 4, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(386, 2, 3667, 1, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(387, 2, 3666, 1, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(388, 2, 3665, 3, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(389, 2, 3662, 4, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(390, 2, 3658, 1, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(391, 2, 3657, 4, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(392, 2, 3653, 3, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(393, 2, 3650, 1, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(394, 2, 3649, 2, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(395, 2, 3647, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(396, 2, 3644, 4, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(397, 2, 3640, 1, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(398, 2, 3639, 4, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(399, 2, 3635, 1, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(400, 2, 3634, 4, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(401, 2, 3630, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(402, 2, 3628, 3, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(403, 2, 3625, 2, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(404, 2, 3623, 4, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(405, 2, 3619, 4, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(406, 2, 3615, 3, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(407, 2, 3612, 3, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(408, 2, 3609, 1, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(409, 2, 3608, 2, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(410, 2, 3606, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(411, 2, 3602, 3, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(412, 2, 3599, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(413, 2, 3597, 3, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(414, 2, 3594, 3, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(415, 2, 3591, 1, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(416, 2, 3590, 1, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(417, 2, 3589, 3, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(418, 2, 3586, 4, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(419, 2, 3582, 2, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(420, 2, 3580, 4, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(421, 2, 3576, 3, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(422, 2, 3573, 2, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(423, 2, 3571, 3, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(424, 2, 3568, 1, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(425, 2, 3567, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(426, 2, 3566, 3, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(427, 2, 3563, 2, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(428, 2, 3561, 4, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(429, 2, 3557, 3, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(430, 2, 3554, 4, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(431, 2, 3550, 1, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(432, 2, 3549, 2, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(433, 2, 3547, 3, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(434, 2, 3544, 3, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(435, 2, 3541, 3, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(436, 2, 3538, 2, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(437, 2, 3536, 4, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(438, 2, 3532, 3, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(439, 2, 3529, 4, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(440, 2, 3525, 4, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(441, 2, 3521, 4, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(442, 2, 3517, 3, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(443, 2, 3514, 2, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(444, 2, 3512, 2, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(445, 2, 3510, 3, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(446, 2, 3507, 4, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(447, 2, 3503, 4, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(448, 2, 3499, 2, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(449, 2, 3497, 4, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(450, 2, 3493, 2, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(451, 2, 3491, 2, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(452, 2, 3489, 2, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(453, 2, 3487, 4, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(454, 2, 3483, 4, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(455, 2, 3479, 2, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(456, 2, 3477, 4, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(457, 2, 3473, 4, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(458, 2, 3469, 4, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(459, 2, 3465, 1, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(460, 2, 3464, 4, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(461, 2, 3460, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(462, 2, 3456, 2, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(463, 2, 3454, 3, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(464, 2, 3451, 3, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(465, 2, 3448, 1, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(466, 2, 3447, 2, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(467, 2, 3445, 3, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(468, 2, 3442, 2, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(469, 2, 3440, 4, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(470, 2, 3436, 1, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(471, 2, 3435, 1, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(472, 2, 3434, 1, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(473, 2, 3433, 1, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(474, 2, 3432, 2, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(475, 2, 3430, 4, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(476, 2, 3426, 4, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(477, 2, 3422, 4, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(478, 2, 3418, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(479, 2, 3417, 4, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(480, 2, 3413, 2, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(481, 2, 3411, 2, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(482, 2, 3409, 3, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(483, 2, 3406, 1, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(484, 2, 3405, 2, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(485, 2, 3403, 3, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(486, 2, 3400, 3, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(487, 2, 3397, 3, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(488, 2, 3394, 1, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(489, 2, 3393, 4, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(490, 2, 3389, 2, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(491, 2, 3387, 4, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(492, 2, 3383, 2, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(493, 2, 3381, 4, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(494, 2, 3377, 3, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(495, 2, 3374, 1, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(496, 2, 3373, 1, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(497, 2, 3372, 3, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(498, 2, 3369, 4, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(499, 2, 3365, 4, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(500, 2, 3361, 1, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(501, 3, 4000, 3, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(502, 3, 3997, 4, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(503, 3, 3993, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(504, 3, 3991, 4, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(505, 3, 3987, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(506, 3, 3984, 2, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(507, 3, 3982, 3, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(508, 3, 3979, 4, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(509, 3, 3975, 4, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(510, 3, 3971, 4, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(511, 3, 3967, 3, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(512, 3, 3964, 1, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(513, 3, 3963, 4, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(514, 3, 3959, 4, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(515, 3, 3955, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(516, 3, 3952, 3, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(517, 3, 3949, 4, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(518, 3, 3945, 3, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(519, 3, 3942, 2, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(520, 3, 3940, 4, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(521, 3, 3936, 1, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(522, 3, 3935, 4, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(523, 3, 3931, 1, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(524, 3, 3930, 2, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(525, 3, 3928, 1, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(526, 3, 3927, 2, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(527, 3, 3925, 2, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(528, 3, 3923, 3, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(529, 3, 3920, 1, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(530, 3, 3919, 1, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(531, 3, 3918, 2, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(532, 3, 3916, 4, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(533, 3, 3912, 4, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(534, 3, 3908, 2, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(535, 3, 3906, 3, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(536, 3, 3903, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(537, 3, 3902, 1, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(538, 3, 3901, 4, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(539, 3, 3897, 3, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(540, 3, 3894, 2, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(541, 3, 3892, 4, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(542, 3, 3888, 3, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(543, 3, 3885, 3, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(544, 3, 3882, 1, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(545, 3, 3881, 1, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(546, 3, 3880, 2, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(547, 3, 3878, 4, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(548, 3, 3874, 1, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(549, 3, 3873, 4, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(550, 3, 3869, 4, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(551, 3, 3865, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(552, 3, 3862, 1, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(553, 3, 3861, 1, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(554, 3, 3860, 4, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(555, 3, 3856, 1, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(556, 3, 3855, 3, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(557, 3, 3852, 1, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(558, 3, 3851, 1, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(559, 3, 3850, 1, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(560, 3, 3849, 1, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(561, 3, 3848, 1, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(562, 3, 3847, 3, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(563, 3, 3844, 4, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(564, 3, 3840, 2, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(565, 3, 3838, 4, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(566, 3, 3834, 1, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(567, 3, 3833, 4, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(568, 3, 3829, 2, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(569, 3, 3827, 1, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(570, 3, 3826, 1, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(571, 3, 3825, 1, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(572, 3, 3824, 3, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(573, 3, 3821, 4, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(574, 3, 3817, 4, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(575, 3, 3813, 2, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(576, 3, 3811, 1, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(577, 3, 3810, 1, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(578, 3, 3809, 4, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(579, 3, 3805, 1, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(580, 3, 3804, 1, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(581, 3, 3803, 4, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(582, 3, 3799, 2, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(583, 3, 3797, 1, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(584, 3, 3796, 3, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(585, 3, 3793, 1, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(586, 3, 3792, 2, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(587, 3, 3790, 1, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(588, 3, 3789, 3, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(589, 3, 3786, 1, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(590, 3, 3785, 1, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(591, 3, 3784, 2, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(592, 3, 3782, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(593, 3, 3780, 4, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(594, 3, 3776, 1, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(595, 3, 3775, 2, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(596, 3, 3773, 1, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(597, 3, 3772, 2, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(598, 3, 3770, 2, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(599, 3, 3768, 3, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(600, 3, 3765, 2, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(601, 3, 3763, 2, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(602, 3, 3761, 3, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(603, 3, 3758, 1, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(604, 3, 3757, 1, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(605, 3, 3756, 3, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(606, 3, 3753, 4, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(607, 3, 3749, 2, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(608, 3, 3747, 3, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(609, 3, 3744, 1, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(610, 3, 3743, 4, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(611, 3, 3739, 2, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(612, 3, 3737, 4, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(613, 3, 3733, 3, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(614, 3, 3730, 1, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(615, 3, 3729, 2, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(616, 3, 3727, 2, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(617, 3, 3725, 4, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(618, 3, 3721, 4, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(619, 3, 3717, 4, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(620, 3, 3713, 3, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(621, 3, 3710, 2, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(622, 3, 3708, 3, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(623, 3, 3705, 3, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(624, 3, 3702, 3, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(625, 3, 3699, 2, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(626, 3, 3697, 3, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(627, 3, 3694, 3, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(628, 3, 3691, 2, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(629, 3, 3689, 4, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(630, 3, 3685, 4, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(631, 3, 3681, 2, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(632, 3, 3679, 2, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(633, 3, 3677, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(634, 3, 3676, 3, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(635, 3, 3673, 4, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(636, 3, 3669, 3, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(637, 3, 3666, 3, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(638, 3, 3663, 2, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(639, 3, 3661, 1, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(640, 3, 3660, 3, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(641, 3, 3657, 4, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(642, 3, 3653, 4, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(643, 3, 3649, 4, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(644, 3, 3645, 3, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(645, 3, 3642, 2, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(646, 3, 3640, 2, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(647, 3, 3638, 2, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(648, 3, 3636, 1, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(649, 3, 3635, 4, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(650, 3, 3631, 1, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(651, 3, 3630, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(652, 3, 3628, 1, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(653, 3, 3627, 4, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(654, 3, 3623, 1, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(655, 3, 3622, 1, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(656, 3, 3621, 3, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(657, 3, 3618, 1, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(658, 3, 3617, 4, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(659, 3, 3613, 1, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(660, 3, 3612, 1, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(661, 3, 3611, 1, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(662, 3, 3610, 3, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(663, 3, 3607, 2, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(664, 3, 3605, 2, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(665, 3, 3603, 1, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(666, 3, 3602, 2, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(667, 3, 3600, 1, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(668, 3, 3599, 1, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(669, 3, 3598, 1, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(670, 3, 3597, 1, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(671, 3, 3596, 1, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(672, 3, 3595, 3, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(673, 3, 3592, 3, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(674, 3, 3589, 2, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(675, 3, 3587, 4, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(676, 3, 3583, 1, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(677, 3, 3582, 4, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(678, 3, 3578, 2, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(679, 3, 3576, 1, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(680, 3, 3575, 2, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(681, 3, 3573, 2, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(682, 3, 3571, 4, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(683, 3, 3567, 2, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(684, 3, 3565, 2, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(685, 3, 3563, 4, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(686, 3, 3559, 2, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(687, 3, 3557, 1, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(688, 3, 3556, 2, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(689, 3, 3554, 4, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(690, 3, 3550, 4, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(691, 3, 3546, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(692, 3, 3544, 3, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(693, 3, 3541, 3, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(694, 3, 3538, 2, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(695, 3, 3536, 2, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(696, 3, 3534, 2, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(697, 3, 3532, 1, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(698, 3, 3531, 1, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(699, 3, 3530, 1, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(700, 3, 3529, 2, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(701, 3, 3527, 1, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(702, 3, 3526, 3, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(703, 3, 3523, 4, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(704, 3, 3519, 1, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(705, 3, 3518, 4, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(706, 3, 3514, 1, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(707, 3, 3513, 2, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(708, 3, 3511, 3, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(709, 3, 3508, 1, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(710, 3, 3507, 1, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(711, 3, 3506, 3, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(712, 3, 3503, 1, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(713, 3, 3502, 4, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(714, 3, 3498, 1, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(715, 3, 3497, 4, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(716, 3, 3493, 4, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(717, 3, 3489, 4, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(718, 3, 3485, 2, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(719, 3, 3483, 3, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(720, 3, 3480, 3, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(721, 3, 3477, 3, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(722, 3, 3474, 1, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(723, 3, 3473, 2, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(724, 3, 3471, 1, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(725, 3, 3470, 4, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(726, 3, 3466, 4, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(727, 3, 3462, 1, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(728, 3, 3461, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(729, 3, 3460, 1, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(730, 3, 3459, 4, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(731, 3, 3455, 3, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(732, 3, 3452, 3, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(733, 3, 3449, 3, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(734, 3, 3446, 3, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(735, 3, 3443, 3, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(736, 3, 3440, 3, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(737, 3, 3437, 3, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(738, 3, 3434, 2, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(739, 3, 3432, 4, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(740, 3, 3428, 4, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(741, 3, 3424, 3, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(742, 3, 3421, 2, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(743, 3, 3419, 2, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(744, 3, 3417, 3, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(745, 3, 3414, 1, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(746, 3, 3413, 1, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(747, 3, 3412, 2, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(748, 3, 3410, 4, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(749, 3, 3406, 3, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(750, 3, 3403, 4, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(751, 4, 6000, 4, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(752, 4, 5996, 2, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(753, 4, 5994, 3, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(754, 4, 5991, 3, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(755, 4, 5988, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(756, 4, 5985, 4, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00');
INSERT INTO `controllote` (`idcontrollote`, `idlote`, `numaves`, `mortalidad`, `alimento`, `alimentoAve`, `produccion`, `cantHuevos`, `create_at`) VALUES
(757, 4, 5981, 2, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(758, 4, 5979, 1, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(759, 4, 5978, 3, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(760, 4, 5975, 3, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(761, 4, 5972, 3, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(762, 4, 5969, 1, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(763, 4, 5968, 1, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(764, 4, 5967, 2, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(765, 4, 5965, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(766, 4, 5962, 2, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(767, 4, 5960, 1, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(768, 4, 5959, 3, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(769, 4, 5956, 4, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(770, 4, 5952, 3, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(771, 4, 5949, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(772, 4, 5946, 3, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(773, 4, 5943, 3, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(774, 4, 5940, 1, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(775, 4, 5939, 3, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(776, 4, 5936, 1, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(777, 4, 5935, 1, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(778, 4, 5934, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(779, 4, 5933, 4, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(780, 4, 5929, 4, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(781, 4, 5925, 2, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(782, 4, 5923, 2, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(783, 4, 5921, 3, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(784, 4, 5918, 3, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(785, 4, 5915, 2, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(786, 4, 5913, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(787, 4, 5912, 4, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(788, 4, 5908, 2, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(789, 4, 5906, 1, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(790, 4, 5905, 1, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(791, 4, 5904, 2, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(792, 4, 5902, 2, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(793, 4, 5900, 4, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(794, 4, 5896, 1, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(795, 4, 5895, 3, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(796, 4, 5892, 4, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(797, 4, 5888, 1, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(798, 4, 5887, 2, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(799, 4, 5885, 3, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(800, 4, 5882, 2, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(801, 4, 5880, 4, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(802, 4, 5876, 3, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(803, 4, 5873, 3, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(804, 4, 5870, 2, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(805, 4, 5868, 2, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(806, 4, 5866, 3, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(807, 4, 5863, 3, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(808, 4, 5860, 4, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(809, 4, 5856, 4, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(810, 4, 5852, 1, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(811, 4, 5851, 4, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(812, 4, 5847, 4, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(813, 4, 5843, 2, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(814, 4, 5841, 2, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(815, 4, 5839, 3, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(816, 4, 5836, 2, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(817, 4, 5834, 2, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(818, 4, 5832, 1, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(819, 4, 5831, 1, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(820, 4, 5830, 3, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(821, 4, 5827, 1, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(822, 4, 5826, 1, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(823, 4, 5825, 2, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(824, 4, 5823, 1, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(825, 4, 5822, 3, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(826, 4, 5819, 4, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(827, 4, 5815, 4, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(828, 4, 5811, 4, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(829, 4, 5807, 1, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(830, 4, 5806, 4, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(831, 4, 5802, 4, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(832, 4, 5798, 4, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(833, 4, 5794, 2, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(834, 4, 5792, 3, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(835, 4, 5789, 1, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(836, 4, 5788, 1, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(837, 4, 5787, 3, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(838, 4, 5784, 4, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(839, 4, 5780, 3, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(840, 4, 5777, 1, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(841, 4, 5776, 4, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(842, 4, 5772, 1, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(843, 4, 5771, 1, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(844, 4, 5770, 1, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(845, 4, 5769, 4, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(846, 4, 5765, 3, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(847, 4, 5762, 4, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(848, 4, 5758, 4, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(849, 4, 5754, 2, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(850, 4, 5752, 2, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(851, 4, 5750, 2, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(852, 4, 5748, 2, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(853, 4, 5746, 1, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(854, 4, 5745, 4, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(855, 4, 5741, 1, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(856, 4, 5740, 4, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(857, 4, 5736, 1, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(858, 4, 5735, 4, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(859, 4, 5731, 2, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(860, 4, 5729, 4, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(861, 4, 5725, 3, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(862, 4, 5722, 1, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(863, 4, 5721, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(864, 4, 5717, 3, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(865, 4, 5714, 1, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(866, 4, 5713, 2, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(867, 4, 5711, 1, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(868, 4, 5710, 3, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(869, 4, 5707, 2, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(870, 4, 5705, 4, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(871, 4, 5701, 1, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(872, 4, 5700, 3, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(873, 4, 5697, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(874, 4, 5696, 4, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(875, 4, 5692, 1, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(876, 4, 5691, 2, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(877, 4, 5689, 3, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(878, 4, 5686, 2, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(879, 4, 5684, 2, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(880, 4, 5682, 4, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(881, 4, 5678, 3, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(882, 4, 5675, 2, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(883, 4, 5673, 4, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(884, 4, 5669, 4, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(885, 4, 5665, 4, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(886, 4, 5661, 2, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(887, 4, 5659, 4, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(888, 4, 5655, 3, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(889, 4, 5652, 4, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(890, 4, 5648, 2, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(891, 4, 5646, 3, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(892, 4, 5643, 1, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(893, 4, 5642, 1, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(894, 4, 5641, 4, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(895, 4, 5637, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(896, 4, 5634, 3, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(897, 4, 5631, 3, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(898, 4, 5628, 4, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(899, 4, 5624, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(900, 4, 5622, 2, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(901, 4, 5620, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(902, 4, 5618, 3, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(903, 4, 5615, 4, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(904, 4, 5611, 2, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(905, 4, 5609, 2, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(906, 4, 5607, 3, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(907, 4, 5604, 3, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(908, 4, 5601, 4, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(909, 4, 5597, 4, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(910, 4, 5593, 2, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(911, 4, 5591, 4, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(912, 4, 5587, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(913, 4, 5585, 1, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(914, 4, 5584, 4, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(915, 4, 5580, 3, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(916, 4, 5577, 4, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(917, 4, 5573, 3, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(918, 4, 5570, 2, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(919, 4, 5568, 4, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(920, 4, 5564, 2, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(921, 4, 5562, 4, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(922, 4, 5558, 3, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(923, 4, 5555, 2, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(924, 4, 5553, 2, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(925, 4, 5551, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(926, 4, 5550, 3, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(927, 4, 5547, 4, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(928, 4, 5543, 1, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(929, 4, 5542, 3, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(930, 4, 5539, 3, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(931, 4, 5536, 1, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(932, 4, 5535, 3, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(933, 4, 5532, 2, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(934, 4, 5530, 4, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(935, 4, 5526, 1, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(936, 4, 5525, 3, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(937, 4, 5522, 3, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(938, 4, 5519, 1, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(939, 4, 5518, 2, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(940, 4, 5516, 3, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(941, 4, 5513, 1, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(942, 4, 5512, 1, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(943, 4, 5511, 3, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(944, 4, 5508, 1, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(945, 4, 5507, 2, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(946, 4, 5505, 4, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(947, 4, 5501, 2, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(948, 4, 5499, 3, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(949, 4, 5496, 2, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(950, 4, 5494, 1, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(951, 4, 5493, 4, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(952, 4, 5489, 3, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(953, 4, 5486, 1, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(954, 4, 5485, 4, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(955, 4, 5481, 4, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(956, 4, 5477, 2, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(957, 4, 5475, 2, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(958, 4, 5473, 2, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(959, 4, 5471, 1, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(960, 4, 5470, 3, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(961, 4, 5467, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(962, 4, 5463, 2, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(963, 4, 5461, 3, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(964, 4, 5458, 3, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(965, 4, 5455, 1, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(966, 4, 5454, 1, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(967, 4, 5453, 1, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(968, 4, 5452, 2, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(969, 4, 5450, 2, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(970, 4, 5448, 2, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(971, 4, 5446, 4, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(972, 4, 5442, 3, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(973, 4, 5439, 4, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(974, 4, 5435, 2, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(975, 4, 5433, 4, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(976, 4, 5429, 2, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(977, 4, 5427, 3, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(978, 4, 5424, 4, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(979, 4, 5420, 2, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(980, 4, 5418, 1, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(981, 4, 5417, 2, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(982, 4, 5415, 1, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(983, 4, 5414, 4, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(984, 4, 5410, 3, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(985, 4, 5407, 2, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(986, 4, 5405, 4, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(987, 4, 5401, 3, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(988, 4, 5398, 4, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(989, 4, 5394, 3, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(990, 4, 5391, 3, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(991, 4, 5388, 1, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(992, 4, 5387, 1, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(993, 4, 5386, 3, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(994, 4, 5383, 4, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(995, 4, 5379, 4, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(996, 4, 5375, 1, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(997, 4, 5374, 1, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(998, 4, 5373, 1, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(999, 4, 5372, 3, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(1000, 4, 5369, 3, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(1001, 5, 6000, 2, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(1002, 5, 5998, 1, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(1003, 5, 5997, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(1004, 5, 5995, 1, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(1005, 5, 5994, 2, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(1006, 5, 5992, 4, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(1007, 5, 5988, 3, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(1008, 5, 5985, 2, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(1009, 5, 5983, 1, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(1010, 5, 5982, 2, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(1011, 5, 5980, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(1012, 5, 5979, 3, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(1013, 5, 5976, 3, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(1014, 5, 5973, 3, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(1015, 5, 5970, 4, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(1016, 5, 5966, 2, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(1017, 5, 5964, 2, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(1018, 5, 5962, 2, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(1019, 5, 5960, 4, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(1020, 5, 5956, 1, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(1021, 5, 5955, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(1022, 5, 5952, 2, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(1023, 5, 5950, 1, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(1024, 5, 5949, 1, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(1025, 5, 5948, 3, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(1026, 5, 5945, 4, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(1027, 5, 5941, 4, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(1028, 5, 5937, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(1029, 5, 5936, 2, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(1030, 5, 5934, 2, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(1031, 5, 5932, 3, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(1032, 5, 5929, 1, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(1033, 5, 5928, 3, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(1034, 5, 5925, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(1035, 5, 5924, 3, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(1036, 5, 5921, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(1037, 5, 5920, 3, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(1038, 5, 5917, 3, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(1039, 5, 5914, 2, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(1040, 5, 5912, 1, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(1041, 5, 5911, 4, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(1042, 5, 5907, 3, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(1043, 5, 5904, 1, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(1044, 5, 5903, 1, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(1045, 5, 5902, 4, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(1046, 5, 5898, 2, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(1047, 5, 5896, 3, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(1048, 5, 5893, 1, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(1049, 5, 5892, 3, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(1050, 5, 5889, 2, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(1051, 5, 5887, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(1052, 5, 5884, 4, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(1053, 5, 5880, 4, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(1054, 5, 5876, 4, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(1055, 5, 5872, 1, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(1056, 5, 5871, 4, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(1057, 5, 5867, 1, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(1058, 5, 5866, 2, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(1059, 5, 5864, 2, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(1060, 5, 5862, 3, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(1061, 5, 5859, 2, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(1062, 5, 5857, 2, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(1063, 5, 5855, 3, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(1064, 5, 5852, 1, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(1065, 5, 5851, 3, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(1066, 5, 5848, 2, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(1067, 5, 5846, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(1068, 5, 5843, 1, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(1069, 5, 5842, 3, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(1070, 5, 5839, 4, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(1071, 5, 5835, 2, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(1072, 5, 5833, 1, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(1073, 5, 5832, 3, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(1074, 5, 5829, 3, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(1075, 5, 5826, 3, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(1076, 5, 5823, 4, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(1077, 5, 5819, 4, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(1078, 5, 5815, 3, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(1079, 5, 5812, 2, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(1080, 5, 5810, 2, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(1081, 5, 5808, 3, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(1082, 5, 5805, 2, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(1083, 5, 5803, 3, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(1084, 5, 5800, 3, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(1085, 5, 5797, 1, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(1086, 5, 5796, 2, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(1087, 5, 5794, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(1088, 5, 5792, 1, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(1089, 5, 5791, 3, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(1090, 5, 5788, 4, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(1091, 5, 5784, 1, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(1092, 5, 5783, 1, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(1093, 5, 5782, 3, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(1094, 5, 5779, 4, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(1095, 5, 5775, 3, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(1096, 5, 5772, 4, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(1097, 5, 5768, 1, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(1098, 5, 5767, 3, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(1099, 5, 5764, 3, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(1100, 5, 5761, 2, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(1101, 5, 5759, 3, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(1102, 5, 5756, 3, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(1103, 5, 5753, 2, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(1104, 5, 5751, 3, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(1105, 5, 5748, 1, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(1106, 5, 5747, 4, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(1107, 5, 5743, 2, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(1108, 5, 5741, 3, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(1109, 5, 5738, 2, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(1110, 5, 5736, 4, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(1111, 5, 5732, 2, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(1112, 5, 5730, 1, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(1113, 5, 5729, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(1114, 5, 5725, 3, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(1115, 5, 5722, 4, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(1116, 5, 5718, 3, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(1117, 5, 5715, 2, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(1118, 5, 5713, 1, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(1119, 5, 5712, 3, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(1120, 5, 5709, 4, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(1121, 5, 5705, 4, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(1122, 5, 5701, 2, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(1123, 5, 5699, 3, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(1124, 5, 5696, 3, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(1125, 5, 5693, 2, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(1126, 5, 5691, 4, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(1127, 5, 5687, 4, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(1128, 5, 5683, 3, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(1129, 5, 5680, 3, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(1130, 5, 5677, 3, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(1131, 5, 5674, 3, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(1132, 5, 5671, 4, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(1133, 5, 5667, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(1134, 5, 5666, 2, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(1135, 5, 5664, 2, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(1136, 5, 5662, 4, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(1137, 5, 5658, 3, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(1138, 5, 5655, 1, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(1139, 5, 5654, 3, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(1140, 5, 5651, 2, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(1141, 5, 5649, 2, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(1142, 5, 5647, 1, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(1143, 5, 5646, 4, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(1144, 5, 5642, 4, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(1145, 5, 5638, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(1146, 5, 5635, 4, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(1147, 5, 5631, 1, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(1148, 5, 5630, 3, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(1149, 5, 5627, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(1150, 5, 5625, 1, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(1151, 5, 5624, 4, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(1152, 5, 5620, 1, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(1153, 5, 5619, 3, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(1154, 5, 5616, 2, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(1155, 5, 5614, 2, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(1156, 5, 5612, 4, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(1157, 5, 5608, 3, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(1158, 5, 5605, 3, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(1159, 5, 5602, 4, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(1160, 5, 5598, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(1161, 5, 5594, 4, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(1162, 5, 5590, 1, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(1163, 5, 5589, 4, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(1164, 5, 5585, 1, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(1165, 5, 5584, 1, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(1166, 5, 5583, 1, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(1167, 5, 5582, 4, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(1168, 5, 5578, 1, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(1169, 5, 5577, 1, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(1170, 5, 5576, 2, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(1171, 5, 5574, 4, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(1172, 5, 5570, 2, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(1173, 5, 5568, 1, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(1174, 5, 5567, 1, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(1175, 5, 5566, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(1176, 5, 5565, 3, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(1177, 5, 5562, 2, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(1178, 5, 5560, 2, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(1179, 5, 5558, 1, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(1180, 5, 5557, 2, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(1181, 5, 5555, 1, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(1182, 5, 5554, 4, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(1183, 5, 5550, 2, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(1184, 5, 5548, 2, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(1185, 5, 5546, 3, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(1186, 5, 5543, 4, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(1187, 5, 5539, 2, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(1188, 5, 5537, 4, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(1189, 5, 5533, 1, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(1190, 5, 5532, 3, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(1191, 5, 5529, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(1192, 5, 5527, 4, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(1193, 5, 5523, 4, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(1194, 5, 5519, 2, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(1195, 5, 5517, 4, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(1196, 5, 5513, 3, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(1197, 5, 5510, 2, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(1198, 5, 5508, 2, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(1199, 5, 5506, 3, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(1200, 5, 5503, 3, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(1201, 5, 5500, 3, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(1202, 5, 5497, 1, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(1203, 5, 5496, 4, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(1204, 5, 5492, 1, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(1205, 5, 5491, 2, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(1206, 5, 5489, 1, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(1207, 5, 5488, 2, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(1208, 5, 5486, 3, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(1209, 5, 5483, 3, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(1210, 5, 5480, 2, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(1211, 5, 5478, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(1212, 5, 5474, 3, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(1213, 5, 5471, 2, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(1214, 5, 5469, 2, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(1215, 5, 5467, 3, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(1216, 5, 5464, 1, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(1217, 5, 5463, 3, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(1218, 5, 5460, 3, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(1219, 5, 5457, 3, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(1220, 5, 5454, 3, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(1221, 5, 5451, 2, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(1222, 5, 5449, 1, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(1223, 5, 5448, 1, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(1224, 5, 5447, 2, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(1225, 5, 5445, 2, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(1226, 5, 5443, 3, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(1227, 5, 5440, 3, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(1228, 5, 5437, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(1229, 5, 5436, 4, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(1230, 5, 5432, 2, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(1231, 5, 5430, 3, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(1232, 5, 5427, 1, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(1233, 5, 5426, 1, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(1234, 5, 5425, 3, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(1235, 5, 5422, 4, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(1236, 5, 5418, 1, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(1237, 5, 5417, 2, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(1238, 5, 5415, 3, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(1239, 5, 5412, 3, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(1240, 5, 5409, 2, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(1241, 5, 5407, 1, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(1242, 5, 5406, 1, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(1243, 5, 5405, 4, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(1244, 5, 5401, 3, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(1245, 5, 5398, 4, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(1246, 5, 5394, 2, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(1247, 5, 5392, 4, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(1248, 5, 5388, 4, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(1249, 5, 5384, 4, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(1250, 5, 5380, 4, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(1251, 6, 7000, 1, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(1252, 6, 6999, 4, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(1253, 6, 6995, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(1254, 6, 6993, 3, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(1255, 6, 6990, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(1256, 6, 6987, 3, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(1257, 6, 6984, 4, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(1258, 6, 6980, 3, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(1259, 6, 6977, 3, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(1260, 6, 6974, 2, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(1261, 6, 6972, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(1262, 6, 6971, 1, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(1263, 6, 6970, 2, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(1264, 6, 6968, 2, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(1265, 6, 6966, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(1266, 6, 6963, 2, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(1267, 6, 6961, 3, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(1268, 6, 6958, 1, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(1269, 6, 6957, 3, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(1270, 6, 6954, 2, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(1271, 6, 6952, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(1272, 6, 6949, 4, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(1273, 6, 6945, 2, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(1274, 6, 6943, 1, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(1275, 6, 6942, 1, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(1276, 6, 6941, 3, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(1277, 6, 6938, 4, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(1278, 6, 6934, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(1279, 6, 6933, 4, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(1280, 6, 6929, 4, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(1281, 6, 6925, 4, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(1282, 6, 6921, 3, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(1283, 6, 6918, 1, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(1284, 6, 6917, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(1285, 6, 6916, 1, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(1286, 6, 6915, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(1287, 6, 6914, 2, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(1288, 6, 6912, 1, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(1289, 6, 6911, 2, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(1290, 6, 6909, 3, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(1291, 6, 6906, 3, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(1292, 6, 6903, 2, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(1293, 6, 6901, 3, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(1294, 6, 6898, 2, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(1295, 6, 6896, 4, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(1296, 6, 6892, 1, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(1297, 6, 6891, 2, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(1298, 6, 6889, 1, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(1299, 6, 6888, 4, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(1300, 6, 6884, 4, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(1301, 6, 6880, 1, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(1302, 6, 6879, 1, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(1303, 6, 6878, 2, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(1304, 6, 6876, 2, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(1305, 6, 6874, 4, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(1306, 6, 6870, 2, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(1307, 6, 6868, 2, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(1308, 6, 6866, 2, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(1309, 6, 6864, 2, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(1310, 6, 6862, 3, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(1311, 6, 6859, 3, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(1312, 6, 6856, 4, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(1313, 6, 6852, 3, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(1314, 6, 6849, 1, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(1315, 6, 6848, 2, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(1316, 6, 6846, 1, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(1317, 6, 6845, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(1318, 6, 6842, 4, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(1319, 6, 6838, 4, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(1320, 6, 6834, 3, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(1321, 6, 6831, 1, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(1322, 6, 6830, 2, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(1323, 6, 6828, 1, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(1324, 6, 6827, 1, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(1325, 6, 6826, 1, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(1326, 6, 6825, 3, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(1327, 6, 6822, 2, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(1328, 6, 6820, 2, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(1329, 6, 6818, 2, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(1330, 6, 6816, 3, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(1331, 6, 6813, 2, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(1332, 6, 6811, 2, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(1333, 6, 6809, 4, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(1334, 6, 6805, 4, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(1335, 6, 6801, 2, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(1336, 6, 6799, 4, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(1337, 6, 6795, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(1338, 6, 6793, 1, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(1339, 6, 6792, 4, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(1340, 6, 6788, 1, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(1341, 6, 6787, 3, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(1342, 6, 6784, 4, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(1343, 6, 6780, 2, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(1344, 6, 6778, 3, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(1345, 6, 6775, 4, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(1346, 6, 6771, 3, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(1347, 6, 6768, 4, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(1348, 6, 6764, 1, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(1349, 6, 6763, 4, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(1350, 6, 6759, 1, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(1351, 6, 6758, 2, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(1352, 6, 6756, 4, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(1353, 6, 6752, 3, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(1354, 6, 6749, 2, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(1355, 6, 6747, 1, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(1356, 6, 6746, 1, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(1357, 6, 6745, 3, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(1358, 6, 6742, 4, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(1359, 6, 6738, 1, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(1360, 6, 6737, 3, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(1361, 6, 6734, 3, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(1362, 6, 6731, 4, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(1363, 6, 6727, 3, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(1364, 6, 6724, 3, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(1365, 6, 6721, 1, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(1366, 6, 6720, 2, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(1367, 6, 6718, 4, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(1368, 6, 6714, 4, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(1369, 6, 6710, 3, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(1370, 6, 6707, 2, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(1371, 6, 6705, 3, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(1372, 6, 6702, 4, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(1373, 6, 6698, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(1374, 6, 6697, 2, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(1375, 6, 6695, 3, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(1376, 6, 6692, 2, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(1377, 6, 6690, 3, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(1378, 6, 6687, 1, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(1379, 6, 6686, 1, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(1380, 6, 6685, 1, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(1381, 6, 6684, 1, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(1382, 6, 6683, 4, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(1383, 6, 6679, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(1384, 6, 6678, 4, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(1385, 6, 6674, 1, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(1386, 6, 6673, 3, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(1387, 6, 6670, 2, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(1388, 6, 6668, 3, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(1389, 6, 6665, 2, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(1390, 6, 6663, 1, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(1391, 6, 6662, 1, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(1392, 6, 6661, 1, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(1393, 6, 6660, 4, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(1394, 6, 6656, 1, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(1395, 6, 6655, 1, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(1396, 6, 6654, 2, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(1397, 6, 6652, 2, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(1398, 6, 6650, 3, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(1399, 6, 6647, 1, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(1400, 6, 6646, 3, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(1401, 6, 6643, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(1402, 6, 6641, 3, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(1403, 6, 6638, 3, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(1404, 6, 6635, 2, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(1405, 6, 6633, 3, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(1406, 6, 6630, 4, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(1407, 6, 6626, 2, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(1408, 6, 6624, 2, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(1409, 6, 6622, 2, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(1410, 6, 6620, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(1411, 6, 6616, 3, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(1412, 6, 6613, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(1413, 6, 6611, 3, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(1414, 6, 6608, 1, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(1415, 6, 6607, 2, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(1416, 6, 6605, 4, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(1417, 6, 6601, 1, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(1418, 6, 6600, 2, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(1419, 6, 6598, 4, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(1420, 6, 6594, 2, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(1421, 6, 6592, 4, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(1422, 6, 6588, 3, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(1423, 6, 6585, 4, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(1424, 6, 6581, 3, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(1425, 6, 6578, 4, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(1426, 6, 6574, 2, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(1427, 6, 6572, 3, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(1428, 6, 6569, 1, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(1429, 6, 6568, 3, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(1430, 6, 6565, 3, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(1431, 6, 6562, 4, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(1432, 6, 6558, 4, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(1433, 6, 6554, 2, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(1434, 6, 6552, 3, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(1435, 6, 6549, 2, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(1436, 6, 6547, 3, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(1437, 6, 6544, 1, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(1438, 6, 6543, 2, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(1439, 6, 6541, 4, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(1440, 6, 6537, 1, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(1441, 6, 6536, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(1442, 6, 6534, 2, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(1443, 6, 6532, 2, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(1444, 6, 6530, 3, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(1445, 6, 6527, 2, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(1446, 6, 6525, 4, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(1447, 6, 6521, 4, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(1448, 6, 6517, 1, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(1449, 6, 6516, 1, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(1450, 6, 6515, 1, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(1451, 6, 6514, 3, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(1452, 6, 6511, 1, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(1453, 6, 6510, 1, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(1454, 6, 6509, 1, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(1455, 6, 6508, 3, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(1456, 6, 6505, 1, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(1457, 6, 6504, 2, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(1458, 6, 6502, 2, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(1459, 6, 6500, 4, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(1460, 6, 6496, 2, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(1461, 6, 6494, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(1462, 6, 6490, 4, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(1463, 6, 6486, 2, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(1464, 6, 6484, 2, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(1465, 6, 6482, 3, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(1466, 6, 6479, 1, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(1467, 6, 6478, 4, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(1468, 6, 6474, 2, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(1469, 6, 6472, 3, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(1470, 6, 6469, 2, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(1471, 6, 6467, 1, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(1472, 6, 6466, 3, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(1473, 6, 6463, 2, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(1474, 6, 6461, 3, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(1475, 6, 6458, 2, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(1476, 6, 6456, 2, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(1477, 6, 6454, 4, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(1478, 6, 6450, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(1479, 6, 6449, 1, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(1480, 6, 6448, 2, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(1481, 6, 6446, 2, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(1482, 6, 6444, 1, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(1483, 6, 6443, 4, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(1484, 6, 6439, 2, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(1485, 6, 6437, 2, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(1486, 6, 6435, 4, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(1487, 6, 6431, 3, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(1488, 6, 6428, 1, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(1489, 6, 6427, 2, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(1490, 6, 6425, 4, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(1491, 6, 6421, 1, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(1492, 6, 6420, 4, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(1493, 6, 6416, 1, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(1494, 6, 6415, 2, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(1495, 6, 6413, 1, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(1496, 6, 6412, 2, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(1497, 6, 6410, 3, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(1498, 6, 6407, 3, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(1499, 6, 6404, 3, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(1500, 6, 6401, 3, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(1501, 7, 7000, 1, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(1502, 7, 6999, 1, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(1503, 7, 6998, 1, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00');
INSERT INTO `controllote` (`idcontrollote`, `idlote`, `numaves`, `mortalidad`, `alimento`, `alimentoAve`, `produccion`, `cantHuevos`, `create_at`) VALUES
(1504, 7, 6997, 2, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(1505, 7, 6995, 4, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(1506, 7, 6991, 4, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(1507, 7, 6987, 3, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(1508, 7, 6984, 3, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(1509, 7, 6981, 1, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(1510, 7, 6980, 2, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(1511, 7, 6978, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(1512, 7, 6977, 1, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(1513, 7, 6976, 4, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(1514, 7, 6972, 3, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(1515, 7, 6969, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(1516, 7, 6966, 1, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(1517, 7, 6965, 1, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(1518, 7, 6964, 1, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(1519, 7, 6963, 3, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(1520, 7, 6960, 3, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(1521, 7, 6957, 4, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(1522, 7, 6953, 2, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(1523, 7, 6951, 3, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(1524, 7, 6948, 4, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(1525, 7, 6944, 4, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(1526, 7, 6940, 3, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(1527, 7, 6937, 4, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(1528, 7, 6933, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(1529, 7, 6932, 3, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(1530, 7, 6929, 4, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(1531, 7, 6925, 2, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(1532, 7, 6923, 4, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(1533, 7, 6919, 2, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(1534, 7, 6917, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(1535, 7, 6916, 4, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(1536, 7, 6912, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(1537, 7, 6911, 2, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(1538, 7, 6909, 2, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(1539, 7, 6907, 3, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(1540, 7, 6904, 2, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(1541, 7, 6902, 2, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(1542, 7, 6900, 2, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(1543, 7, 6898, 1, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(1544, 7, 6897, 3, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(1545, 7, 6894, 4, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(1546, 7, 6890, 4, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(1547, 7, 6886, 2, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(1548, 7, 6884, 3, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(1549, 7, 6881, 1, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(1550, 7, 6880, 2, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(1551, 7, 6878, 1, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(1552, 7, 6877, 4, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(1553, 7, 6873, 1, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(1554, 7, 6872, 2, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(1555, 7, 6870, 4, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(1556, 7, 6866, 4, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(1557, 7, 6862, 2, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(1558, 7, 6860, 3, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(1559, 7, 6857, 1, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(1560, 7, 6856, 1, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(1561, 7, 6855, 2, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(1562, 7, 6853, 1, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(1563, 7, 6852, 3, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(1564, 7, 6849, 3, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(1565, 7, 6846, 4, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(1566, 7, 6842, 1, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(1567, 7, 6841, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(1568, 7, 6838, 1, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(1569, 7, 6837, 4, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(1570, 7, 6833, 2, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(1571, 7, 6831, 4, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(1572, 7, 6827, 1, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(1573, 7, 6826, 3, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(1574, 7, 6823, 2, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(1575, 7, 6821, 3, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(1576, 7, 6818, 1, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(1577, 7, 6817, 1, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(1578, 7, 6816, 1, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(1579, 7, 6815, 4, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(1580, 7, 6811, 2, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(1581, 7, 6809, 2, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(1582, 7, 6807, 1, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(1583, 7, 6806, 3, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(1584, 7, 6803, 3, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(1585, 7, 6800, 3, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(1586, 7, 6797, 4, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(1587, 7, 6793, 4, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(1588, 7, 6789, 2, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(1589, 7, 6787, 4, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(1590, 7, 6783, 4, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(1591, 7, 6779, 4, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(1592, 7, 6775, 1, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(1593, 7, 6774, 2, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(1594, 7, 6772, 2, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(1595, 7, 6770, 3, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(1596, 7, 6767, 2, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(1597, 7, 6765, 2, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(1598, 7, 6763, 1, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(1599, 7, 6762, 1, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(1600, 7, 6761, 1, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(1601, 7, 6760, 4, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(1602, 7, 6756, 1, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(1603, 7, 6755, 4, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(1604, 7, 6751, 3, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(1605, 7, 6748, 4, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(1606, 7, 6744, 3, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(1607, 7, 6741, 1, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(1608, 7, 6740, 2, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(1609, 7, 6738, 4, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(1610, 7, 6734, 4, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(1611, 7, 6730, 2, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(1612, 7, 6728, 1, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(1613, 7, 6727, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(1614, 7, 6723, 2, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(1615, 7, 6721, 3, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(1616, 7, 6718, 2, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(1617, 7, 6716, 2, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(1618, 7, 6714, 3, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(1619, 7, 6711, 2, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(1620, 7, 6709, 3, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(1621, 7, 6706, 3, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(1622, 7, 6703, 1, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(1623, 7, 6702, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(1624, 7, 6701, 1, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(1625, 7, 6700, 4, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(1626, 7, 6696, 3, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(1627, 7, 6693, 4, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(1628, 7, 6689, 4, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(1629, 7, 6685, 3, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(1630, 7, 6682, 3, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(1631, 7, 6679, 1, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(1632, 7, 6678, 1, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(1633, 7, 6677, 3, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(1634, 7, 6674, 3, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(1635, 7, 6671, 1, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(1636, 7, 6670, 4, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(1637, 7, 6666, 3, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(1638, 7, 6663, 2, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(1639, 7, 6661, 3, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(1640, 7, 6658, 4, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(1641, 7, 6654, 4, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(1642, 7, 6650, 2, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(1643, 7, 6648, 4, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(1644, 7, 6644, 4, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(1645, 7, 6640, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(1646, 7, 6637, 1, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(1647, 7, 6636, 2, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(1648, 7, 6634, 2, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(1649, 7, 6632, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(1650, 7, 6630, 2, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(1651, 7, 6628, 3, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(1652, 7, 6625, 2, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(1653, 7, 6623, 2, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(1654, 7, 6621, 4, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(1655, 7, 6617, 2, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(1656, 7, 6615, 2, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(1657, 7, 6613, 2, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(1658, 7, 6611, 1, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(1659, 7, 6610, 1, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(1660, 7, 6609, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(1661, 7, 6605, 1, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(1662, 7, 6604, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(1663, 7, 6602, 2, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(1664, 7, 6600, 2, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(1665, 7, 6598, 2, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(1666, 7, 6596, 3, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(1667, 7, 6593, 1, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(1668, 7, 6592, 2, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(1669, 7, 6590, 2, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(1670, 7, 6588, 3, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(1671, 7, 6585, 3, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(1672, 7, 6582, 1, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(1673, 7, 6581, 4, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(1674, 7, 6577, 1, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(1675, 7, 6576, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(1676, 7, 6575, 4, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(1677, 7, 6571, 3, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(1678, 7, 6568, 2, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(1679, 7, 6566, 3, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(1680, 7, 6563, 1, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(1681, 7, 6562, 3, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(1682, 7, 6559, 2, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(1683, 7, 6557, 4, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(1684, 7, 6553, 3, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(1685, 7, 6550, 4, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(1686, 7, 6546, 3, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(1687, 7, 6543, 1, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(1688, 7, 6542, 3, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(1689, 7, 6539, 3, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(1690, 7, 6536, 1, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(1691, 7, 6535, 1, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(1692, 7, 6534, 3, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(1693, 7, 6531, 3, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(1694, 7, 6528, 4, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(1695, 7, 6524, 3, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(1696, 7, 6521, 1, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(1697, 7, 6520, 4, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(1698, 7, 6516, 4, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(1699, 7, 6512, 4, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(1700, 7, 6508, 1, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(1701, 7, 6507, 2, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(1702, 7, 6505, 2, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(1703, 7, 6503, 4, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(1704, 7, 6499, 3, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(1705, 7, 6496, 3, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(1706, 7, 6493, 2, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(1707, 7, 6491, 1, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(1708, 7, 6490, 4, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(1709, 7, 6486, 4, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(1710, 7, 6482, 4, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(1711, 7, 6478, 1, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(1712, 7, 6477, 3, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(1713, 7, 6474, 2, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(1714, 7, 6472, 2, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(1715, 7, 6470, 3, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(1716, 7, 6467, 2, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(1717, 7, 6465, 2, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(1718, 7, 6463, 3, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(1719, 7, 6460, 1, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(1720, 7, 6459, 4, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(1721, 7, 6455, 1, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(1722, 7, 6454, 4, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(1723, 7, 6450, 2, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(1724, 7, 6448, 4, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(1725, 7, 6444, 2, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(1726, 7, 6442, 3, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(1727, 7, 6439, 2, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(1728, 7, 6437, 1, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(1729, 7, 6436, 3, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(1730, 7, 6433, 1, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(1731, 7, 6432, 3, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(1732, 7, 6429, 4, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(1733, 7, 6425, 3, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(1734, 7, 6422, 4, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(1735, 7, 6418, 2, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(1736, 7, 6416, 2, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(1737, 7, 6414, 2, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(1738, 7, 6412, 3, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(1739, 7, 6409, 4, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(1740, 7, 6405, 4, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(1741, 7, 6401, 2, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(1742, 7, 6399, 1, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(1743, 7, 6398, 2, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(1744, 7, 6396, 1, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(1745, 7, 6395, 2, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(1746, 7, 6393, 4, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(1747, 7, 6389, 3, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(1748, 7, 6386, 4, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(1749, 7, 6382, 3, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(1750, 7, 6379, 1, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(1751, 8, 7120, 4, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(1752, 8, 7116, 1, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(1753, 8, 7115, 4, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(1754, 8, 7111, 4, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(1755, 8, 7107, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(1756, 8, 7104, 1, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(1757, 8, 7103, 2, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(1758, 8, 7101, 2, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(1759, 8, 7099, 1, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(1760, 8, 7098, 4, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(1761, 8, 7094, 2, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(1762, 8, 7092, 2, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(1763, 8, 7090, 1, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(1764, 8, 7089, 4, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(1765, 8, 7085, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(1766, 8, 7082, 3, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(1767, 8, 7079, 1, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(1768, 8, 7078, 4, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(1769, 8, 7074, 4, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(1770, 8, 7070, 3, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(1771, 8, 7067, 3, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(1772, 8, 7064, 1, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(1773, 8, 7063, 2, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(1774, 8, 7061, 1, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(1775, 8, 7060, 3, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(1776, 8, 7057, 4, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(1777, 8, 7053, 4, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(1778, 8, 7049, 1, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(1779, 8, 7048, 3, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(1780, 8, 7045, 3, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(1781, 8, 7042, 3, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(1782, 8, 7039, 1, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(1783, 8, 7038, 1, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(1784, 8, 7037, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(1785, 8, 7036, 1, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(1786, 8, 7035, 2, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(1787, 8, 7033, 2, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(1788, 8, 7031, 4, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(1789, 8, 7027, 4, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(1790, 8, 7023, 4, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(1791, 8, 7019, 2, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(1792, 8, 7017, 2, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(1793, 8, 7015, 4, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(1794, 8, 7011, 4, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(1795, 8, 7007, 4, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(1796, 8, 7003, 2, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(1797, 8, 7001, 2, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(1798, 8, 6999, 2, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(1799, 8, 6997, 1, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(1800, 8, 6996, 3, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(1801, 8, 6993, 4, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(1802, 8, 6989, 2, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(1803, 8, 6987, 3, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(1804, 8, 6984, 4, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(1805, 8, 6980, 4, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(1806, 8, 6976, 3, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(1807, 8, 6973, 4, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(1808, 8, 6969, 2, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(1809, 8, 6967, 3, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(1810, 8, 6964, 4, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(1811, 8, 6960, 3, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(1812, 8, 6957, 2, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(1813, 8, 6955, 1, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(1814, 8, 6954, 1, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(1815, 8, 6953, 2, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(1816, 8, 6951, 1, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(1817, 8, 6950, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(1818, 8, 6947, 1, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(1819, 8, 6946, 3, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(1820, 8, 6943, 2, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(1821, 8, 6941, 4, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(1822, 8, 6937, 4, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(1823, 8, 6933, 3, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(1824, 8, 6930, 3, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(1825, 8, 6927, 4, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(1826, 8, 6923, 1, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(1827, 8, 6922, 4, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(1828, 8, 6918, 1, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(1829, 8, 6917, 3, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(1830, 8, 6914, 4, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(1831, 8, 6910, 2, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(1832, 8, 6908, 4, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(1833, 8, 6904, 1, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(1834, 8, 6903, 4, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(1835, 8, 6899, 1, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(1836, 8, 6898, 4, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(1837, 8, 6894, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(1838, 8, 6892, 4, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(1839, 8, 6888, 1, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(1840, 8, 6887, 2, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(1841, 8, 6885, 2, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(1842, 8, 6883, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(1843, 8, 6881, 2, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(1844, 8, 6879, 4, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(1845, 8, 6875, 1, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(1846, 8, 6874, 2, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(1847, 8, 6872, 3, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(1848, 8, 6869, 4, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(1849, 8, 6865, 4, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(1850, 8, 6861, 1, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(1851, 8, 6860, 1, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(1852, 8, 6859, 3, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(1853, 8, 6856, 4, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(1854, 8, 6852, 1, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(1855, 8, 6851, 4, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(1856, 8, 6847, 3, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(1857, 8, 6844, 2, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(1858, 8, 6842, 2, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(1859, 8, 6840, 2, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(1860, 8, 6838, 1, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(1861, 8, 6837, 1, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(1862, 8, 6836, 1, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(1863, 8, 6835, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(1864, 8, 6831, 2, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(1865, 8, 6829, 4, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(1866, 8, 6825, 3, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(1867, 8, 6822, 2, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(1868, 8, 6820, 3, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(1869, 8, 6817, 4, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(1870, 8, 6813, 2, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(1871, 8, 6811, 3, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(1872, 8, 6808, 1, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(1873, 8, 6807, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(1874, 8, 6806, 1, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(1875, 8, 6805, 1, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(1876, 8, 6804, 2, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(1877, 8, 6802, 3, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(1878, 8, 6799, 3, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(1879, 8, 6796, 3, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(1880, 8, 6793, 4, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(1881, 8, 6789, 4, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(1882, 8, 6785, 1, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(1883, 8, 6784, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(1884, 8, 6783, 4, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(1885, 8, 6779, 1, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(1886, 8, 6778, 2, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(1887, 8, 6776, 4, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(1888, 8, 6772, 4, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(1889, 8, 6768, 3, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(1890, 8, 6765, 3, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(1891, 8, 6762, 4, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(1892, 8, 6758, 3, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(1893, 8, 6755, 1, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(1894, 8, 6754, 2, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(1895, 8, 6752, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(1896, 8, 6749, 3, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(1897, 8, 6746, 3, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(1898, 8, 6743, 1, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(1899, 8, 6742, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(1900, 8, 6740, 4, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(1901, 8, 6736, 3, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(1902, 8, 6733, 2, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(1903, 8, 6731, 2, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(1904, 8, 6729, 1, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(1905, 8, 6728, 4, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(1906, 8, 6724, 1, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(1907, 8, 6723, 4, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(1908, 8, 6719, 3, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(1909, 8, 6716, 4, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(1910, 8, 6712, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(1911, 8, 6708, 4, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(1912, 8, 6704, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(1913, 8, 6702, 4, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(1914, 8, 6698, 1, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(1915, 8, 6697, 4, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(1916, 8, 6693, 2, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(1917, 8, 6691, 2, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(1918, 8, 6689, 1, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(1919, 8, 6688, 3, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(1920, 8, 6685, 2, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(1921, 8, 6683, 2, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(1922, 8, 6681, 3, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(1923, 8, 6678, 2, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(1924, 8, 6676, 2, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(1925, 8, 6674, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(1926, 8, 6673, 3, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(1927, 8, 6670, 3, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(1928, 8, 6667, 3, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(1929, 8, 6664, 4, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(1930, 8, 6660, 3, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(1931, 8, 6657, 4, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(1932, 8, 6653, 1, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(1933, 8, 6652, 1, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(1934, 8, 6651, 4, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(1935, 8, 6647, 4, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(1936, 8, 6643, 2, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(1937, 8, 6641, 4, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(1938, 8, 6637, 4, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(1939, 8, 6633, 2, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(1940, 8, 6631, 4, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(1941, 8, 6627, 3, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(1942, 8, 6624, 4, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(1943, 8, 6620, 1, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(1944, 8, 6619, 4, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(1945, 8, 6615, 1, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(1946, 8, 6614, 3, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(1947, 8, 6611, 3, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(1948, 8, 6608, 2, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(1949, 8, 6606, 2, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(1950, 8, 6604, 3, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(1951, 8, 6601, 1, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(1952, 8, 6600, 2, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(1953, 8, 6598, 1, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(1954, 8, 6597, 3, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(1955, 8, 6594, 2, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(1956, 8, 6592, 2, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(1957, 8, 6590, 3, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(1958, 8, 6587, 1, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(1959, 8, 6586, 4, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(1960, 8, 6582, 1, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(1961, 8, 6581, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(1962, 8, 6577, 4, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(1963, 8, 6573, 3, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(1964, 8, 6570, 3, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(1965, 8, 6567, 2, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(1966, 8, 6565, 4, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(1967, 8, 6561, 4, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(1968, 8, 6557, 3, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(1969, 8, 6554, 4, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(1970, 8, 6550, 4, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(1971, 8, 6546, 3, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(1972, 8, 6543, 2, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(1973, 8, 6541, 3, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(1974, 8, 6538, 1, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(1975, 8, 6537, 3, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(1976, 8, 6534, 2, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(1977, 8, 6532, 1, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(1978, 8, 6531, 2, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(1979, 8, 6529, 4, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(1980, 8, 6525, 4, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(1981, 8, 6521, 3, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(1982, 8, 6518, 4, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(1983, 8, 6514, 1, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(1984, 8, 6513, 3, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(1985, 8, 6510, 1, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(1986, 8, 6509, 1, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(1987, 8, 6508, 2, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(1988, 8, 6506, 3, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(1989, 8, 6503, 1, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(1990, 8, 6502, 4, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(1991, 8, 6498, 3, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(1992, 8, 6495, 4, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(1993, 8, 6491, 3, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(1994, 8, 6488, 3, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(1995, 8, 6485, 1, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(1996, 8, 6484, 2, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(1997, 8, 6482, 3, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(1998, 8, 6479, 2, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(1999, 8, 6477, 1, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(2000, 8, 6476, 1, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(2001, 9, 7120, 4, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(2002, 9, 7116, 1, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(2003, 9, 7115, 4, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(2004, 9, 7111, 1, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(2005, 9, 7110, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(2006, 9, 7107, 4, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(2007, 9, 7103, 4, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(2008, 9, 7099, 1, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(2009, 9, 7098, 2, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(2010, 9, 7096, 3, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(2011, 9, 7093, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(2012, 9, 7092, 3, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(2013, 9, 7089, 2, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(2014, 9, 7087, 2, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(2015, 9, 7085, 3, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(2016, 9, 7082, 1, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(2017, 9, 7081, 4, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(2018, 9, 7077, 2, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(2019, 9, 7075, 3, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(2020, 9, 7072, 2, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(2021, 9, 7070, 4, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(2022, 9, 7066, 3, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(2023, 9, 7063, 3, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(2024, 9, 7060, 4, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(2025, 9, 7056, 2, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(2026, 9, 7054, 3, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(2027, 9, 7051, 3, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(2028, 9, 7048, 2, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(2029, 9, 7046, 4, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(2030, 9, 7042, 1, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(2031, 9, 7041, 2, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(2032, 9, 7039, 4, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(2033, 9, 7035, 1, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(2034, 9, 7034, 2, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(2035, 9, 7032, 1, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(2036, 9, 7031, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(2037, 9, 7030, 2, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(2038, 9, 7028, 4, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(2039, 9, 7024, 1, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(2040, 9, 7023, 4, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(2041, 9, 7019, 4, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(2042, 9, 7015, 3, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(2043, 9, 7012, 2, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(2044, 9, 7010, 1, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(2045, 9, 7009, 3, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(2046, 9, 7006, 2, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(2047, 9, 7004, 2, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(2048, 9, 7002, 1, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(2049, 9, 7001, 1, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(2050, 9, 7000, 1, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(2051, 9, 6999, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(2052, 9, 6996, 2, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(2053, 9, 6994, 1, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(2054, 9, 6993, 3, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(2055, 9, 6990, 2, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(2056, 9, 6988, 2, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(2057, 9, 6986, 4, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(2058, 9, 6982, 1, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(2059, 9, 6981, 4, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(2060, 9, 6977, 2, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(2061, 9, 6975, 1, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(2062, 9, 6974, 1, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(2063, 9, 6973, 1, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(2064, 9, 6972, 3, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(2065, 9, 6969, 2, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(2066, 9, 6967, 1, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(2067, 9, 6966, 1, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(2068, 9, 6965, 3, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(2069, 9, 6962, 1, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(2070, 9, 6961, 3, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(2071, 9, 6958, 4, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(2072, 9, 6954, 4, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(2073, 9, 6950, 1, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(2074, 9, 6949, 2, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(2075, 9, 6947, 4, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(2076, 9, 6943, 3, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(2077, 9, 6940, 2, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(2078, 9, 6938, 4, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(2079, 9, 6934, 2, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(2080, 9, 6932, 1, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(2081, 9, 6931, 1, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(2082, 9, 6930, 2, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(2083, 9, 6928, 2, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(2084, 9, 6926, 2, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(2085, 9, 6924, 1, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(2086, 9, 6923, 3, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(2087, 9, 6920, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(2088, 9, 6918, 4, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(2089, 9, 6914, 2, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(2090, 9, 6912, 4, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(2091, 9, 6908, 4, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(2092, 9, 6904, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(2093, 9, 6902, 3, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(2094, 9, 6899, 2, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(2095, 9, 6897, 4, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(2096, 9, 6893, 4, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(2097, 9, 6889, 4, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(2098, 9, 6885, 4, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(2099, 9, 6881, 3, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(2100, 9, 6878, 4, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(2101, 9, 6874, 3, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(2102, 9, 6871, 2, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(2103, 9, 6869, 2, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(2104, 9, 6867, 1, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(2105, 9, 6866, 1, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(2106, 9, 6865, 2, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(2107, 9, 6863, 4, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(2108, 9, 6859, 3, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(2109, 9, 6856, 3, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(2110, 9, 6853, 4, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(2111, 9, 6849, 2, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(2112, 9, 6847, 1, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(2113, 9, 6846, 4, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(2114, 9, 6842, 4, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(2115, 9, 6838, 4, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(2116, 9, 6834, 1, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(2117, 9, 6833, 4, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(2118, 9, 6829, 2, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(2119, 9, 6827, 4, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(2120, 9, 6823, 1, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(2121, 9, 6822, 1, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(2122, 9, 6821, 1, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(2123, 9, 6820, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(2124, 9, 6819, 3, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(2125, 9, 6816, 3, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(2126, 9, 6813, 4, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(2127, 9, 6809, 1, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(2128, 9, 6808, 2, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(2129, 9, 6806, 3, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(2130, 9, 6803, 4, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(2131, 9, 6799, 2, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(2132, 9, 6797, 3, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(2133, 9, 6794, 2, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(2134, 9, 6792, 1, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(2135, 9, 6791, 3, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(2136, 9, 6788, 4, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(2137, 9, 6784, 2, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(2138, 9, 6782, 1, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(2139, 9, 6781, 3, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(2140, 9, 6778, 3, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(2141, 9, 6775, 4, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(2142, 9, 6771, 4, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(2143, 9, 6767, 2, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(2144, 9, 6765, 1, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(2145, 9, 6764, 3, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(2146, 9, 6761, 4, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(2147, 9, 6757, 1, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(2148, 9, 6756, 4, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(2149, 9, 6752, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(2150, 9, 6750, 4, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(2151, 9, 6746, 2, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(2152, 9, 6744, 4, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(2153, 9, 6740, 4, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(2154, 9, 6736, 1, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(2155, 9, 6735, 2, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(2156, 9, 6733, 1, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(2157, 9, 6732, 4, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(2158, 9, 6728, 4, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(2159, 9, 6724, 2, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(2160, 9, 6722, 1, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(2161, 9, 6721, 1, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(2162, 9, 6720, 3, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(2163, 9, 6717, 1, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(2164, 9, 6716, 4, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(2165, 9, 6712, 2, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(2166, 9, 6710, 3, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(2167, 9, 6707, 2, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(2168, 9, 6705, 3, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(2169, 9, 6702, 1, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(2170, 9, 6701, 4, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(2171, 9, 6697, 2, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(2172, 9, 6695, 2, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(2173, 9, 6693, 3, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(2174, 9, 6690, 3, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(2175, 9, 6687, 1, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(2176, 9, 6686, 1, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(2177, 9, 6685, 3, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(2178, 9, 6682, 2, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(2179, 9, 6680, 2, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(2180, 9, 6678, 1, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(2181, 9, 6677, 4, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(2182, 9, 6673, 4, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(2183, 9, 6669, 4, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(2184, 9, 6665, 2, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(2185, 9, 6663, 3, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(2186, 9, 6660, 1, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(2187, 9, 6659, 4, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(2188, 9, 6655, 2, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(2189, 9, 6653, 2, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(2190, 9, 6651, 2, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(2191, 9, 6649, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(2192, 9, 6647, 4, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(2193, 9, 6643, 3, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(2194, 9, 6640, 3, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(2195, 9, 6637, 1, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(2196, 9, 6636, 4, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(2197, 9, 6632, 2, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(2198, 9, 6630, 1, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(2199, 9, 6629, 1, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(2200, 9, 6628, 1, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(2201, 9, 6627, 2, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(2202, 9, 6625, 2, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(2203, 9, 6623, 2, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(2204, 9, 6621, 3, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(2205, 9, 6618, 2, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(2206, 9, 6616, 4, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(2207, 9, 6612, 3, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(2208, 9, 6609, 4, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(2209, 9, 6605, 3, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(2210, 9, 6602, 3, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(2211, 9, 6599, 1, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(2212, 9, 6598, 4, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(2213, 9, 6594, 1, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(2214, 9, 6593, 1, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(2215, 9, 6592, 4, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(2216, 9, 6588, 2, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(2217, 9, 6586, 4, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(2218, 9, 6582, 2, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(2219, 9, 6580, 3, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(2220, 9, 6577, 4, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(2221, 9, 6573, 2, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(2222, 9, 6571, 1, 500.00, 0.17, NULL, 5901, '2024-08-09 00:00:00'),
(2223, 9, 6570, 4, 500.00, 0.17, NULL, 5990, '2024-08-10 00:00:00'),
(2224, 9, 6566, 1, 500.00, 0.17, NULL, 5910, '2024-08-11 00:00:00'),
(2225, 9, 6565, 4, 500.00, 0.17, NULL, 6300, '2024-08-12 00:00:00'),
(2226, 9, 6561, 2, 500.00, 0.17, NULL, 5900, '2024-08-13 00:00:00'),
(2227, 9, 6559, 3, 500.00, 0.17, NULL, 6010, '2024-08-14 00:00:00'),
(2228, 9, 6556, 3, 500.00, 0.17, NULL, 5812, '2024-08-15 00:00:00'),
(2229, 9, 6553, 3, 500.00, 0.17, NULL, 6310, '2024-08-16 00:00:00'),
(2230, 9, 6550, 4, 500.00, 0.17, NULL, 6120, '2024-08-17 00:00:00'),
(2231, 9, 6546, 3, 500.00, 0.17, NULL, 6000, '2024-08-18 00:00:00'),
(2232, 9, 6543, 4, 500.00, 0.17, NULL, 5990, '2024-08-19 00:00:00'),
(2233, 9, 6539, 3, 500.00, 0.17, NULL, 5800, '2024-08-20 00:00:00'),
(2234, 9, 6536, 2, 500.00, 0.17, NULL, 5900, '2024-08-21 00:00:00'),
(2235, 9, 6534, 1, 500.00, 0.17, NULL, 6130, '2024-08-22 00:00:00'),
(2236, 9, 6533, 3, 500.00, 0.17, NULL, 6100, '2024-08-23 00:00:00'),
(2237, 9, 6530, 4, 500.00, 0.17, NULL, 6200, '2024-08-24 00:00:00'),
(2238, 9, 6526, 4, 500.00, 0.17, NULL, 6392, '2024-08-25 00:00:00'),
(2239, 9, 6522, 2, 500.00, 0.17, NULL, 5900, '2024-08-26 00:00:00'),
(2240, 9, 6520, 4, 500.00, 0.17, NULL, 6120, '2024-08-27 00:00:00'),
(2241, 9, 6516, 4, 500.00, 0.17, NULL, 6300, '2024-08-28 00:00:00'),
(2242, 9, 6512, 1, 500.00, 0.17, NULL, 6000, '2024-08-29 00:00:00'),
(2243, 9, 6511, 4, 500.00, 0.17, NULL, 6102, '2024-08-30 00:00:00'),
(2244, 9, 6507, 4, 500.00, 0.17, NULL, 6200, '2024-08-31 00:00:00'),
(2245, 9, 6503, 4, 500.00, 0.17, NULL, 6000, '2024-09-01 00:00:00'),
(2246, 9, 6499, 3, 500.00, 0.17, NULL, 6490, '2024-09-02 00:00:00');
INSERT INTO `controllote` (`idcontrollote`, `idlote`, `numaves`, `mortalidad`, `alimento`, `alimentoAve`, `produccion`, `cantHuevos`, `create_at`) VALUES
(2247, 9, 6496, 3, 500.00, 0.17, NULL, 6390, '2024-09-03 00:00:00'),
(2248, 9, 6493, 4, 500.00, 0.17, NULL, 6240, '2024-09-04 00:00:00'),
(2249, 9, 6489, 2, 500.00, 0.17, NULL, 6300, '2024-09-05 00:00:00'),
(2250, 9, 6487, 2, 500.00, 0.17, NULL, 6400, '2024-09-06 00:00:00'),
(2251, 10, 6120, 1, 500.00, 0.17, NULL, 2900, '2024-01-01 00:00:00'),
(2252, 10, 6119, 2, 500.00, 0.17, NULL, 2901, '2024-01-02 00:00:00'),
(2253, 10, 6117, 2, 500.00, 0.17, NULL, 2902, '2024-01-03 00:00:00'),
(2254, 10, 6115, 4, 500.00, 0.17, NULL, 2903, '2024-01-04 00:00:00'),
(2255, 10, 6111, 3, 500.00, 0.17, NULL, 2904, '2024-01-05 00:00:00'),
(2256, 10, 6108, 4, 500.00, 0.17, NULL, 2905, '2024-01-06 00:00:00'),
(2257, 10, 6104, 3, 500.00, 0.17, NULL, 2906, '2024-01-07 00:00:00'),
(2258, 10, 6101, 1, 500.00, 0.17, NULL, 2907, '2024-01-08 00:00:00'),
(2259, 10, 6100, 2, 500.00, 0.17, NULL, 2908, '2024-01-09 00:00:00'),
(2260, 10, 6098, 2, 500.00, 0.17, NULL, 2909, '2024-01-10 00:00:00'),
(2261, 10, 6096, 1, 500.00, 0.17, NULL, 2910, '2024-01-11 00:00:00'),
(2262, 10, 6095, 3, 500.00, 0.17, NULL, 2911, '2024-01-12 00:00:00'),
(2263, 10, 6092, 2, 500.00, 0.17, NULL, 2912, '2024-01-13 00:00:00'),
(2264, 10, 6090, 1, 500.00, 0.17, NULL, 2913, '2024-01-14 00:00:00'),
(2265, 10, 6089, 1, 500.00, 0.17, NULL, 2914, '2024-01-15 00:00:00'),
(2266, 10, 6088, 2, 500.00, 0.17, NULL, 2915, '2024-01-16 00:00:00'),
(2267, 10, 6086, 1, 500.00, 0.17, NULL, 2916, '2024-01-17 00:00:00'),
(2268, 10, 6085, 1, 500.00, 0.17, NULL, 2917, '2024-01-18 00:00:00'),
(2269, 10, 6084, 1, 500.00, 0.17, NULL, 2918, '2024-01-19 00:00:00'),
(2270, 10, 6083, 1, 500.00, 0.17, NULL, 2919, '2024-01-20 00:00:00'),
(2271, 10, 6082, 4, 500.00, 0.17, NULL, 2920, '2024-01-21 00:00:00'),
(2272, 10, 6078, 3, 500.00, 0.17, NULL, 2921, '2024-01-22 00:00:00'),
(2273, 10, 6075, 1, 500.00, 0.17, NULL, 2922, '2024-01-23 00:00:00'),
(2274, 10, 6074, 2, 500.00, 0.17, NULL, 2923, '2024-01-24 00:00:00'),
(2275, 10, 6072, 4, 500.00, 0.17, NULL, 2924, '2024-01-25 00:00:00'),
(2276, 10, 6068, 3, 500.00, 0.17, NULL, 2925, '2024-01-26 00:00:00'),
(2277, 10, 6065, 4, 500.00, 0.17, NULL, 2926, '2024-01-27 00:00:00'),
(2278, 10, 6061, 3, 500.00, 0.17, NULL, 2927, '2024-01-28 00:00:00'),
(2279, 10, 6058, 1, 500.00, 0.17, NULL, 2928, '2024-01-29 00:00:00'),
(2280, 10, 6057, 4, 500.00, 0.17, NULL, 2929, '2024-01-30 00:00:00'),
(2281, 10, 6053, 2, 500.00, 0.17, NULL, 2930, '2024-01-31 00:00:00'),
(2282, 10, 6051, 4, 500.00, 0.17, NULL, 2931, '2024-02-01 00:00:00'),
(2283, 10, 6047, 3, 500.00, 0.17, NULL, 2932, '2024-02-02 00:00:00'),
(2284, 10, 6044, 1, 500.00, 0.17, NULL, 2933, '2024-02-03 00:00:00'),
(2285, 10, 6043, 2, 500.00, 0.17, NULL, 2934, '2024-02-04 00:00:00'),
(2286, 10, 6041, 1, 500.00, 0.17, NULL, 2935, '2024-02-05 00:00:00'),
(2287, 10, 6040, 2, 500.00, 0.17, NULL, 2936, '2024-02-06 00:00:00'),
(2288, 10, 6038, 1, 500.00, 0.17, NULL, 2937, '2024-02-07 00:00:00'),
(2289, 10, 6037, 1, 500.00, 0.17, NULL, 2938, '2024-02-08 00:00:00'),
(2290, 10, 6036, 3, 500.00, 0.17, NULL, 2939, '2024-02-09 00:00:00'),
(2291, 10, 6033, 2, 500.00, 0.17, NULL, 2940, '2024-02-10 00:00:00'),
(2292, 10, 6031, 3, 500.00, 0.17, NULL, 2941, '2024-02-11 00:00:00'),
(2293, 10, 6028, 2, 500.00, 0.17, NULL, 2942, '2024-02-12 00:00:00'),
(2294, 10, 6026, 2, 500.00, 0.17, NULL, 2943, '2024-02-13 00:00:00'),
(2295, 10, 6024, 2, 500.00, 0.17, NULL, 2944, '2024-02-14 00:00:00'),
(2296, 10, 6022, 1, 500.00, 0.17, NULL, 2945, '2024-02-15 00:00:00'),
(2297, 10, 6021, 3, 500.00, 0.17, NULL, 2946, '2024-02-16 00:00:00'),
(2298, 10, 6018, 3, 500.00, 0.17, NULL, 2947, '2024-02-17 00:00:00'),
(2299, 10, 6015, 4, 500.00, 0.17, NULL, 2948, '2024-02-18 00:00:00'),
(2300, 10, 6011, 4, 500.00, 0.17, NULL, 2949, '2024-02-19 00:00:00'),
(2301, 10, 6007, 3, 500.00, 0.17, NULL, 2950, '2024-02-20 00:00:00'),
(2302, 10, 6004, 1, 500.00, 0.17, NULL, 2951, '2024-02-21 00:00:00'),
(2303, 10, 6003, 3, 500.00, 0.17, NULL, 2952, '2024-02-22 00:00:00'),
(2304, 10, 6000, 1, 500.00, 0.17, NULL, 2953, '2024-02-23 00:00:00'),
(2305, 10, 5999, 4, 500.00, 0.17, NULL, 2954, '2024-02-24 00:00:00'),
(2306, 10, 5995, 4, 500.00, 0.17, NULL, 2955, '2024-02-25 00:00:00'),
(2307, 10, 5991, 3, 500.00, 0.17, NULL, 2956, '2024-02-26 00:00:00'),
(2308, 10, 5988, 2, 500.00, 0.17, NULL, 2957, '2024-02-27 00:00:00'),
(2309, 10, 5986, 4, 500.00, 0.17, NULL, 2958, '2024-02-28 00:00:00'),
(2310, 10, 5982, 2, 500.00, 0.17, NULL, 2959, '2024-02-29 00:00:00'),
(2311, 10, 5980, 4, 500.00, 0.17, NULL, 2960, '2024-03-01 00:00:00'),
(2312, 10, 5976, 3, 500.00, 0.17, NULL, 2961, '2024-03-02 00:00:00'),
(2313, 10, 5973, 2, 500.00, 0.17, NULL, 2962, '2024-03-03 00:00:00'),
(2314, 10, 5971, 2, 500.00, 0.17, NULL, 2963, '2024-03-04 00:00:00'),
(2315, 10, 5969, 2, 500.00, 0.17, NULL, 2964, '2024-03-05 00:00:00'),
(2316, 10, 5967, 2, 500.00, 0.17, NULL, 2965, '2024-03-06 00:00:00'),
(2317, 10, 5965, 3, 500.00, 0.17, NULL, 2966, '2024-03-07 00:00:00'),
(2318, 10, 5962, 2, 500.00, 0.17, NULL, 2967, '2024-03-08 00:00:00'),
(2319, 10, 5960, 2, 500.00, 0.17, NULL, 2968, '2024-03-09 00:00:00'),
(2320, 10, 5958, 3, 500.00, 0.17, NULL, 2969, '2024-03-10 00:00:00'),
(2321, 10, 5955, 2, 500.00, 0.17, NULL, 2970, '2024-03-11 00:00:00'),
(2322, 10, 5953, 1, 500.00, 0.17, NULL, 2971, '2024-03-12 00:00:00'),
(2323, 10, 5952, 3, 500.00, 0.17, NULL, 2972, '2024-03-13 00:00:00'),
(2324, 10, 5949, 1, 500.00, 0.17, NULL, 2973, '2024-03-14 00:00:00'),
(2325, 10, 5948, 2, 500.00, 0.17, NULL, 2974, '2024-03-15 00:00:00'),
(2326, 10, 5946, 3, 500.00, 0.17, NULL, 2975, '2024-03-16 00:00:00'),
(2327, 10, 5943, 2, 500.00, 0.17, NULL, 2976, '2024-03-17 00:00:00'),
(2328, 10, 5941, 4, 500.00, 0.17, NULL, 2977, '2024-03-18 00:00:00'),
(2329, 10, 5937, 3, 500.00, 0.17, NULL, 2978, '2024-03-19 00:00:00'),
(2330, 10, 5934, 2, 500.00, 0.17, NULL, 2979, '2024-03-20 00:00:00'),
(2331, 10, 5932, 4, 500.00, 0.17, NULL, 2980, '2024-03-21 00:00:00'),
(2332, 10, 5928, 2, 500.00, 0.17, NULL, 2981, '2024-03-22 00:00:00'),
(2333, 10, 5926, 1, 500.00, 0.17, NULL, 2982, '2024-03-23 00:00:00'),
(2334, 10, 5925, 4, 500.00, 0.17, NULL, 2983, '2024-03-24 00:00:00'),
(2335, 10, 5921, 4, 500.00, 0.17, NULL, 2984, '2024-03-25 00:00:00'),
(2336, 10, 5917, 1, 500.00, 0.17, NULL, 2985, '2024-03-26 00:00:00'),
(2337, 10, 5916, 2, 500.00, 0.17, NULL, 2986, '2024-03-27 00:00:00'),
(2338, 10, 5914, 3, 500.00, 0.17, NULL, 2987, '2024-03-28 00:00:00'),
(2339, 10, 5911, 1, 500.00, 0.17, NULL, 2988, '2024-03-29 00:00:00'),
(2340, 10, 5910, 4, 500.00, 0.17, NULL, 2989, '2024-03-30 00:00:00'),
(2341, 10, 5906, 2, 500.00, 0.17, NULL, 2990, '2024-03-31 00:00:00'),
(2342, 10, 5904, 2, 500.00, 0.17, NULL, 2991, '2024-04-01 00:00:00'),
(2343, 10, 5902, 4, 500.00, 0.17, NULL, 2992, '2024-04-02 00:00:00'),
(2344, 10, 5898, 4, 500.00, 0.17, NULL, 2993, '2024-04-03 00:00:00'),
(2345, 10, 5894, 4, 500.00, 0.17, NULL, 2994, '2024-04-04 00:00:00'),
(2346, 10, 5890, 4, 500.00, 0.17, NULL, 2995, '2024-04-05 00:00:00'),
(2347, 10, 5886, 3, 500.00, 0.17, NULL, 2996, '2024-04-06 00:00:00'),
(2348, 10, 5883, 2, 500.00, 0.17, NULL, 2997, '2024-04-07 00:00:00'),
(2349, 10, 5881, 3, 500.00, 0.17, NULL, 2998, '2024-04-08 00:00:00'),
(2350, 10, 5878, 3, 500.00, 0.17, NULL, 2999, '2024-04-09 00:00:00'),
(2351, 10, 5875, 3, 500.00, 0.17, NULL, 3000, '2024-04-10 00:00:00'),
(2352, 10, 5872, 1, 500.00, 0.17, NULL, 3001, '2024-04-11 00:00:00'),
(2353, 10, 5871, 3, 500.00, 0.17, NULL, 3002, '2024-04-12 00:00:00'),
(2354, 10, 5868, 3, 500.00, 0.17, NULL, 3003, '2024-04-13 00:00:00'),
(2355, 10, 5865, 4, 500.00, 0.17, NULL, 3004, '2024-04-14 00:00:00'),
(2356, 10, 5861, 2, 500.00, 0.17, NULL, 3005, '2024-04-15 00:00:00'),
(2357, 10, 5859, 3, 500.00, 0.17, NULL, 3006, '2024-04-16 00:00:00'),
(2358, 10, 5856, 2, 500.00, 0.17, NULL, 3007, '2024-04-17 00:00:00'),
(2359, 10, 5854, 4, 500.00, 0.17, NULL, 3008, '2024-04-18 00:00:00'),
(2360, 10, 5850, 3, 500.00, 0.17, NULL, 3009, '2024-04-19 00:00:00'),
(2361, 10, 5847, 4, 500.00, 0.17, NULL, 3010, '2024-04-20 00:00:00'),
(2362, 10, 5843, 3, 500.00, 0.17, NULL, 3011, '2024-04-21 00:00:00'),
(2363, 10, 5840, 1, 500.00, 0.17, NULL, 3012, '2024-04-22 00:00:00'),
(2364, 10, 5839, 4, 500.00, 0.17, NULL, 3013, '2024-04-23 00:00:00'),
(2365, 10, 5835, 4, 500.00, 0.17, NULL, 3014, '2024-04-24 00:00:00'),
(2366, 10, 5831, 2, 500.00, 0.17, NULL, 3015, '2024-04-25 00:00:00'),
(2367, 10, 5829, 2, 500.00, 0.17, NULL, 3016, '2024-04-26 00:00:00'),
(2368, 10, 5827, 4, 500.00, 0.17, NULL, 3017, '2024-04-27 00:00:00'),
(2369, 10, 5823, 2, 500.00, 0.17, NULL, 3018, '2024-04-28 00:00:00'),
(2370, 10, 5821, 1, 500.00, 0.17, NULL, 3019, '2024-04-29 00:00:00'),
(2371, 10, 5820, 2, 500.00, 0.17, NULL, 3020, '2024-04-30 00:00:00'),
(2372, 10, 5818, 3, 500.00, 0.17, NULL, 3021, '2024-05-01 00:00:00'),
(2373, 10, 5815, 1, 500.00, 0.17, NULL, 3022, '2024-05-02 00:00:00'),
(2374, 10, 5814, 3, 500.00, 0.17, NULL, 3023, '2024-05-03 00:00:00'),
(2375, 10, 5811, 4, 500.00, 0.17, NULL, 3024, '2024-05-04 00:00:00'),
(2376, 10, 5807, 3, 500.00, 0.17, NULL, 3025, '2024-05-05 00:00:00'),
(2377, 10, 5804, 2, 500.00, 0.17, NULL, 3026, '2024-05-06 00:00:00'),
(2378, 10, 5802, 4, 500.00, 0.17, NULL, 3027, '2024-05-07 00:00:00'),
(2379, 10, 5798, 4, 500.00, 0.17, NULL, 3028, '2024-05-08 00:00:00'),
(2380, 10, 5794, 2, 500.00, 0.17, NULL, 3029, '2024-05-09 00:00:00'),
(2381, 10, 5792, 3, 500.00, 0.17, NULL, 3030, '2024-05-10 00:00:00'),
(2382, 10, 5789, 4, 500.00, 0.17, NULL, 3031, '2024-05-11 00:00:00'),
(2383, 10, 5785, 1, 500.00, 0.17, NULL, 3032, '2024-05-12 00:00:00'),
(2384, 10, 5784, 1, 500.00, 0.17, NULL, 3033, '2024-05-13 00:00:00'),
(2385, 10, 5783, 3, 500.00, 0.17, NULL, 3034, '2024-05-14 00:00:00'),
(2386, 10, 5780, 4, 500.00, 0.17, NULL, 3035, '2024-05-15 00:00:00'),
(2387, 10, 5776, 1, 500.00, 0.17, NULL, 3036, '2024-05-16 00:00:00'),
(2388, 10, 5775, 2, 500.00, 0.17, NULL, 3037, '2024-05-17 00:00:00'),
(2389, 10, 5773, 3, 500.00, 0.17, NULL, 3038, '2024-05-18 00:00:00'),
(2390, 10, 5770, 4, 500.00, 0.17, NULL, 3039, '2024-05-19 00:00:00'),
(2391, 10, 5766, 2, 500.00, 0.17, NULL, 3040, '2024-05-20 00:00:00'),
(2392, 10, 5764, 1, 500.00, 0.17, NULL, 3041, '2024-05-21 00:00:00'),
(2393, 10, 5763, 2, 500.00, 0.17, NULL, 3042, '2024-05-22 00:00:00'),
(2394, 10, 5761, 4, 500.00, 0.17, NULL, 3043, '2024-05-23 00:00:00'),
(2395, 10, 5757, 2, 500.00, 0.17, NULL, 3044, '2024-05-24 00:00:00'),
(2396, 10, 5755, 3, 500.00, 0.17, NULL, 3045, '2024-05-25 00:00:00'),
(2397, 10, 5752, 4, 500.00, 0.17, NULL, 3046, '2024-05-26 00:00:00'),
(2398, 10, 5748, 2, 500.00, 0.17, NULL, 3047, '2024-05-27 00:00:00'),
(2399, 10, 5746, 2, 500.00, 0.17, NULL, 3048, '2024-05-28 00:00:00'),
(2400, 10, 5744, 3, 500.00, 0.17, NULL, 3049, '2024-05-29 00:00:00'),
(2401, 10, 5741, 4, 500.00, 0.17, NULL, 3050, '2024-05-30 00:00:00'),
(2402, 10, 5737, 1, 500.00, 0.17, NULL, 3051, '2024-05-31 00:00:00'),
(2403, 10, 5736, 1, 500.00, 0.17, NULL, 3052, '2024-06-01 00:00:00'),
(2404, 10, 5735, 3, 500.00, 0.17, NULL, 3053, '2024-06-02 00:00:00'),
(2405, 10, 5732, 4, 500.00, 0.17, NULL, 3054, '2024-06-03 00:00:00'),
(2406, 10, 5728, 4, 500.00, 0.17, NULL, 3055, '2024-06-04 00:00:00'),
(2407, 10, 5724, 4, 500.00, 0.17, NULL, 3056, '2024-06-05 00:00:00'),
(2408, 10, 5720, 3, 500.00, 0.17, NULL, 3057, '2024-06-06 00:00:00'),
(2409, 10, 5717, 1, 500.00, 0.17, NULL, 3058, '2024-06-07 00:00:00'),
(2410, 10, 5716, 4, 500.00, 0.17, NULL, 3059, '2024-06-08 00:00:00'),
(2411, 10, 5712, 2, 500.00, 0.17, NULL, 3060, '2024-06-09 00:00:00'),
(2412, 10, 5710, 2, 500.00, 0.17, NULL, 3061, '2024-06-10 00:00:00'),
(2413, 10, 5708, 4, 500.00, 0.17, NULL, 3062, '2024-06-11 00:00:00'),
(2414, 10, 5704, 3, 500.00, 0.17, NULL, 3063, '2024-06-12 00:00:00'),
(2415, 10, 5701, 4, 500.00, 0.17, NULL, 3064, '2024-06-13 00:00:00'),
(2416, 10, 5697, 2, 500.00, 0.17, NULL, 3065, '2024-06-14 00:00:00'),
(2417, 10, 5695, 2, 500.00, 0.17, NULL, 3066, '2024-06-15 00:00:00'),
(2418, 10, 5693, 4, 500.00, 0.17, NULL, 3067, '2024-06-16 00:00:00'),
(2419, 10, 5689, 3, 500.00, 0.17, NULL, 3068, '2024-06-17 00:00:00'),
(2420, 10, 5686, 2, 500.00, 0.17, NULL, 3069, '2024-06-18 00:00:00'),
(2421, 10, 5684, 3, 500.00, 0.17, NULL, 3070, '2024-06-19 00:00:00'),
(2422, 10, 5681, 2, 500.00, 0.17, NULL, 3071, '2024-06-20 00:00:00'),
(2423, 10, 5679, 3, 500.00, 0.17, NULL, 3072, '2024-06-21 00:00:00'),
(2424, 10, 5676, 4, 500.00, 0.17, NULL, 3073, '2024-06-22 00:00:00'),
(2425, 10, 5672, 4, 500.00, 0.17, NULL, 3074, '2024-06-23 00:00:00'),
(2426, 10, 5668, 4, 500.00, 0.17, NULL, 3075, '2024-06-24 00:00:00'),
(2427, 10, 5664, 1, 500.00, 0.17, NULL, 3076, '2024-06-25 00:00:00'),
(2428, 10, 5663, 2, 500.00, 0.17, NULL, 3077, '2024-06-26 00:00:00'),
(2429, 10, 5661, 3, 500.00, 0.17, NULL, 3078, '2024-06-27 00:00:00'),
(2430, 10, 5658, 1, 500.00, 0.17, NULL, 3079, '2024-06-28 00:00:00'),
(2431, 10, 5657, 2, 500.00, 0.17, NULL, 3080, '2024-06-29 00:00:00'),
(2432, 10, 5655, 4, 500.00, 0.17, NULL, 3081, '2024-06-30 00:00:00'),
(2433, 10, 5651, 2, 500.00, 0.17, NULL, 3082, '2024-07-01 00:00:00'),
(2434, 10, 5649, 3, 500.00, 0.17, NULL, 3083, '2024-07-02 00:00:00'),
(2435, 10, 5646, 4, 500.00, 0.17, NULL, 3084, '2024-07-03 00:00:00'),
(2436, 10, 5642, 4, 500.00, 0.17, NULL, 3085, '2024-07-04 00:00:00'),
(2437, 10, 5638, 4, 500.00, 0.17, NULL, 3086, '2024-07-05 00:00:00'),
(2438, 10, 5634, 3, 500.00, 0.17, NULL, 3087, '2024-07-06 00:00:00'),
(2439, 10, 5631, 3, 500.00, 0.17, NULL, 3088, '2024-07-07 00:00:00'),
(2440, 10, 5628, 1, 500.00, 0.17, NULL, 3089, '2024-07-08 00:00:00'),
(2441, 10, 5627, 2, 500.00, 0.17, NULL, 3090, '2024-07-09 00:00:00'),
(2442, 10, 5625, 1, 500.00, 0.17, NULL, 3091, '2024-07-10 00:00:00'),
(2443, 10, 5624, 2, 500.00, 0.17, NULL, 3092, '2024-07-11 00:00:00'),
(2444, 10, 5622, 3, 500.00, 0.17, NULL, 3093, '2024-07-12 00:00:00'),
(2445, 10, 5619, 4, 500.00, 0.17, NULL, 3094, '2024-07-13 00:00:00'),
(2446, 10, 5615, 1, 500.00, 0.17, NULL, 3095, '2024-07-14 00:00:00'),
(2447, 10, 5614, 2, 500.00, 0.17, NULL, 3096, '2024-07-15 00:00:00'),
(2448, 10, 5612, 1, 500.00, 0.17, NULL, 3097, '2024-07-16 00:00:00'),
(2449, 10, 5611, 3, 500.00, 0.17, NULL, 3098, '2024-07-17 00:00:00'),
(2450, 10, 5608, 1, 500.00, 0.17, NULL, 3099, '2024-07-18 00:00:00'),
(2451, 10, 5607, 3, 500.00, 0.17, NULL, 3100, '2024-07-19 00:00:00'),
(2452, 10, 5604, 3, 500.00, 0.17, NULL, 3101, '2024-07-20 00:00:00'),
(2453, 10, 5601, 2, 500.00, 0.17, NULL, 3102, '2024-07-21 00:00:00'),
(2454, 10, 5599, 3, 500.00, 0.17, NULL, 3103, '2024-07-22 00:00:00'),
(2455, 10, 5596, 4, 500.00, 0.17, NULL, 3104, '2024-07-23 00:00:00'),
(2456, 10, 5592, 4, 500.00, 0.17, NULL, 3105, '2024-07-24 00:00:00'),
(2457, 10, 5588, 4, 500.00, 0.17, NULL, 3106, '2024-07-25 00:00:00'),
(2458, 10, 5584, 2, 500.00, 0.17, NULL, 3107, '2024-07-26 00:00:00'),
(2459, 10, 5582, 1, 500.00, 0.17, NULL, 3108, '2024-07-27 00:00:00'),
(2460, 10, 5581, 4, 500.00, 0.17, NULL, 3109, '2024-07-28 00:00:00'),
(2461, 10, 5577, 4, 500.00, 0.17, NULL, 3110, '2024-07-29 00:00:00'),
(2462, 10, 5573, 3, 500.00, 0.17, NULL, 3111, '2024-07-30 00:00:00'),
(2463, 10, 5570, 3, 500.00, 0.17, NULL, 3112, '2024-07-31 00:00:00'),
(2464, 10, 5567, 1, 500.00, 0.17, NULL, 3113, '2024-08-01 00:00:00'),
(2465, 10, 5566, 4, 500.00, 0.17, NULL, 3114, '2024-08-02 00:00:00'),
(2466, 10, 5562, 4, 500.00, 0.17, NULL, 3115, '2024-08-03 00:00:00'),
(2467, 10, 5558, 3, 500.00, 0.17, NULL, 3116, '2024-08-04 00:00:00'),
(2468, 10, 5555, 3, 500.00, 0.17, NULL, 3117, '2024-08-05 00:00:00'),
(2469, 10, 5552, 2, 500.00, 0.17, NULL, 3118, '2024-08-06 00:00:00'),
(2470, 10, 5550, 4, 500.00, 0.17, NULL, 3119, '2024-08-07 00:00:00'),
(2471, 10, 5546, 4, 500.00, 0.17, NULL, 3120, '2024-08-08 00:00:00'),
(2472, 10, 5542, 1, 500.00, 0.17, NULL, 3121, '2024-08-09 00:00:00'),
(2473, 10, 5541, 2, 500.00, 0.17, NULL, 3122, '2024-08-10 00:00:00'),
(2474, 10, 5539, 4, 500.00, 0.17, NULL, 3123, '2024-08-11 00:00:00'),
(2475, 10, 5535, 3, 500.00, 0.17, NULL, 3124, '2024-08-12 00:00:00'),
(2476, 10, 5532, 4, 500.00, 0.17, NULL, 3125, '2024-08-13 00:00:00'),
(2477, 10, 5528, 3, 500.00, 0.17, NULL, 3126, '2024-08-14 00:00:00'),
(2478, 10, 5525, 3, 500.00, 0.17, NULL, 3127, '2024-08-15 00:00:00'),
(2479, 10, 5522, 1, 500.00, 0.17, NULL, 3128, '2024-08-16 00:00:00'),
(2480, 10, 5521, 1, 500.00, 0.17, NULL, 3129, '2024-08-17 00:00:00'),
(2481, 10, 5520, 1, 500.00, 0.17, NULL, 3130, '2024-08-18 00:00:00'),
(2482, 10, 5519, 2, 500.00, 0.17, NULL, 3131, '2024-08-19 00:00:00'),
(2483, 10, 5517, 4, 500.00, 0.17, NULL, 3132, '2024-08-20 00:00:00'),
(2484, 10, 5513, 4, 500.00, 0.17, NULL, 3133, '2024-08-21 00:00:00'),
(2485, 10, 5509, 3, 500.00, 0.17, NULL, 3134, '2024-08-22 00:00:00'),
(2486, 10, 5506, 4, 500.00, 0.17, NULL, 3135, '2024-08-23 00:00:00'),
(2487, 10, 5502, 1, 500.00, 0.17, NULL, 3136, '2024-08-24 00:00:00'),
(2488, 10, 5501, 1, 500.00, 0.17, NULL, 3137, '2024-08-25 00:00:00'),
(2489, 10, 5500, 1, 500.00, 0.17, NULL, 3138, '2024-08-26 00:00:00'),
(2490, 10, 5499, 3, 500.00, 0.17, NULL, 3139, '2024-08-27 00:00:00'),
(2491, 10, 5496, 1, 500.00, 0.17, NULL, 3140, '2024-08-28 00:00:00'),
(2492, 10, 5495, 3, 500.00, 0.17, NULL, 3141, '2024-08-29 00:00:00'),
(2493, 10, 5492, 2, 500.00, 0.17, NULL, 3142, '2024-08-30 00:00:00'),
(2494, 10, 5490, 1, 500.00, 0.17, NULL, 3143, '2024-08-31 00:00:00'),
(2495, 10, 5489, 1, 500.00, 0.17, NULL, 3144, '2024-09-01 00:00:00'),
(2496, 10, 5488, 1, 500.00, 0.17, NULL, 3145, '2024-09-02 00:00:00'),
(2497, 10, 5487, 2, 500.00, 0.17, NULL, 3146, '2024-09-03 00:00:00'),
(2498, 10, 5485, 1, 500.00, 0.17, NULL, 3147, '2024-09-04 00:00:00'),
(2499, 10, 5484, 1, 500.00, 0.17, NULL, 3148, '2024-09-05 00:00:00'),
(2500, 10, 5483, 1, 500.00, 0.17, NULL, 3149, '2024-09-06 00:00:00'),
(2501, 9, 6484, 3, 800.00, 123.32, NULL, 6400, '2024-11-15 10:57:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `iddetalleventa` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idhuevo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `PesoTotal` decimal(6,2) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `detalleventas`
--
DELIMITER $$
CREATE TRIGGER `trg_actualizar_precioVenta` AFTER INSERT ON `detalleventas` FOR EACH ROW BEGIN
    DECLARE _PrecioVenta DECIMAL(10, 2);

    -- Calcular la suma de precioTotal para el idventa correspondiente
    SELECT SUM(precioTotal) INTO _PrecioVenta
    FROM detalleventas
    WHERE idventa = NEW.idventa;

    -- Actualizar la columna PrecioVenta en la tabla ventas
    UPDATE ventas SET PrecioVenta = _PrecioVenta WHERE idventa = NEW.idventa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexalmhuevo`
--

CREATE TABLE `kardexalmhuevo` (
  `idAlmacenHuevos` int(11) NOT NULL,
  `idcolaborador` int(11) NOT NULL,
  `idhuevo` int(11) NOT NULL,
  `tipomovimiento` char(1) NOT NULL,
  `motivomovimiento` varchar(100) NOT NULL,
  `idlote` int(11) DEFAULT NULL,
  `stockProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `creado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kardexalmhuevo`
--

INSERT INTO `kardexalmhuevo` (`idAlmacenHuevos`, `idcolaborador`, `idhuevo`, `tipomovimiento`, `motivomovimiento`, `idlote`, `stockProducto`, `cantidad`, `descripcion`, `creado`) VALUES
(1, 1, 1, 'S', 'Movimiento de prueba 1', 1, 988, 56, 'Movimiento de prueba', '2017-03-07 00:00:00'),
(2, 1, 2, 'E', 'Movimiento de prueba 2', 1, 963, 25, 'Movimiento de prueba', '2018-01-19 00:00:00'),
(3, 1, 3, 'E', 'Movimiento de prueba 3', 1, 941, 57, 'Movimiento de prueba', '2017-10-06 00:00:00'),
(4, 1, 4, 'E', 'Movimiento de prueba 4', 1, 914, 25, 'Movimiento de prueba', '2017-05-08 00:00:00'),
(5, 1, 5, 'E', 'Movimiento de prueba 5', 1, 905, 51, 'Movimiento de prueba', '2018-05-24 00:00:00'),
(6, 1, 2, 'S', 'Movimiento de prueba 6', 1, 930, 39, 'Movimiento de prueba', '2017-04-06 00:00:00'),
(7, 1, 4, 'S', 'Movimiento de prueba 7', 1, 989, 23, 'Movimiento de prueba', '2018-01-16 00:00:00'),
(8, 1, 4, 'S', 'Movimiento de prueba 8', 1, 980, 24, 'Movimiento de prueba', '2017-03-08 00:00:00'),
(9, 1, 2, 'E', 'Movimiento de prueba 9', 1, 952, 36, 'Movimiento de prueba', '2017-03-24 00:00:00'),
(10, 1, 5, 'E', 'Movimiento de prueba 10', 1, 911, 53, 'Movimiento de prueba', '2017-03-09 00:00:00'),
(11, 1, 3, 'E', 'Movimiento de prueba 11', 1, 934, 42, 'Movimiento de prueba', '2017-06-09 00:00:00'),
(12, 1, 1, 'S', 'Movimiento de prueba 12', 1, 931, 49, 'Movimiento de prueba', '2018-06-05 00:00:00'),
(13, 1, 4, 'S', 'Movimiento de prueba 13', 1, 916, 37, 'Movimiento de prueba', '2017-07-17 00:00:00'),
(14, 1, 5, 'E', 'Movimiento de prueba 14', 1, 910, 20, 'Movimiento de prueba', '2018-03-01 00:00:00'),
(15, 1, 2, 'S', 'Movimiento de prueba 15', 1, 949, 58, 'Movimiento de prueba', '2017-08-02 00:00:00'),
(16, 1, 5, 'S', 'Movimiento de prueba 16', 1, 958, 41, 'Movimiento de prueba', '2017-09-17 00:00:00'),
(17, 1, 2, 'S', 'Movimiento de prueba 17', 1, 937, 31, 'Movimiento de prueba', '2017-04-10 00:00:00'),
(18, 1, 1, 'E', 'Movimiento de prueba 18', 1, 917, 59, 'Movimiento de prueba', '2017-08-21 00:00:00'),
(19, 1, 6, 'E', 'Movimiento de prueba 19', 1, 935, 37, 'Movimiento de prueba', '2018-01-08 00:00:00'),
(20, 1, 5, 'E', 'Movimiento de prueba 20', 1, 998, 46, 'Movimiento de prueba', '2018-01-12 00:00:00'),
(21, 1, 2, 'S', 'Movimiento de prueba 21', 1, 993, 58, 'Movimiento de prueba', '2017-03-14 00:00:00'),
(22, 1, 2, 'E', 'Movimiento de prueba 22', 1, 914, 19, 'Movimiento de prueba', '2017-11-09 00:00:00'),
(23, 1, 1, 'S', 'Movimiento de prueba 23', 1, 907, 48, 'Movimiento de prueba', '2017-12-15 00:00:00'),
(24, 1, 5, 'S', 'Movimiento de prueba 24', 1, 956, 56, 'Movimiento de prueba', '2018-05-04 00:00:00'),
(25, 1, 5, 'E', 'Movimiento de prueba 25', 1, 979, 23, 'Movimiento de prueba', '2017-03-02 00:00:00'),
(26, 1, 2, 'S', 'Movimiento de prueba 26', 1, 995, 12, 'Movimiento de prueba', '2017-09-17 00:00:00'),
(27, 1, 6, 'S', 'Movimiento de prueba 27', 1, 980, 30, 'Movimiento de prueba', '2017-12-07 00:00:00'),
(28, 1, 5, 'E', 'Movimiento de prueba 28', 1, 931, 17, 'Movimiento de prueba', '2018-04-07 00:00:00'),
(29, 1, 5, 'E', 'Movimiento de prueba 29', 1, 979, 43, 'Movimiento de prueba', '2018-05-23 00:00:00'),
(30, 1, 5, 'S', 'Movimiento de prueba 30', 1, 923, 35, 'Movimiento de prueba', '2018-03-11 00:00:00'),
(31, 1, 3, 'S', 'Movimiento de prueba 31', 1, 949, 36, 'Movimiento de prueba', '2017-05-06 00:00:00'),
(32, 1, 1, 'E', 'Movimiento de prueba 32', 1, 973, 59, 'Movimiento de prueba', '2018-02-15 00:00:00'),
(33, 1, 5, 'S', 'Movimiento de prueba 33', 1, 971, 48, 'Movimiento de prueba', '2018-02-01 00:00:00'),
(34, 1, 2, 'E', 'Movimiento de prueba 34', 1, 902, 41, 'Movimiento de prueba', '2017-04-01 00:00:00'),
(35, 1, 3, 'E', 'Movimiento de prueba 35', 1, 904, 57, 'Movimiento de prueba', '2017-12-31 00:00:00'),
(36, 1, 3, 'S', 'Movimiento de prueba 36', 1, 961, 21, 'Movimiento de prueba', '2017-07-29 00:00:00'),
(37, 1, 6, 'S', 'Movimiento de prueba 37', 1, 994, 16, 'Movimiento de prueba', '2018-04-08 00:00:00'),
(38, 1, 6, 'S', 'Movimiento de prueba 38', 1, 929, 16, 'Movimiento de prueba', '2018-02-08 00:00:00'),
(39, 1, 2, 'E', 'Movimiento de prueba 39', 1, 946, 36, 'Movimiento de prueba', '2017-07-09 00:00:00'),
(40, 1, 5, 'E', 'Movimiento de prueba 40', 1, 983, 13, 'Movimiento de prueba', '2018-04-06 00:00:00'),
(41, 1, 1, 'S', 'Movimiento de prueba 41', 1, 947, 19, 'Movimiento de prueba', '2017-10-13 00:00:00'),
(42, 1, 6, 'S', 'Movimiento de prueba 42', 1, 972, 11, 'Movimiento de prueba', '2018-06-03 00:00:00'),
(43, 1, 5, 'E', 'Movimiento de prueba 43', 1, 985, 17, 'Movimiento de prueba', '2017-05-15 00:00:00'),
(44, 1, 3, 'E', 'Movimiento de prueba 44', 1, 957, 53, 'Movimiento de prueba', '2017-12-13 00:00:00'),
(45, 1, 3, 'E', 'Movimiento de prueba 45', 1, 994, 25, 'Movimiento de prueba', '2018-02-05 00:00:00'),
(46, 1, 5, 'E', 'Movimiento de prueba 46', 1, 948, 34, 'Movimiento de prueba', '2018-05-20 00:00:00'),
(47, 1, 2, 'S', 'Movimiento de prueba 47', 1, 909, 44, 'Movimiento de prueba', '2017-05-16 00:00:00'),
(48, 1, 5, 'E', 'Movimiento de prueba 48', 1, 913, 51, 'Movimiento de prueba', '2018-03-07 00:00:00'),
(49, 1, 3, 'S', 'Movimiento de prueba 49', 1, 961, 45, 'Movimiento de prueba', '2018-02-10 00:00:00'),
(50, 1, 4, 'E', 'Movimiento de prueba 50', 1, 973, 22, 'Movimiento de prueba', '2017-04-05 00:00:00'),
(51, 1, 4, 'S', 'Movimiento de prueba 51', 1, 941, 36, 'Movimiento de prueba', '2017-08-18 00:00:00'),
(52, 1, 2, 'E', 'Movimiento de prueba 52', 1, 987, 10, 'Movimiento de prueba', '2017-09-27 00:00:00'),
(53, 1, 2, 'S', 'Movimiento de prueba 53', 1, 951, 45, 'Movimiento de prueba', '2017-03-08 00:00:00'),
(54, 1, 6, 'S', 'Movimiento de prueba 54', 1, 967, 22, 'Movimiento de prueba', '2017-07-07 00:00:00'),
(55, 1, 4, 'E', 'Movimiento de prueba 55', 1, 977, 37, 'Movimiento de prueba', '2017-09-11 00:00:00'),
(56, 1, 3, 'S', 'Movimiento de prueba 56', 1, 917, 20, 'Movimiento de prueba', '2017-11-18 00:00:00'),
(57, 1, 1, 'S', 'Movimiento de prueba 57', 1, 956, 52, 'Movimiento de prueba', '2017-11-16 00:00:00'),
(58, 1, 2, 'E', 'Movimiento de prueba 58', 1, 938, 46, 'Movimiento de prueba', '2017-10-20 00:00:00'),
(59, 1, 2, 'S', 'Movimiento de prueba 59', 1, 969, 48, 'Movimiento de prueba', '2018-02-05 00:00:00'),
(60, 1, 3, 'S', 'Movimiento de prueba 60', 1, 960, 31, 'Movimiento de prueba', '2017-08-08 00:00:00'),
(61, 1, 3, 'E', 'Movimiento de prueba 61', 1, 903, 10, 'Movimiento de prueba', '2018-05-10 00:00:00'),
(62, 1, 4, 'E', 'Movimiento de prueba 62', 1, 945, 35, 'Movimiento de prueba', '2017-06-14 00:00:00'),
(63, 1, 4, 'E', 'Movimiento de prueba 63', 1, 905, 50, 'Movimiento de prueba', '2018-05-14 00:00:00'),
(64, 1, 2, 'E', 'Movimiento de prueba 64', 1, 962, 28, 'Movimiento de prueba', '2018-06-14 00:00:00'),
(65, 1, 6, 'E', 'Movimiento de prueba 65', 1, 921, 57, 'Movimiento de prueba', '2017-05-17 00:00:00'),
(66, 1, 6, 'E', 'Movimiento de prueba 66', 1, 928, 47, 'Movimiento de prueba', '2018-04-18 00:00:00'),
(67, 1, 1, 'E', 'Movimiento de prueba 67', 1, 928, 58, 'Movimiento de prueba', '2017-03-02 00:00:00'),
(68, 1, 1, 'S', 'Movimiento de prueba 68', 1, 920, 35, 'Movimiento de prueba', '2018-06-05 00:00:00'),
(69, 1, 3, 'S', 'Movimiento de prueba 69', 1, 982, 51, 'Movimiento de prueba', '2018-01-06 00:00:00'),
(70, 1, 5, 'E', 'Movimiento de prueba 70', 1, 913, 26, 'Movimiento de prueba', '2017-06-26 00:00:00'),
(71, 1, 2, 'E', 'Movimiento de prueba 71', 1, 970, 11, 'Movimiento de prueba', '2017-04-12 00:00:00'),
(72, 1, 2, 'E', 'Movimiento de prueba 72', 1, 998, 46, 'Movimiento de prueba', '2018-02-11 00:00:00'),
(73, 1, 3, 'E', 'Movimiento de prueba 73', 1, 934, 24, 'Movimiento de prueba', '2017-08-20 00:00:00'),
(74, 1, 6, 'S', 'Movimiento de prueba 74', 1, 921, 38, 'Movimiento de prueba', '2017-06-20 00:00:00'),
(75, 1, 3, 'S', 'Movimiento de prueba 75', 1, 929, 55, 'Movimiento de prueba', '2017-12-17 00:00:00'),
(76, 1, 3, 'E', 'Movimiento de prueba 76', 1, 918, 46, 'Movimiento de prueba', '2017-03-27 00:00:00'),
(77, 1, 1, 'E', 'Movimiento de prueba 77', 1, 960, 53, 'Movimiento de prueba', '2017-11-15 00:00:00'),
(78, 1, 1, 'E', 'Movimiento de prueba 78', 1, 962, 15, 'Movimiento de prueba', '2018-01-16 00:00:00'),
(79, 1, 1, 'E', 'Movimiento de prueba 79', 1, 949, 32, 'Movimiento de prueba', '2018-01-31 00:00:00'),
(80, 1, 2, 'E', 'Movimiento de prueba 80', 1, 974, 31, 'Movimiento de prueba', '2018-05-09 00:00:00'),
(81, 1, 2, 'S', 'Movimiento de prueba 81', 1, 917, 29, 'Movimiento de prueba', '2017-09-14 00:00:00'),
(82, 1, 6, 'E', 'Movimiento de prueba 82', 1, 922, 56, 'Movimiento de prueba', '2018-05-29 00:00:00'),
(83, 1, 1, 'E', 'Movimiento de prueba 83', 1, 925, 32, 'Movimiento de prueba', '2017-10-17 00:00:00'),
(84, 1, 1, 'E', 'Movimiento de prueba 84', 1, 988, 25, 'Movimiento de prueba', '2018-05-15 00:00:00'),
(85, 1, 5, 'S', 'Movimiento de prueba 85', 1, 977, 34, 'Movimiento de prueba', '2017-05-20 00:00:00'),
(86, 1, 3, 'E', 'Movimiento de prueba 86', 1, 954, 47, 'Movimiento de prueba', '2017-04-08 00:00:00'),
(87, 1, 2, 'S', 'Movimiento de prueba 87', 1, 952, 49, 'Movimiento de prueba', '2017-09-17 00:00:00'),
(88, 1, 5, 'E', 'Movimiento de prueba 88', 1, 970, 28, 'Movimiento de prueba', '2018-02-12 00:00:00'),
(89, 1, 4, 'S', 'Movimiento de prueba 89', 1, 904, 55, 'Movimiento de prueba', '2017-09-10 00:00:00'),
(90, 1, 3, 'E', 'Movimiento de prueba 90', 1, 918, 40, 'Movimiento de prueba', '2017-10-04 00:00:00'),
(91, 1, 3, 'E', 'Movimiento de prueba 91', 1, 907, 12, 'Movimiento de prueba', '2018-06-07 00:00:00'),
(92, 1, 5, 'S', 'Movimiento de prueba 92', 1, 953, 46, 'Movimiento de prueba', '2017-03-13 00:00:00'),
(93, 1, 6, 'S', 'Movimiento de prueba 93', 1, 971, 29, 'Movimiento de prueba', '2018-04-12 00:00:00'),
(94, 1, 1, 'E', 'Movimiento de prueba 94', 1, 975, 44, 'Movimiento de prueba', '2017-06-18 00:00:00'),
(95, 1, 1, 'S', 'Movimiento de prueba 95', 1, 995, 55, 'Movimiento de prueba', '2017-12-29 00:00:00'),
(96, 1, 4, 'S', 'Movimiento de prueba 96', 1, 949, 42, 'Movimiento de prueba', '2018-02-27 00:00:00'),
(97, 1, 6, 'E', 'Movimiento de prueba 97', 1, 948, 44, 'Movimiento de prueba', '2018-06-03 00:00:00'),
(98, 1, 5, 'E', 'Movimiento de prueba 98', 1, 952, 10, 'Movimiento de prueba', '2017-10-19 00:00:00'),
(99, 1, 3, 'S', 'Movimiento de prueba 99', 1, 913, 40, 'Movimiento de prueba', '2017-12-30 00:00:00'),
(100, 1, 3, 'E', 'Movimiento de prueba 100', 1, 921, 49, 'Movimiento de prueba', '2017-08-17 00:00:00'),
(101, 1, 3, 'S', 'Movimiento de prueba 101', 1, 956, 56, 'Movimiento de prueba', '2018-06-01 00:00:00'),
(102, 1, 1, 'E', 'Movimiento de prueba 102', 1, 986, 14, 'Movimiento de prueba', '2018-04-26 00:00:00'),
(103, 1, 2, 'E', 'Movimiento de prueba 103', 1, 939, 31, 'Movimiento de prueba', '2018-05-19 00:00:00'),
(104, 1, 3, 'E', 'Movimiento de prueba 104', 1, 960, 52, 'Movimiento de prueba', '2017-10-01 00:00:00'),
(105, 1, 5, 'E', 'Movimiento de prueba 105', 1, 991, 56, 'Movimiento de prueba', '2018-05-05 00:00:00'),
(106, 1, 5, 'E', 'Movimiento de prueba 106', 1, 948, 57, 'Movimiento de prueba', '2017-07-04 00:00:00'),
(107, 1, 3, 'S', 'Movimiento de prueba 107', 1, 982, 16, 'Movimiento de prueba', '2017-05-24 00:00:00'),
(108, 1, 4, 'E', 'Movimiento de prueba 108', 1, 955, 45, 'Movimiento de prueba', '2018-04-12 00:00:00'),
(109, 1, 2, 'E', 'Movimiento de prueba 109', 1, 979, 35, 'Movimiento de prueba', '2017-06-05 00:00:00'),
(110, 1, 3, 'S', 'Movimiento de prueba 110', 1, 921, 54, 'Movimiento de prueba', '2018-03-26 00:00:00'),
(111, 1, 3, 'S', 'Movimiento de prueba 111', 1, 983, 41, 'Movimiento de prueba', '2017-12-27 00:00:00'),
(112, 1, 2, 'S', 'Movimiento de prueba 112', 1, 939, 58, 'Movimiento de prueba', '2018-01-05 00:00:00'),
(113, 1, 3, 'S', 'Movimiento de prueba 113', 1, 971, 41, 'Movimiento de prueba', '2018-06-02 00:00:00'),
(114, 1, 1, 'E', 'Movimiento de prueba 114', 1, 951, 23, 'Movimiento de prueba', '2018-03-02 00:00:00'),
(115, 1, 1, 'E', 'Movimiento de prueba 115', 1, 934, 27, 'Movimiento de prueba', '2018-02-09 00:00:00'),
(116, 1, 4, 'S', 'Movimiento de prueba 116', 1, 931, 13, 'Movimiento de prueba', '2017-10-06 00:00:00'),
(117, 1, 1, 'E', 'Movimiento de prueba 117', 1, 999, 50, 'Movimiento de prueba', '2017-03-29 00:00:00'),
(118, 1, 6, 'E', 'Movimiento de prueba 118', 1, 941, 32, 'Movimiento de prueba', '2018-05-31 00:00:00'),
(119, 1, 4, 'S', 'Movimiento de prueba 119', 1, 980, 11, 'Movimiento de prueba', '2018-02-15 00:00:00'),
(120, 1, 4, 'S', 'Movimiento de prueba 120', 1, 960, 27, 'Movimiento de prueba', '2018-04-19 00:00:00'),
(121, 1, 3, 'E', 'Movimiento de prueba 121', 1, 915, 10, 'Movimiento de prueba', '2017-11-28 00:00:00'),
(122, 1, 6, 'S', 'Movimiento de prueba 122', 1, 922, 33, 'Movimiento de prueba', '2017-12-20 00:00:00'),
(123, 1, 5, 'S', 'Movimiento de prueba 123', 1, 983, 47, 'Movimiento de prueba', '2017-07-08 00:00:00'),
(124, 1, 1, 'S', 'Movimiento de prueba 124', 1, 914, 43, 'Movimiento de prueba', '2018-04-24 00:00:00'),
(125, 1, 3, 'S', 'Movimiento de prueba 125', 1, 962, 27, 'Movimiento de prueba', '2018-04-04 00:00:00'),
(126, 1, 2, 'E', 'Movimiento de prueba 126', 1, 962, 48, 'Movimiento de prueba', '2017-03-07 00:00:00'),
(127, 1, 5, 'S', 'Movimiento de prueba 127', 1, 924, 16, 'Movimiento de prueba', '2018-05-05 00:00:00'),
(128, 1, 2, 'E', 'Movimiento de prueba 128', 1, 922, 43, 'Movimiento de prueba', '2018-01-01 00:00:00'),
(129, 1, 2, 'E', 'Movimiento de prueba 129', 1, 993, 41, 'Movimiento de prueba', '2017-08-21 00:00:00'),
(130, 1, 6, 'S', 'Movimiento de prueba 130', 1, 931, 43, 'Movimiento de prueba', '2017-09-13 00:00:00'),
(131, 1, 1, 'E', 'Movimiento de prueba 131', 1, 928, 15, 'Movimiento de prueba', '2018-01-29 00:00:00'),
(132, 1, 2, 'S', 'Movimiento de prueba 132', 1, 909, 40, 'Movimiento de prueba', '2018-03-09 00:00:00'),
(133, 1, 1, 'E', 'Movimiento de prueba 133', 1, 986, 39, 'Movimiento de prueba', '2017-08-06 00:00:00'),
(134, 1, 6, 'S', 'Movimiento de prueba 134', 1, 928, 39, 'Movimiento de prueba', '2017-04-25 00:00:00'),
(135, 1, 5, 'S', 'Movimiento de prueba 135', 1, 994, 44, 'Movimiento de prueba', '2017-12-27 00:00:00'),
(136, 1, 1, 'S', 'Movimiento de prueba 136', 1, 912, 36, 'Movimiento de prueba', '2017-06-23 00:00:00'),
(137, 1, 4, 'S', 'Movimiento de prueba 137', 1, 960, 35, 'Movimiento de prueba', '2018-02-15 00:00:00'),
(138, 1, 2, 'S', 'Movimiento de prueba 138', 1, 994, 41, 'Movimiento de prueba', '2017-07-05 00:00:00'),
(139, 1, 3, 'S', 'Movimiento de prueba 139', 1, 944, 35, 'Movimiento de prueba', '2017-06-20 00:00:00'),
(140, 1, 4, 'E', 'Movimiento de prueba 140', 1, 947, 56, 'Movimiento de prueba', '2017-06-13 00:00:00'),
(141, 1, 2, 'S', 'Movimiento de prueba 141', 1, 991, 41, 'Movimiento de prueba', '2017-09-07 00:00:00'),
(142, 1, 1, 'E', 'Movimiento de prueba 142', 1, 995, 27, 'Movimiento de prueba', '2018-04-24 00:00:00'),
(143, 1, 3, 'E', 'Movimiento de prueba 143', 1, 939, 10, 'Movimiento de prueba', '2018-04-27 00:00:00'),
(144, 1, 3, 'E', 'Movimiento de prueba 144', 1, 916, 26, 'Movimiento de prueba', '2017-06-04 00:00:00'),
(145, 1, 6, 'E', 'Movimiento de prueba 145', 1, 981, 59, 'Movimiento de prueba', '2017-11-14 00:00:00'),
(146, 1, 5, 'E', 'Movimiento de prueba 146', 1, 915, 36, 'Movimiento de prueba', '2017-06-06 00:00:00'),
(147, 1, 3, 'S', 'Movimiento de prueba 147', 1, 949, 48, 'Movimiento de prueba', '2017-09-04 00:00:00'),
(148, 1, 5, 'E', 'Movimiento de prueba 148', 1, 971, 18, 'Movimiento de prueba', '2017-12-31 00:00:00'),
(149, 1, 5, 'S', 'Movimiento de prueba 149', 1, 902, 36, 'Movimiento de prueba', '2017-11-14 00:00:00'),
(150, 1, 2, 'E', 'Movimiento de prueba 150', 1, 972, 53, 'Movimiento de prueba', '2017-05-28 00:00:00'),
(151, 1, 2, 'E', 'Movimiento de prueba 151', 1, 926, 18, 'Movimiento de prueba', '2017-04-12 00:00:00'),
(152, 1, 6, 'E', 'Movimiento de prueba 152', 1, 991, 38, 'Movimiento de prueba', '2017-04-10 00:00:00'),
(153, 1, 5, 'E', 'Movimiento de prueba 153', 1, 987, 16, 'Movimiento de prueba', '2017-03-31 00:00:00'),
(154, 1, 6, 'E', 'Movimiento de prueba 154', 1, 993, 43, 'Movimiento de prueba', '2017-11-30 00:00:00'),
(155, 1, 6, 'S', 'Movimiento de prueba 155', 1, 970, 35, 'Movimiento de prueba', '2017-10-04 00:00:00'),
(156, 1, 5, 'E', 'Movimiento de prueba 156', 1, 975, 38, 'Movimiento de prueba', '2017-12-15 00:00:00'),
(157, 1, 3, 'S', 'Movimiento de prueba 157', 1, 916, 26, 'Movimiento de prueba', '2017-05-13 00:00:00'),
(158, 1, 5, 'E', 'Movimiento de prueba 158', 1, 988, 14, 'Movimiento de prueba', '2018-03-08 00:00:00'),
(159, 1, 5, 'E', 'Movimiento de prueba 159', 1, 920, 53, 'Movimiento de prueba', '2018-02-26 00:00:00'),
(160, 1, 2, 'S', 'Movimiento de prueba 160', 1, 918, 41, 'Movimiento de prueba', '2017-11-14 00:00:00'),
(161, 1, 6, 'S', 'Movimiento de prueba 161', 1, 930, 16, 'Movimiento de prueba', '2018-02-20 00:00:00'),
(162, 1, 3, 'S', 'Movimiento de prueba 162', 1, 917, 53, 'Movimiento de prueba', '2018-03-20 00:00:00'),
(163, 1, 3, 'S', 'Movimiento de prueba 163', 1, 935, 55, 'Movimiento de prueba', '2017-10-03 00:00:00'),
(164, 1, 4, 'S', 'Movimiento de prueba 164', 1, 980, 36, 'Movimiento de prueba', '2017-05-28 00:00:00'),
(165, 1, 3, 'E', 'Movimiento de prueba 165', 1, 929, 42, 'Movimiento de prueba', '2017-08-18 00:00:00'),
(166, 1, 6, 'E', 'Movimiento de prueba 166', 1, 933, 16, 'Movimiento de prueba', '2017-12-20 00:00:00'),
(167, 1, 5, 'S', 'Movimiento de prueba 167', 1, 928, 44, 'Movimiento de prueba', '2017-11-21 00:00:00'),
(168, 1, 5, 'E', 'Movimiento de prueba 168', 1, 951, 13, 'Movimiento de prueba', '2018-03-30 00:00:00'),
(169, 1, 6, 'E', 'Movimiento de prueba 169', 1, 956, 58, 'Movimiento de prueba', '2017-04-28 00:00:00'),
(170, 1, 5, 'E', 'Movimiento de prueba 170', 1, 906, 40, 'Movimiento de prueba', '2018-03-10 00:00:00'),
(171, 1, 2, 'E', 'Movimiento de prueba 171', 1, 996, 26, 'Movimiento de prueba', '2018-02-26 00:00:00'),
(172, 1, 6, 'S', 'Movimiento de prueba 172', 1, 911, 48, 'Movimiento de prueba', '2017-10-22 00:00:00'),
(173, 1, 2, 'E', 'Movimiento de prueba 173', 1, 979, 38, 'Movimiento de prueba', '2017-09-26 00:00:00'),
(174, 1, 4, 'E', 'Movimiento de prueba 174', 1, 964, 36, 'Movimiento de prueba', '2018-02-01 00:00:00'),
(175, 1, 6, 'S', 'Movimiento de prueba 175', 1, 993, 27, 'Movimiento de prueba', '2018-05-25 00:00:00'),
(176, 1, 5, 'S', 'Movimiento de prueba 176', 1, 952, 31, 'Movimiento de prueba', '2017-11-01 00:00:00'),
(177, 1, 3, 'E', 'Movimiento de prueba 177', 1, 972, 19, 'Movimiento de prueba', '2018-02-12 00:00:00'),
(178, 1, 1, 'E', 'Movimiento de prueba 178', 1, 903, 44, 'Movimiento de prueba', '2017-08-13 00:00:00'),
(179, 1, 5, 'E', 'Movimiento de prueba 179', 1, 981, 56, 'Movimiento de prueba', '2017-06-23 00:00:00'),
(180, 1, 3, 'E', 'Movimiento de prueba 180', 1, 942, 15, 'Movimiento de prueba', '2017-07-27 00:00:00'),
(181, 1, 2, 'E', 'Movimiento de prueba 181', 1, 922, 39, 'Movimiento de prueba', '2017-07-13 00:00:00'),
(182, 1, 4, 'E', 'Movimiento de prueba 182', 1, 996, 43, 'Movimiento de prueba', '2017-10-03 00:00:00'),
(183, 1, 2, 'E', 'Movimiento de prueba 183', 1, 941, 55, 'Movimiento de prueba', '2017-08-04 00:00:00'),
(184, 1, 6, 'S', 'Movimiento de prueba 184', 1, 907, 43, 'Movimiento de prueba', '2017-05-09 00:00:00'),
(185, 1, 5, 'E', 'Movimiento de prueba 185', 1, 970, 59, 'Movimiento de prueba', '2018-03-13 00:00:00'),
(186, 1, 1, 'S', 'Movimiento de prueba 186', 1, 941, 25, 'Movimiento de prueba', '2017-07-04 00:00:00'),
(187, 1, 3, 'E', 'Movimiento de prueba 187', 1, 936, 51, 'Movimiento de prueba', '2017-03-23 00:00:00'),
(188, 1, 5, 'S', 'Movimiento de prueba 188', 1, 990, 40, 'Movimiento de prueba', '2017-08-28 00:00:00'),
(189, 1, 1, 'E', 'Movimiento de prueba 189', 1, 955, 26, 'Movimiento de prueba', '2018-06-01 00:00:00'),
(190, 1, 6, 'E', 'Movimiento de prueba 190', 1, 976, 29, 'Movimiento de prueba', '2017-12-26 00:00:00'),
(191, 1, 1, 'E', 'Movimiento de prueba 191', 1, 907, 43, 'Movimiento de prueba', '2017-04-28 00:00:00'),
(192, 1, 4, 'S', 'Movimiento de prueba 192', 1, 974, 37, 'Movimiento de prueba', '2017-11-10 00:00:00'),
(193, 1, 1, 'S', 'Movimiento de prueba 193', 1, 983, 30, 'Movimiento de prueba', '2017-10-19 00:00:00'),
(194, 1, 2, 'S', 'Movimiento de prueba 194', 1, 940, 35, 'Movimiento de prueba', '2017-07-31 00:00:00'),
(195, 1, 1, 'E', 'Movimiento de prueba 195', 1, 918, 33, 'Movimiento de prueba', '2018-02-13 00:00:00'),
(196, 1, 2, 'E', 'Movimiento de prueba 196', 1, 902, 55, 'Movimiento de prueba', '2017-10-18 00:00:00'),
(197, 1, 5, 'E', 'Movimiento de prueba 197', 1, 947, 59, 'Movimiento de prueba', '2017-10-21 00:00:00'),
(198, 1, 4, 'E', 'Movimiento de prueba 198', 1, 936, 21, 'Movimiento de prueba', '2017-04-07 00:00:00'),
(199, 1, 5, 'E', 'Movimiento de prueba 199', 1, 915, 11, 'Movimiento de prueba', '2018-01-24 00:00:00'),
(200, 1, 3, 'S', 'Movimiento de prueba 200', 1, 916, 20, 'Movimiento de prueba', '2017-11-06 00:00:00'),
(201, 1, 1, 'S', 'Movimiento de prueba 201', 1, 907, 33, 'Movimiento de prueba', '2017-04-09 00:00:00'),
(202, 1, 1, 'S', 'Movimiento de prueba 202', 1, 932, 59, 'Movimiento de prueba', '2017-03-01 00:00:00'),
(203, 1, 1, 'E', 'Movimiento de prueba 203', 1, 931, 27, 'Movimiento de prueba', '2018-03-09 00:00:00'),
(204, 1, 6, 'E', 'Movimiento de prueba 204', 1, 943, 32, 'Movimiento de prueba', '2018-06-01 00:00:00'),
(205, 1, 3, 'S', 'Movimiento de prueba 205', 1, 926, 43, 'Movimiento de prueba', '2017-11-28 00:00:00'),
(206, 1, 6, 'S', 'Movimiento de prueba 206', 1, 954, 51, 'Movimiento de prueba', '2017-10-09 00:00:00'),
(207, 1, 6, 'E', 'Movimiento de prueba 207', 1, 961, 55, 'Movimiento de prueba', '2018-01-14 00:00:00'),
(208, 1, 5, 'E', 'Movimiento de prueba 208', 1, 955, 51, 'Movimiento de prueba', '2017-10-04 00:00:00'),
(209, 1, 6, 'S', 'Movimiento de prueba 209', 1, 947, 58, 'Movimiento de prueba', '2017-10-07 00:00:00'),
(210, 1, 3, 'S', 'Movimiento de prueba 210', 1, 996, 55, 'Movimiento de prueba', '2017-12-21 00:00:00'),
(211, 1, 3, 'E', 'Movimiento de prueba 211', 1, 998, 19, 'Movimiento de prueba', '2018-05-15 00:00:00'),
(212, 1, 1, 'S', 'Movimiento de prueba 212', 1, 900, 28, 'Movimiento de prueba', '2018-04-18 00:00:00'),
(213, 1, 2, 'S', 'Movimiento de prueba 213', 1, 934, 54, 'Movimiento de prueba', '2017-08-28 00:00:00'),
(214, 1, 2, 'E', 'Movimiento de prueba 214', 1, 983, 50, 'Movimiento de prueba', '2017-11-26 00:00:00'),
(215, 1, 3, 'E', 'Movimiento de prueba 215', 1, 971, 29, 'Movimiento de prueba', '2018-04-01 00:00:00'),
(216, 1, 1, 'S', 'Movimiento de prueba 216', 1, 965, 41, 'Movimiento de prueba', '2017-06-20 00:00:00'),
(217, 1, 2, 'S', 'Movimiento de prueba 217', 1, 942, 19, 'Movimiento de prueba', '2017-12-25 00:00:00'),
(218, 1, 4, 'E', 'Movimiento de prueba 218', 1, 936, 14, 'Movimiento de prueba', '2017-07-26 00:00:00'),
(219, 1, 2, 'S', 'Movimiento de prueba 219', 1, 925, 26, 'Movimiento de prueba', '2018-05-02 00:00:00'),
(220, 1, 4, 'S', 'Movimiento de prueba 220', 1, 932, 42, 'Movimiento de prueba', '2017-07-07 00:00:00'),
(221, 1, 3, 'E', 'Movimiento de prueba 221', 1, 916, 59, 'Movimiento de prueba', '2017-09-20 00:00:00'),
(222, 1, 2, 'S', 'Movimiento de prueba 222', 1, 982, 13, 'Movimiento de prueba', '2018-04-18 00:00:00'),
(223, 1, 2, 'E', 'Movimiento de prueba 223', 1, 982, 24, 'Movimiento de prueba', '2017-03-02 00:00:00'),
(224, 1, 1, 'S', 'Movimiento de prueba 224', 1, 985, 26, 'Movimiento de prueba', '2017-04-24 00:00:00'),
(225, 1, 4, 'E', 'Movimiento de prueba 225', 1, 960, 43, 'Movimiento de prueba', '2017-10-18 00:00:00'),
(226, 1, 3, 'S', 'Movimiento de prueba 226', 1, 903, 35, 'Movimiento de prueba', '2017-09-30 00:00:00'),
(227, 1, 5, 'E', 'Movimiento de prueba 227', 1, 915, 59, 'Movimiento de prueba', '2017-10-06 00:00:00'),
(228, 1, 3, 'E', 'Movimiento de prueba 228', 1, 904, 56, 'Movimiento de prueba', '2017-11-21 00:00:00'),
(229, 1, 6, 'E', 'Movimiento de prueba 229', 1, 949, 38, 'Movimiento de prueba', '2017-09-07 00:00:00'),
(230, 1, 2, 'E', 'Movimiento de prueba 230', 1, 928, 46, 'Movimiento de prueba', '2018-03-08 00:00:00'),
(231, 1, 5, 'E', 'Movimiento de prueba 231', 1, 911, 15, 'Movimiento de prueba', '2017-06-02 00:00:00'),
(232, 1, 5, 'S', 'Movimiento de prueba 232', 1, 980, 46, 'Movimiento de prueba', '2017-06-01 00:00:00'),
(233, 1, 5, 'E', 'Movimiento de prueba 233', 1, 904, 46, 'Movimiento de prueba', '2017-11-02 00:00:00'),
(234, 1, 3, 'S', 'Movimiento de prueba 234', 1, 932, 13, 'Movimiento de prueba', '2017-09-02 00:00:00'),
(235, 1, 5, 'S', 'Movimiento de prueba 235', 1, 959, 24, 'Movimiento de prueba', '2017-12-18 00:00:00'),
(236, 1, 2, 'E', 'Movimiento de prueba 236', 1, 925, 13, 'Movimiento de prueba', '2017-12-19 00:00:00'),
(237, 1, 6, 'S', 'Movimiento de prueba 237', 1, 999, 29, 'Movimiento de prueba', '2017-03-01 00:00:00'),
(238, 1, 5, 'E', 'Movimiento de prueba 238', 1, 980, 53, 'Movimiento de prueba', '2018-05-24 00:00:00'),
(239, 1, 1, 'S', 'Movimiento de prueba 239', 1, 918, 15, 'Movimiento de prueba', '2017-03-05 00:00:00'),
(240, 1, 5, 'S', 'Movimiento de prueba 240', 1, 960, 27, 'Movimiento de prueba', '2018-06-06 00:00:00'),
(241, 1, 6, 'E', 'Movimiento de prueba 241', 1, 978, 16, 'Movimiento de prueba', '2017-07-27 00:00:00'),
(242, 1, 2, 'S', 'Movimiento de prueba 242', 1, 912, 51, 'Movimiento de prueba', '2018-03-04 00:00:00'),
(243, 1, 3, 'S', 'Movimiento de prueba 243', 1, 952, 28, 'Movimiento de prueba', '2017-06-16 00:00:00'),
(244, 1, 1, 'S', 'Movimiento de prueba 244', 1, 978, 16, 'Movimiento de prueba', '2017-08-11 00:00:00'),
(245, 1, 2, 'S', 'Movimiento de prueba 245', 1, 983, 34, 'Movimiento de prueba', '2018-05-08 00:00:00'),
(246, 1, 1, 'S', 'Movimiento de prueba 246', 1, 954, 45, 'Movimiento de prueba', '2018-05-26 00:00:00'),
(247, 1, 4, 'E', 'Movimiento de prueba 247', 1, 977, 51, 'Movimiento de prueba', '2018-04-04 00:00:00'),
(248, 1, 5, 'E', 'Movimiento de prueba 248', 1, 966, 48, 'Movimiento de prueba', '2018-04-02 00:00:00'),
(249, 1, 6, 'E', 'Movimiento de prueba 249', 1, 967, 15, 'Movimiento de prueba', '2017-11-20 00:00:00'),
(250, 1, 3, 'S', 'Movimiento de prueba 250', 1, 956, 14, 'Movimiento de prueba', '2018-02-08 00:00:00'),
(251, 1, 3, 'S', 'Movimiento de prueba 251', 1, 965, 59, 'Movimiento de prueba', '2018-06-01 00:00:00'),
(252, 1, 6, 'S', 'Movimiento de prueba 252', 1, 901, 32, 'Movimiento de prueba', '2017-06-28 00:00:00'),
(253, 1, 6, 'S', 'Movimiento de prueba 253', 1, 978, 53, 'Movimiento de prueba', '2018-06-02 00:00:00'),
(254, 1, 2, 'E', 'Movimiento de prueba 254', 1, 917, 45, 'Movimiento de prueba', '2018-06-12 00:00:00'),
(255, 1, 6, 'E', 'Movimiento de prueba 255', 1, 991, 45, 'Movimiento de prueba', '2018-02-19 00:00:00'),
(256, 1, 5, 'E', 'Movimiento de prueba 256', 1, 936, 39, 'Movimiento de prueba', '2018-04-16 00:00:00'),
(257, 1, 4, 'E', 'Movimiento de prueba 257', 1, 986, 26, 'Movimiento de prueba', '2017-04-04 00:00:00'),
(258, 1, 3, 'S', 'Movimiento de prueba 258', 1, 901, 19, 'Movimiento de prueba', '2018-05-20 00:00:00'),
(259, 1, 1, 'S', 'Movimiento de prueba 259', 1, 981, 36, 'Movimiento de prueba', '2017-05-25 00:00:00'),
(260, 1, 3, 'E', 'Movimiento de prueba 260', 1, 973, 21, 'Movimiento de prueba', '2018-05-03 00:00:00'),
(261, 1, 6, 'S', 'Movimiento de prueba 261', 1, 971, 38, 'Movimiento de prueba', '2018-02-09 00:00:00'),
(262, 1, 6, 'E', 'Movimiento de prueba 262', 1, 946, 58, 'Movimiento de prueba', '2017-09-17 00:00:00'),
(263, 1, 2, 'S', 'Movimiento de prueba 263', 1, 983, 32, 'Movimiento de prueba', '2018-02-05 00:00:00'),
(264, 1, 2, 'E', 'Movimiento de prueba 264', 1, 952, 49, 'Movimiento de prueba', '2017-08-15 00:00:00'),
(265, 1, 3, 'E', 'Movimiento de prueba 265', 1, 983, 16, 'Movimiento de prueba', '2017-04-28 00:00:00'),
(266, 1, 2, 'S', 'Movimiento de prueba 266', 1, 943, 43, 'Movimiento de prueba', '2017-03-06 00:00:00'),
(267, 1, 1, 'E', 'Movimiento de prueba 267', 1, 943, 19, 'Movimiento de prueba', '2018-01-16 00:00:00'),
(268, 1, 5, 'E', 'Movimiento de prueba 268', 1, 958, 55, 'Movimiento de prueba', '2018-02-26 00:00:00'),
(269, 1, 1, 'E', 'Movimiento de prueba 269', 1, 944, 15, 'Movimiento de prueba', '2017-06-03 00:00:00'),
(270, 1, 5, 'S', 'Movimiento de prueba 270', 1, 902, 44, 'Movimiento de prueba', '2017-08-20 00:00:00'),
(271, 1, 5, 'S', 'Movimiento de prueba 271', 1, 935, 38, 'Movimiento de prueba', '2018-03-14 00:00:00'),
(272, 1, 2, 'E', 'Movimiento de prueba 272', 1, 964, 55, 'Movimiento de prueba', '2017-11-29 00:00:00'),
(273, 1, 2, 'E', 'Movimiento de prueba 273', 1, 935, 21, 'Movimiento de prueba', '2017-04-07 00:00:00'),
(274, 1, 5, 'E', 'Movimiento de prueba 274', 1, 949, 34, 'Movimiento de prueba', '2018-05-27 00:00:00'),
(275, 1, 3, 'S', 'Movimiento de prueba 275', 1, 998, 36, 'Movimiento de prueba', '2018-01-11 00:00:00'),
(276, 1, 5, 'S', 'Movimiento de prueba 276', 1, 926, 37, 'Movimiento de prueba', '2018-05-21 00:00:00'),
(277, 1, 1, 'S', 'Movimiento de prueba 277', 1, 976, 59, 'Movimiento de prueba', '2018-01-21 00:00:00'),
(278, 1, 3, 'E', 'Movimiento de prueba 278', 1, 900, 18, 'Movimiento de prueba', '2018-03-10 00:00:00'),
(279, 1, 3, 'E', 'Movimiento de prueba 279', 1, 995, 34, 'Movimiento de prueba', '2017-12-19 00:00:00'),
(280, 1, 4, 'E', 'Movimiento de prueba 280', 1, 950, 44, 'Movimiento de prueba', '2018-05-25 00:00:00'),
(281, 1, 5, 'S', 'Movimiento de prueba 281', 1, 902, 23, 'Movimiento de prueba', '2017-06-28 00:00:00'),
(282, 1, 3, 'S', 'Movimiento de prueba 282', 1, 936, 19, 'Movimiento de prueba', '2018-04-14 00:00:00'),
(283, 1, 5, 'E', 'Movimiento de prueba 283', 1, 960, 34, 'Movimiento de prueba', '2017-12-15 00:00:00'),
(284, 1, 4, 'E', 'Movimiento de prueba 284', 1, 942, 27, 'Movimiento de prueba', '2017-10-05 00:00:00'),
(285, 1, 2, 'E', 'Movimiento de prueba 285', 1, 923, 15, 'Movimiento de prueba', '2018-04-12 00:00:00'),
(286, 1, 6, 'E', 'Movimiento de prueba 286', 1, 983, 15, 'Movimiento de prueba', '2017-03-15 00:00:00'),
(287, 1, 5, 'E', 'Movimiento de prueba 287', 1, 966, 21, 'Movimiento de prueba', '2017-05-23 00:00:00'),
(288, 1, 2, 'E', 'Movimiento de prueba 288', 1, 944, 12, 'Movimiento de prueba', '2018-04-07 00:00:00'),
(289, 1, 1, 'E', 'Movimiento de prueba 289', 1, 943, 42, 'Movimiento de prueba', '2018-06-07 00:00:00'),
(290, 1, 6, 'S', 'Movimiento de prueba 290', 1, 905, 56, 'Movimiento de prueba', '2017-10-13 00:00:00'),
(291, 1, 4, 'S', 'Movimiento de prueba 291', 1, 942, 18, 'Movimiento de prueba', '2017-11-16 00:00:00'),
(292, 1, 2, 'S', 'Movimiento de prueba 292', 1, 949, 34, 'Movimiento de prueba', '2017-03-05 00:00:00'),
(293, 1, 4, 'S', 'Movimiento de prueba 293', 1, 996, 41, 'Movimiento de prueba', '2017-07-18 00:00:00'),
(294, 1, 4, 'S', 'Movimiento de prueba 294', 1, 925, 24, 'Movimiento de prueba', '2018-01-05 00:00:00'),
(295, 1, 3, 'E', 'Movimiento de prueba 295', 1, 979, 24, 'Movimiento de prueba', '2017-04-21 00:00:00'),
(296, 1, 4, 'S', 'Movimiento de prueba 296', 1, 977, 12, 'Movimiento de prueba', '2018-04-14 00:00:00'),
(297, 1, 2, 'S', 'Movimiento de prueba 297', 1, 999, 27, 'Movimiento de prueba', '2018-03-09 00:00:00'),
(298, 1, 6, 'E', 'Movimiento de prueba 298', 1, 901, 42, 'Movimiento de prueba', '2017-06-09 00:00:00'),
(299, 1, 1, 'S', 'Movimiento de prueba 299', 1, 902, 36, 'Movimiento de prueba', '2017-12-14 00:00:00'),
(300, 1, 3, 'E', 'Movimiento de prueba 300', 1, 961, 54, 'Movimiento de prueba', '2017-12-03 00:00:00'),
(301, 1, 2, 'S', 'Movimiento de prueba 301', 1, 968, 24, 'Movimiento de prueba', '2017-09-07 00:00:00'),
(302, 1, 1, 'E', 'Movimiento de prueba 302', 1, 900, 39, 'Movimiento de prueba', '2018-04-25 00:00:00'),
(303, 1, 5, 'S', 'Movimiento de prueba 303', 1, 925, 41, 'Movimiento de prueba', '2017-09-06 00:00:00'),
(304, 1, 1, 'E', 'Movimiento de prueba 304', 1, 959, 49, 'Movimiento de prueba', '2017-05-05 00:00:00'),
(305, 1, 3, 'E', 'Movimiento de prueba 305', 1, 957, 56, 'Movimiento de prueba', '2018-04-13 00:00:00'),
(306, 1, 4, 'E', 'Movimiento de prueba 306', 1, 962, 25, 'Movimiento de prueba', '2017-12-30 00:00:00'),
(307, 1, 2, 'S', 'Movimiento de prueba 307', 1, 939, 56, 'Movimiento de prueba', '2017-11-03 00:00:00'),
(308, 1, 5, 'E', 'Movimiento de prueba 308', 1, 984, 54, 'Movimiento de prueba', '2018-04-21 00:00:00'),
(309, 1, 5, 'E', 'Movimiento de prueba 309', 1, 952, 16, 'Movimiento de prueba', '2017-04-03 00:00:00'),
(310, 1, 6, 'S', 'Movimiento de prueba 310', 1, 925, 28, 'Movimiento de prueba', '2017-04-22 00:00:00'),
(311, 1, 3, 'S', 'Movimiento de prueba 311', 1, 992, 15, 'Movimiento de prueba', '2018-02-04 00:00:00'),
(312, 1, 2, 'E', 'Movimiento de prueba 312', 1, 992, 35, 'Movimiento de prueba', '2018-03-10 00:00:00'),
(313, 1, 3, 'S', 'Movimiento de prueba 313', 1, 967, 58, 'Movimiento de prueba', '2018-04-05 00:00:00'),
(314, 1, 2, 'E', 'Movimiento de prueba 314', 1, 956, 33, 'Movimiento de prueba', '2018-01-24 00:00:00'),
(315, 1, 1, 'E', 'Movimiento de prueba 315', 1, 992, 57, 'Movimiento de prueba', '2017-03-01 00:00:00'),
(316, 1, 1, 'S', 'Movimiento de prueba 316', 1, 911, 32, 'Movimiento de prueba', '2018-04-16 00:00:00'),
(317, 1, 1, 'S', 'Movimiento de prueba 317', 1, 982, 27, 'Movimiento de prueba', '2017-06-28 00:00:00'),
(318, 1, 2, 'E', 'Movimiento de prueba 318', 1, 943, 54, 'Movimiento de prueba', '2017-04-28 00:00:00'),
(319, 1, 6, 'E', 'Movimiento de prueba 319', 1, 928, 15, 'Movimiento de prueba', '2018-01-14 00:00:00'),
(320, 1, 1, 'E', 'Movimiento de prueba 320', 1, 963, 12, 'Movimiento de prueba', '2017-08-27 00:00:00'),
(321, 1, 5, 'E', 'Movimiento de prueba 321', 1, 922, 43, 'Movimiento de prueba', '2018-02-06 00:00:00'),
(322, 1, 4, 'S', 'Movimiento de prueba 322', 1, 926, 53, 'Movimiento de prueba', '2017-11-25 00:00:00'),
(323, 1, 2, 'S', 'Movimiento de prueba 323', 1, 987, 50, 'Movimiento de prueba', '2017-09-27 00:00:00'),
(324, 1, 5, 'S', 'Movimiento de prueba 324', 1, 959, 20, 'Movimiento de prueba', '2017-07-09 00:00:00'),
(325, 1, 5, 'S', 'Movimiento de prueba 325', 1, 925, 39, 'Movimiento de prueba', '2017-06-08 00:00:00'),
(326, 1, 2, 'S', 'Movimiento de prueba 326', 1, 967, 24, 'Movimiento de prueba', '2017-10-07 00:00:00'),
(327, 1, 3, 'S', 'Movimiento de prueba 327', 1, 964, 51, 'Movimiento de prueba', '2017-06-21 00:00:00'),
(328, 1, 5, 'S', 'Movimiento de prueba 328', 1, 968, 17, 'Movimiento de prueba', '2018-01-23 00:00:00'),
(329, 1, 1, 'E', 'Movimiento de prueba 329', 1, 954, 25, 'Movimiento de prueba', '2018-05-12 00:00:00'),
(330, 1, 5, 'S', 'Movimiento de prueba 330', 1, 965, 10, 'Movimiento de prueba', '2017-03-27 00:00:00'),
(331, 1, 2, 'E', 'Movimiento de prueba 331', 1, 911, 11, 'Movimiento de prueba', '2018-03-01 00:00:00'),
(332, 1, 5, 'S', 'Movimiento de prueba 332', 1, 902, 13, 'Movimiento de prueba', '2017-06-21 00:00:00'),
(333, 1, 1, 'E', 'Movimiento de prueba 333', 1, 959, 11, 'Movimiento de prueba', '2017-07-23 00:00:00'),
(334, 1, 3, 'E', 'Movimiento de prueba 334', 1, 983, 51, 'Movimiento de prueba', '2018-01-07 00:00:00'),
(335, 1, 5, 'E', 'Movimiento de prueba 335', 1, 981, 55, 'Movimiento de prueba', '2017-05-04 00:00:00'),
(336, 1, 6, 'E', 'Movimiento de prueba 336', 1, 971, 42, 'Movimiento de prueba', '2017-03-31 00:00:00'),
(337, 1, 3, 'S', 'Movimiento de prueba 337', 1, 990, 12, 'Movimiento de prueba', '2017-11-11 00:00:00'),
(338, 1, 4, 'E', 'Movimiento de prueba 338', 1, 914, 22, 'Movimiento de prueba', '2018-02-25 00:00:00'),
(339, 1, 1, 'E', 'Movimiento de prueba 339', 1, 990, 50, 'Movimiento de prueba', '2017-07-11 00:00:00'),
(340, 1, 6, 'E', 'Movimiento de prueba 340', 1, 976, 29, 'Movimiento de prueba', '2017-12-24 00:00:00'),
(341, 1, 1, 'E', 'Movimiento de prueba 341', 1, 957, 36, 'Movimiento de prueba', '2018-05-22 00:00:00'),
(342, 1, 1, 'S', 'Movimiento de prueba 342', 1, 988, 51, 'Movimiento de prueba', '2017-10-08 00:00:00'),
(343, 1, 6, 'E', 'Movimiento de prueba 343', 1, 942, 13, 'Movimiento de prueba', '2017-04-08 00:00:00'),
(344, 1, 2, 'S', 'Movimiento de prueba 344', 1, 907, 17, 'Movimiento de prueba', '2017-11-30 00:00:00'),
(345, 1, 3, 'E', 'Movimiento de prueba 345', 1, 991, 22, 'Movimiento de prueba', '2017-10-18 00:00:00'),
(346, 1, 5, 'E', 'Movimiento de prueba 346', 1, 932, 26, 'Movimiento de prueba', '2018-01-31 00:00:00'),
(347, 1, 4, 'S', 'Movimiento de prueba 347', 1, 957, 57, 'Movimiento de prueba', '2018-06-08 00:00:00'),
(348, 1, 1, 'S', 'Movimiento de prueba 348', 1, 923, 43, 'Movimiento de prueba', '2018-01-12 00:00:00'),
(349, 1, 3, 'S', 'Movimiento de prueba 349', 1, 929, 34, 'Movimiento de prueba', '2017-11-16 00:00:00'),
(350, 1, 2, 'S', 'Movimiento de prueba 350', 1, 934, 18, 'Movimiento de prueba', '2018-03-11 00:00:00'),
(351, 1, 3, 'E', 'Movimiento de prueba 351', 1, 989, 22, 'Movimiento de prueba', '2017-12-01 00:00:00'),
(352, 1, 1, 'E', 'Movimiento de prueba 352', 1, 978, 49, 'Movimiento de prueba', '2017-11-07 00:00:00'),
(353, 1, 2, 'E', 'Movimiento de prueba 353', 1, 916, 47, 'Movimiento de prueba', '2017-06-11 00:00:00'),
(354, 1, 6, 'S', 'Movimiento de prueba 354', 1, 958, 11, 'Movimiento de prueba', '2017-08-29 00:00:00'),
(355, 1, 6, 'E', 'Movimiento de prueba 355', 1, 985, 12, 'Movimiento de prueba', '2018-01-21 00:00:00'),
(356, 1, 2, 'E', 'Movimiento de prueba 356', 1, 923, 55, 'Movimiento de prueba', '2018-03-24 00:00:00'),
(357, 1, 3, 'S', 'Movimiento de prueba 357', 1, 942, 37, 'Movimiento de prueba', '2017-10-22 00:00:00'),
(358, 1, 6, 'S', 'Movimiento de prueba 358', 1, 987, 28, 'Movimiento de prueba', '2017-05-19 00:00:00'),
(359, 1, 5, 'E', 'Movimiento de prueba 359', 1, 923, 23, 'Movimiento de prueba', '2018-01-08 00:00:00'),
(360, 1, 3, 'E', 'Movimiento de prueba 360', 1, 994, 23, 'Movimiento de prueba', '2017-10-25 00:00:00'),
(361, 1, 5, 'E', 'Movimiento de prueba 361', 1, 933, 28, 'Movimiento de prueba', '2018-04-01 00:00:00'),
(362, 1, 1, 'S', 'Movimiento de prueba 362', 1, 961, 15, 'Movimiento de prueba', '2018-01-26 00:00:00'),
(363, 1, 2, 'S', 'Movimiento de prueba 363', 1, 980, 28, 'Movimiento de prueba', '2017-09-20 00:00:00'),
(364, 1, 1, 'S', 'Movimiento de prueba 364', 1, 981, 13, 'Movimiento de prueba', '2018-05-05 00:00:00'),
(365, 1, 3, 'E', 'Movimiento de prueba 365', 1, 922, 57, 'Movimiento de prueba', '2017-04-14 00:00:00'),
(366, 1, 4, 'S', 'Movimiento de prueba 366', 1, 989, 22, 'Movimiento de prueba', '2017-11-28 00:00:00'),
(367, 1, 1, 'S', 'Movimiento de prueba 367', 1, 920, 23, 'Movimiento de prueba', '2018-01-28 00:00:00'),
(368, 1, 5, 'S', 'Movimiento de prueba 368', 1, 979, 17, 'Movimiento de prueba', '2017-08-22 00:00:00'),
(369, 1, 3, 'S', 'Movimiento de prueba 369', 1, 921, 30, 'Movimiento de prueba', '2017-10-02 00:00:00'),
(370, 1, 1, 'S', 'Movimiento de prueba 370', 1, 986, 56, 'Movimiento de prueba', '2017-03-29 00:00:00'),
(371, 1, 4, 'E', 'Movimiento de prueba 371', 1, 939, 49, 'Movimiento de prueba', '2018-03-11 00:00:00'),
(372, 1, 4, 'S', 'Movimiento de prueba 372', 1, 933, 49, 'Movimiento de prueba', '2018-05-01 00:00:00'),
(373, 1, 2, 'E', 'Movimiento de prueba 373', 1, 953, 11, 'Movimiento de prueba', '2017-11-20 00:00:00'),
(374, 1, 5, 'S', 'Movimiento de prueba 374', 1, 988, 12, 'Movimiento de prueba', '2017-12-16 00:00:00'),
(375, 1, 6, 'S', 'Movimiento de prueba 375', 1, 980, 55, 'Movimiento de prueba', '2017-04-26 00:00:00'),
(376, 1, 6, 'E', 'Movimiento de prueba 376', 1, 950, 32, 'Movimiento de prueba', '2018-02-19 00:00:00'),
(377, 1, 3, 'S', 'Movimiento de prueba 377', 1, 955, 35, 'Movimiento de prueba', '2018-04-14 00:00:00'),
(378, 1, 5, 'S', 'Movimiento de prueba 378', 1, 920, 31, 'Movimiento de prueba', '2017-10-21 00:00:00'),
(379, 1, 2, 'S', 'Movimiento de prueba 379', 1, 918, 22, 'Movimiento de prueba', '2018-01-07 00:00:00'),
(380, 1, 4, 'S', 'Movimiento de prueba 380', 1, 992, 50, 'Movimiento de prueba', '2017-06-24 00:00:00'),
(381, 1, 5, 'E', 'Movimiento de prueba 381', 1, 935, 44, 'Movimiento de prueba', '2017-09-06 00:00:00'),
(382, 1, 6, 'E', 'Movimiento de prueba 382', 1, 930, 24, 'Movimiento de prueba', '2017-11-07 00:00:00'),
(383, 1, 5, 'E', 'Movimiento de prueba 383', 1, 945, 18, 'Movimiento de prueba', '2017-10-12 00:00:00'),
(384, 1, 6, 'S', 'Movimiento de prueba 384', 1, 931, 40, 'Movimiento de prueba', '2017-04-16 00:00:00'),
(385, 1, 4, 'E', 'Movimiento de prueba 385', 1, 904, 21, 'Movimiento de prueba', '2018-06-07 00:00:00'),
(386, 1, 2, 'E', 'Movimiento de prueba 386', 1, 952, 53, 'Movimiento de prueba', '2018-02-23 00:00:00'),
(387, 1, 2, 'S', 'Movimiento de prueba 387', 1, 943, 46, 'Movimiento de prueba', '2017-08-01 00:00:00'),
(388, 1, 3, 'E', 'Movimiento de prueba 388', 1, 990, 49, 'Movimiento de prueba', '2017-06-29 00:00:00'),
(389, 1, 6, 'S', 'Movimiento de prueba 389', 1, 973, 40, 'Movimiento de prueba', '2018-04-18 00:00:00'),
(390, 1, 4, 'E', 'Movimiento de prueba 390', 1, 990, 20, 'Movimiento de prueba', '2017-07-12 00:00:00'),
(391, 1, 5, 'E', 'Movimiento de prueba 391', 1, 963, 36, 'Movimiento de prueba', '2018-03-02 00:00:00'),
(392, 1, 2, 'E', 'Movimiento de prueba 392', 1, 947, 18, 'Movimiento de prueba', '2017-09-17 00:00:00'),
(393, 1, 4, 'S', 'Movimiento de prueba 393', 1, 935, 21, 'Movimiento de prueba', '2017-03-28 00:00:00'),
(394, 1, 4, 'S', 'Movimiento de prueba 394', 1, 985, 32, 'Movimiento de prueba', '2018-01-08 00:00:00'),
(395, 1, 6, 'S', 'Movimiento de prueba 395', 1, 964, 33, 'Movimiento de prueba', '2017-09-07 00:00:00'),
(396, 1, 4, 'S', 'Movimiento de prueba 396', 1, 957, 21, 'Movimiento de prueba', '2017-09-19 00:00:00'),
(397, 1, 3, 'S', 'Movimiento de prueba 397', 1, 945, 30, 'Movimiento de prueba', '2018-01-07 00:00:00'),
(398, 1, 1, 'E', 'Movimiento de prueba 398', 1, 914, 23, 'Movimiento de prueba', '2018-04-21 00:00:00'),
(399, 1, 4, 'S', 'Movimiento de prueba 399', 1, 961, 38, 'Movimiento de prueba', '2018-06-13 00:00:00'),
(400, 1, 2, 'E', 'Movimiento de prueba 400', 1, 920, 50, 'Movimiento de prueba', '2017-08-30 00:00:00'),
(401, 1, 4, 'E', 'Movimiento de prueba 401', 1, 987, 54, 'Movimiento de prueba', '2018-04-03 00:00:00'),
(402, 1, 4, 'E', 'Movimiento de prueba 402', 1, 935, 19, 'Movimiento de prueba', '2018-04-24 00:00:00'),
(403, 1, 6, 'S', 'Movimiento de prueba 403', 1, 978, 54, 'Movimiento de prueba', '2017-04-03 00:00:00'),
(404, 1, 5, 'E', 'Movimiento de prueba 404', 1, 932, 48, 'Movimiento de prueba', '2018-03-28 00:00:00'),
(405, 1, 6, 'S', 'Movimiento de prueba 405', 1, 998, 17, 'Movimiento de prueba', '2018-02-16 00:00:00'),
(406, 1, 2, 'E', 'Movimiento de prueba 406', 1, 984, 17, 'Movimiento de prueba', '2017-06-14 00:00:00'),
(407, 1, 4, 'S', 'Movimiento de prueba 407', 1, 908, 40, 'Movimiento de prueba', '2018-02-27 00:00:00'),
(408, 1, 1, 'S', 'Movimiento de prueba 408', 1, 922, 36, 'Movimiento de prueba', '2018-05-30 00:00:00'),
(409, 1, 2, 'E', 'Movimiento de prueba 409', 1, 991, 38, 'Movimiento de prueba', '2017-04-10 00:00:00'),
(410, 1, 5, 'E', 'Movimiento de prueba 410', 1, 901, 46, 'Movimiento de prueba', '2017-11-24 00:00:00'),
(411, 1, 5, 'S', 'Movimiento de prueba 411', 1, 950, 30, 'Movimiento de prueba', '2017-10-18 00:00:00'),
(412, 1, 2, 'S', 'Movimiento de prueba 412', 1, 910, 20, 'Movimiento de prueba', '2018-02-01 00:00:00'),
(413, 1, 6, 'S', 'Movimiento de prueba 413', 1, 950, 34, 'Movimiento de prueba', '2018-04-28 00:00:00'),
(414, 1, 1, 'S', 'Movimiento de prueba 414', 1, 963, 35, 'Movimiento de prueba', '2018-01-05 00:00:00'),
(415, 1, 5, 'S', 'Movimiento de prueba 415', 1, 967, 11, 'Movimiento de prueba', '2017-04-22 00:00:00'),
(416, 1, 3, 'S', 'Movimiento de prueba 416', 1, 957, 54, 'Movimiento de prueba', '2018-01-22 00:00:00'),
(417, 1, 5, 'E', 'Movimiento de prueba 417', 1, 987, 17, 'Movimiento de prueba', '2017-04-27 00:00:00'),
(418, 1, 1, 'E', 'Movimiento de prueba 418', 1, 981, 45, 'Movimiento de prueba', '2017-04-03 00:00:00'),
(419, 1, 2, 'S', 'Movimiento de prueba 419', 1, 917, 57, 'Movimiento de prueba', '2017-06-12 00:00:00'),
(420, 1, 2, 'S', 'Movimiento de prueba 420', 1, 913, 56, 'Movimiento de prueba', '2017-07-08 00:00:00'),
(421, 1, 4, 'E', 'Movimiento de prueba 421', 1, 952, 33, 'Movimiento de prueba', '2018-02-19 00:00:00'),
(422, 1, 3, 'S', 'Movimiento de prueba 422', 1, 901, 19, 'Movimiento de prueba', '2018-05-14 00:00:00'),
(423, 1, 1, 'S', 'Movimiento de prueba 423', 1, 959, 24, 'Movimiento de prueba', '2018-01-21 00:00:00'),
(424, 1, 4, 'S', 'Movimiento de prueba 424', 1, 928, 11, 'Movimiento de prueba', '2017-07-20 00:00:00'),
(425, 1, 3, 'E', 'Movimiento de prueba 425', 1, 933, 28, 'Movimiento de prueba', '2018-03-14 00:00:00'),
(426, 1, 6, 'E', 'Movimiento de prueba 426', 1, 941, 26, 'Movimiento de prueba', '2017-09-21 00:00:00'),
(427, 1, 2, 'S', 'Movimiento de prueba 427', 1, 931, 52, 'Movimiento de prueba', '2017-08-11 00:00:00'),
(428, 1, 2, 'S', 'Movimiento de prueba 428', 1, 947, 10, 'Movimiento de prueba', '2017-11-24 00:00:00'),
(429, 1, 6, 'S', 'Movimiento de prueba 429', 1, 905, 45, 'Movimiento de prueba', '2017-08-28 00:00:00'),
(430, 1, 5, 'S', 'Movimiento de prueba 430', 1, 974, 22, 'Movimiento de prueba', '2018-06-07 00:00:00'),
(431, 1, 2, 'S', 'Movimiento de prueba 431', 1, 939, 59, 'Movimiento de prueba', '2018-03-18 00:00:00'),
(432, 1, 1, 'S', 'Movimiento de prueba 432', 1, 920, 29, 'Movimiento de prueba', '2017-08-10 00:00:00'),
(433, 1, 4, 'S', 'Movimiento de prueba 433', 1, 982, 12, 'Movimiento de prueba', '2018-03-13 00:00:00'),
(434, 1, 6, 'S', 'Movimiento de prueba 434', 1, 940, 44, 'Movimiento de prueba', '2017-06-05 00:00:00'),
(435, 1, 6, 'E', 'Movimiento de prueba 435', 1, 922, 32, 'Movimiento de prueba', '2017-11-06 00:00:00'),
(436, 1, 3, 'E', 'Movimiento de prueba 436', 1, 941, 51, 'Movimiento de prueba', '2018-04-24 00:00:00'),
(437, 1, 6, 'E', 'Movimiento de prueba 437', 1, 996, 24, 'Movimiento de prueba', '2017-12-01 00:00:00'),
(438, 1, 1, 'E', 'Movimiento de prueba 438', 1, 905, 59, 'Movimiento de prueba', '2018-02-21 00:00:00'),
(439, 1, 6, 'S', 'Movimiento de prueba 439', 1, 903, 32, 'Movimiento de prueba', '2017-05-20 00:00:00'),
(440, 1, 3, 'S', 'Movimiento de prueba 440', 1, 907, 43, 'Movimiento de prueba', '2017-04-09 00:00:00'),
(441, 1, 3, 'S', 'Movimiento de prueba 441', 1, 932, 51, 'Movimiento de prueba', '2017-05-20 00:00:00'),
(442, 1, 3, 'E', 'Movimiento de prueba 442', 1, 960, 59, 'Movimiento de prueba', '2017-04-14 00:00:00'),
(443, 1, 4, 'E', 'Movimiento de prueba 443', 1, 938, 46, 'Movimiento de prueba', '2017-10-03 00:00:00'),
(444, 1, 1, 'E', 'Movimiento de prueba 444', 1, 901, 21, 'Movimiento de prueba', '2017-04-08 00:00:00'),
(445, 1, 5, 'E', 'Movimiento de prueba 445', 1, 998, 39, 'Movimiento de prueba', '2017-03-07 00:00:00'),
(446, 1, 2, 'E', 'Movimiento de prueba 446', 1, 927, 13, 'Movimiento de prueba', '2017-11-03 00:00:00'),
(447, 1, 3, 'S', 'Movimiento de prueba 447', 1, 933, 17, 'Movimiento de prueba', '2018-01-20 00:00:00'),
(448, 1, 1, 'E', 'Movimiento de prueba 448', 1, 918, 48, 'Movimiento de prueba', '2017-07-30 00:00:00'),
(449, 1, 2, 'E', 'Movimiento de prueba 449', 1, 925, 11, 'Movimiento de prueba', '2017-08-08 00:00:00'),
(450, 1, 4, 'E', 'Movimiento de prueba 450', 1, 997, 26, 'Movimiento de prueba', '2018-02-04 00:00:00'),
(451, 1, 4, 'S', 'Movimiento de prueba 451', 1, 996, 55, 'Movimiento de prueba', '2017-12-18 00:00:00'),
(452, 1, 3, 'E', 'Movimiento de prueba 452', 1, 961, 37, 'Movimiento de prueba', '2018-05-22 00:00:00'),
(453, 1, 1, 'S', 'Movimiento de prueba 453', 1, 954, 12, 'Movimiento de prueba', '2018-01-03 00:00:00'),
(454, 1, 1, 'S', 'Movimiento de prueba 454', 1, 940, 28, 'Movimiento de prueba', '2018-01-22 00:00:00'),
(455, 1, 3, 'S', 'Movimiento de prueba 455', 1, 996, 12, 'Movimiento de prueba', '2017-08-05 00:00:00'),
(456, 1, 4, 'S', 'Movimiento de prueba 456', 1, 976, 50, 'Movimiento de prueba', '2018-02-05 00:00:00'),
(457, 1, 2, 'S', 'Movimiento de prueba 457', 1, 972, 59, 'Movimiento de prueba', '2018-03-28 00:00:00'),
(458, 1, 2, 'E', 'Movimiento de prueba 458', 1, 919, 57, 'Movimiento de prueba', '2017-06-01 00:00:00'),
(459, 1, 1, 'S', 'Movimiento de prueba 459', 1, 949, 39, 'Movimiento de prueba', '2017-10-11 00:00:00'),
(460, 1, 4, 'S', 'Movimiento de prueba 460', 1, 903, 33, 'Movimiento de prueba', '2017-07-14 00:00:00'),
(461, 1, 1, 'E', 'Movimiento de prueba 461', 1, 970, 14, 'Movimiento de prueba', '2017-08-09 00:00:00'),
(462, 1, 3, 'E', 'Movimiento de prueba 462', 1, 967, 48, 'Movimiento de prueba', '2018-03-08 00:00:00'),
(463, 1, 5, 'S', 'Movimiento de prueba 463', 1, 985, 27, 'Movimiento de prueba', '2017-06-11 00:00:00'),
(464, 1, 1, 'E', 'Movimiento de prueba 464', 1, 911, 23, 'Movimiento de prueba', '2017-03-08 00:00:00'),
(465, 1, 2, 'E', 'Movimiento de prueba 465', 1, 963, 25, 'Movimiento de prueba', '2018-01-05 00:00:00'),
(466, 1, 3, 'S', 'Movimiento de prueba 466', 1, 905, 49, 'Movimiento de prueba', '2018-03-14 00:00:00'),
(467, 1, 4, 'S', 'Movimiento de prueba 467', 1, 986, 14, 'Movimiento de prueba', '2018-03-24 00:00:00'),
(468, 1, 6, 'S', 'Movimiento de prueba 468', 1, 961, 38, 'Movimiento de prueba', '2018-05-24 00:00:00'),
(469, 1, 1, 'S', 'Movimiento de prueba 469', 1, 968, 42, 'Movimiento de prueba', '2017-06-08 00:00:00'),
(470, 1, 1, 'S', 'Movimiento de prueba 470', 1, 991, 13, 'Movimiento de prueba', '2017-11-18 00:00:00'),
(471, 1, 4, 'E', 'Movimiento de prueba 471', 1, 990, 35, 'Movimiento de prueba', '2018-03-29 00:00:00'),
(472, 1, 4, 'S', 'Movimiento de prueba 472', 1, 953, 39, 'Movimiento de prueba', '2017-09-03 00:00:00'),
(473, 1, 2, 'S', 'Movimiento de prueba 473', 1, 911, 27, 'Movimiento de prueba', '2017-09-18 00:00:00'),
(474, 1, 1, 'E', 'Movimiento de prueba 474', 1, 944, 50, 'Movimiento de prueba', '2018-02-03 00:00:00'),
(475, 1, 2, 'S', 'Movimiento de prueba 475', 1, 995, 44, 'Movimiento de prueba', '2017-11-25 00:00:00'),
(476, 1, 5, 'E', 'Movimiento de prueba 476', 1, 907, 34, 'Movimiento de prueba', '2017-06-05 00:00:00'),
(477, 1, 4, 'E', 'Movimiento de prueba 477', 1, 937, 21, 'Movimiento de prueba', '2017-03-27 00:00:00'),
(478, 1, 4, 'S', 'Movimiento de prueba 478', 1, 971, 35, 'Movimiento de prueba', '2017-09-21 00:00:00'),
(479, 1, 4, 'S', 'Movimiento de prueba 479', 1, 921, 41, 'Movimiento de prueba', '2017-10-13 00:00:00'),
(480, 1, 4, 'E', 'Movimiento de prueba 480', 1, 934, 18, 'Movimiento de prueba', '2018-03-01 00:00:00'),
(481, 1, 3, 'S', 'Movimiento de prueba 481', 1, 910, 37, 'Movimiento de prueba', '2017-09-26 00:00:00'),
(482, 1, 4, 'S', 'Movimiento de prueba 482', 1, 981, 39, 'Movimiento de prueba', '2017-10-06 00:00:00'),
(483, 1, 4, 'E', 'Movimiento de prueba 483', 1, 962, 45, 'Movimiento de prueba', '2018-01-08 00:00:00'),
(484, 1, 2, 'E', 'Movimiento de prueba 484', 1, 968, 21, 'Movimiento de prueba', '2017-04-08 00:00:00'),
(485, 1, 5, 'E', 'Movimiento de prueba 485', 1, 983, 57, 'Movimiento de prueba', '2017-06-14 00:00:00');
INSERT INTO `kardexalmhuevo` (`idAlmacenHuevos`, `idcolaborador`, `idhuevo`, `tipomovimiento`, `motivomovimiento`, `idlote`, `stockProducto`, `cantidad`, `descripcion`, `creado`) VALUES
(486, 1, 2, 'S', 'Movimiento de prueba 486', 1, 995, 33, 'Movimiento de prueba', '2017-11-07 00:00:00'),
(487, 1, 2, 'S', 'Movimiento de prueba 487', 1, 920, 24, 'Movimiento de prueba', '2018-03-25 00:00:00'),
(488, 1, 2, 'S', 'Movimiento de prueba 488', 1, 930, 12, 'Movimiento de prueba', '2017-09-01 00:00:00'),
(489, 1, 5, 'S', 'Movimiento de prueba 489', 1, 933, 32, 'Movimiento de prueba', '2017-06-21 00:00:00'),
(490, 1, 6, 'S', 'Movimiento de prueba 490', 1, 928, 45, 'Movimiento de prueba', '2018-01-05 00:00:00'),
(491, 1, 2, 'S', 'Movimiento de prueba 491', 1, 933, 45, 'Movimiento de prueba', '2017-11-20 00:00:00'),
(492, 1, 5, 'S', 'Movimiento de prueba 492', 1, 934, 45, 'Movimiento de prueba', '2017-11-02 00:00:00'),
(493, 1, 3, 'S', 'Movimiento de prueba 493', 1, 966, 54, 'Movimiento de prueba', '2017-09-19 00:00:00'),
(494, 1, 3, 'E', 'Movimiento de prueba 494', 1, 928, 58, 'Movimiento de prueba', '2018-05-25 00:00:00'),
(495, 1, 6, 'S', 'Movimiento de prueba 495', 1, 941, 20, 'Movimiento de prueba', '2018-03-08 00:00:00'),
(496, 1, 3, 'E', 'Movimiento de prueba 496', 1, 953, 47, 'Movimiento de prueba', '2017-05-11 00:00:00'),
(497, 1, 4, 'E', 'Movimiento de prueba 497', 1, 975, 41, 'Movimiento de prueba', '2018-05-05 00:00:00'),
(498, 1, 4, 'S', 'Movimiento de prueba 498', 1, 963, 41, 'Movimiento de prueba', '2017-07-02 00:00:00'),
(499, 1, 3, 'E', 'Movimiento de prueba 499', 1, 989, 51, 'Movimiento de prueba', '2017-09-24 00:00:00'),
(500, 1, 5, 'E', 'Movimiento de prueba 500', 1, 936, 55, 'Movimiento de prueba', '2017-09-19 00:00:00'),
(501, 1, 3, 'S', 'Movimiento de prueba 1', 2, 906, 45, 'Movimiento de prueba', '2018-11-05 00:00:00'),
(502, 1, 3, 'E', 'Movimiento de prueba 2', 2, 983, 49, 'Movimiento de prueba', '2019-01-18 00:00:00'),
(503, 1, 1, 'S', 'Movimiento de prueba 3', 2, 928, 31, 'Movimiento de prueba', '2018-10-15 00:00:00'),
(504, 1, 1, 'S', 'Movimiento de prueba 4', 2, 958, 21, 'Movimiento de prueba', '2018-11-23 00:00:00'),
(505, 1, 1, 'S', 'Movimiento de prueba 5', 2, 947, 43, 'Movimiento de prueba', '2019-08-14 00:00:00'),
(506, 1, 5, 'S', 'Movimiento de prueba 6', 2, 989, 46, 'Movimiento de prueba', '2019-08-04 00:00:00'),
(507, 1, 3, 'E', 'Movimiento de prueba 7', 2, 957, 47, 'Movimiento de prueba', '2018-07-07 00:00:00'),
(508, 1, 6, 'S', 'Movimiento de prueba 8', 2, 995, 30, 'Movimiento de prueba', '2018-09-29 00:00:00'),
(509, 1, 6, 'S', 'Movimiento de prueba 9', 2, 965, 41, 'Movimiento de prueba', '2018-09-10 00:00:00'),
(510, 1, 1, 'S', 'Movimiento de prueba 10', 2, 972, 22, 'Movimiento de prueba', '2018-07-29 00:00:00'),
(511, 1, 5, 'E', 'Movimiento de prueba 11', 2, 956, 48, 'Movimiento de prueba', '2018-08-07 00:00:00'),
(512, 1, 2, 'E', 'Movimiento de prueba 12', 2, 998, 29, 'Movimiento de prueba', '2019-08-28 00:00:00'),
(513, 1, 5, 'S', 'Movimiento de prueba 13', 2, 986, 37, 'Movimiento de prueba', '2018-08-09 00:00:00'),
(514, 1, 6, 'S', 'Movimiento de prueba 14', 2, 980, 27, 'Movimiento de prueba', '2018-12-04 00:00:00'),
(515, 1, 6, 'E', 'Movimiento de prueba 15', 2, 974, 38, 'Movimiento de prueba', '2019-03-20 00:00:00'),
(516, 1, 3, 'S', 'Movimiento de prueba 16', 2, 987, 29, 'Movimiento de prueba', '2018-11-03 00:00:00'),
(517, 1, 3, 'E', 'Movimiento de prueba 17', 2, 917, 42, 'Movimiento de prueba', '2019-05-01 00:00:00'),
(518, 1, 4, 'S', 'Movimiento de prueba 18', 2, 970, 49, 'Movimiento de prueba', '2019-07-04 00:00:00'),
(519, 1, 6, 'S', 'Movimiento de prueba 19', 2, 968, 50, 'Movimiento de prueba', '2018-06-30 00:00:00'),
(520, 1, 5, 'S', 'Movimiento de prueba 20', 2, 935, 22, 'Movimiento de prueba', '2018-08-26 00:00:00'),
(521, 1, 1, 'S', 'Movimiento de prueba 21', 2, 929, 48, 'Movimiento de prueba', '2019-08-28 00:00:00'),
(522, 1, 4, 'S', 'Movimiento de prueba 22', 2, 938, 35, 'Movimiento de prueba', '2018-11-22 00:00:00'),
(523, 1, 2, 'E', 'Movimiento de prueba 23', 2, 968, 36, 'Movimiento de prueba', '2019-02-23 00:00:00'),
(524, 1, 2, 'E', 'Movimiento de prueba 24', 2, 969, 12, 'Movimiento de prueba', '2018-08-09 00:00:00'),
(525, 1, 3, 'E', 'Movimiento de prueba 25', 2, 998, 42, 'Movimiento de prueba', '2018-10-20 00:00:00'),
(526, 1, 3, 'E', 'Movimiento de prueba 26', 2, 906, 51, 'Movimiento de prueba', '2019-09-03 00:00:00'),
(527, 1, 3, 'E', 'Movimiento de prueba 27', 2, 952, 17, 'Movimiento de prueba', '2018-09-10 00:00:00'),
(528, 1, 4, 'S', 'Movimiento de prueba 28', 2, 923, 26, 'Movimiento de prueba', '2019-08-08 00:00:00'),
(529, 1, 4, 'S', 'Movimiento de prueba 29', 2, 953, 18, 'Movimiento de prueba', '2018-10-01 00:00:00'),
(530, 1, 5, 'S', 'Movimiento de prueba 30', 2, 973, 29, 'Movimiento de prueba', '2019-05-20 00:00:00'),
(531, 1, 4, 'S', 'Movimiento de prueba 31', 2, 947, 32, 'Movimiento de prueba', '2019-06-22 00:00:00'),
(532, 1, 5, 'E', 'Movimiento de prueba 32', 2, 954, 41, 'Movimiento de prueba', '2019-02-07 00:00:00'),
(533, 1, 5, 'E', 'Movimiento de prueba 33', 2, 901, 58, 'Movimiento de prueba', '2019-06-29 00:00:00'),
(534, 1, 2, 'S', 'Movimiento de prueba 34', 2, 909, 18, 'Movimiento de prueba', '2019-02-07 00:00:00'),
(535, 1, 1, 'E', 'Movimiento de prueba 35', 2, 909, 18, 'Movimiento de prueba', '2019-02-07 00:00:00'),
(536, 1, 1, 'E', 'Movimiento de prueba 36', 2, 936, 27, 'Movimiento de prueba', '2019-04-19 00:00:00'),
(537, 1, 3, 'S', 'Movimiento de prueba 37', 2, 925, 24, 'Movimiento de prueba', '2019-04-28 00:00:00'),
(538, 1, 4, 'E', 'Movimiento de prueba 38', 2, 951, 26, 'Movimiento de prueba', '2018-07-18 00:00:00'),
(539, 1, 3, 'S', 'Movimiento de prueba 39', 2, 963, 53, 'Movimiento de prueba', '2018-12-22 00:00:00'),
(540, 1, 4, 'E', 'Movimiento de prueba 40', 2, 901, 16, 'Movimiento de prueba', '2019-03-09 00:00:00'),
(541, 1, 4, 'E', 'Movimiento de prueba 41', 2, 995, 26, 'Movimiento de prueba', '2019-06-27 00:00:00'),
(542, 1, 1, 'E', 'Movimiento de prueba 42', 2, 905, 26, 'Movimiento de prueba', '2019-01-31 00:00:00'),
(543, 1, 4, 'E', 'Movimiento de prueba 43', 2, 941, 31, 'Movimiento de prueba', '2019-07-17 00:00:00'),
(544, 1, 1, 'E', 'Movimiento de prueba 44', 2, 972, 37, 'Movimiento de prueba', '2019-02-26 00:00:00'),
(545, 1, 2, 'E', 'Movimiento de prueba 45', 2, 968, 43, 'Movimiento de prueba', '2018-10-28 00:00:00'),
(546, 1, 3, 'S', 'Movimiento de prueba 46', 2, 914, 18, 'Movimiento de prueba', '2019-01-06 00:00:00'),
(547, 1, 5, 'E', 'Movimiento de prueba 47', 2, 940, 12, 'Movimiento de prueba', '2018-06-28 00:00:00'),
(548, 1, 1, 'S', 'Movimiento de prueba 48', 2, 971, 47, 'Movimiento de prueba', '2019-03-08 00:00:00'),
(549, 1, 5, 'S', 'Movimiento de prueba 49', 2, 961, 52, 'Movimiento de prueba', '2018-12-10 00:00:00'),
(550, 1, 3, 'S', 'Movimiento de prueba 50', 2, 947, 36, 'Movimiento de prueba', '2018-09-12 00:00:00'),
(551, 1, 3, 'E', 'Movimiento de prueba 51', 2, 912, 20, 'Movimiento de prueba', '2019-04-04 00:00:00'),
(552, 1, 4, 'E', 'Movimiento de prueba 52', 2, 917, 20, 'Movimiento de prueba', '2019-03-03 00:00:00'),
(553, 1, 2, 'E', 'Movimiento de prueba 53', 2, 956, 33, 'Movimiento de prueba', '2019-04-11 00:00:00'),
(554, 1, 6, 'S', 'Movimiento de prueba 54', 2, 984, 44, 'Movimiento de prueba', '2019-08-12 00:00:00'),
(555, 1, 4, 'E', 'Movimiento de prueba 55', 2, 924, 40, 'Movimiento de prueba', '2018-10-10 00:00:00'),
(556, 1, 3, 'S', 'Movimiento de prueba 56', 2, 909, 25, 'Movimiento de prueba', '2018-10-14 00:00:00'),
(557, 1, 3, 'E', 'Movimiento de prueba 57', 2, 916, 58, 'Movimiento de prueba', '2018-11-26 00:00:00'),
(558, 1, 6, 'E', 'Movimiento de prueba 58', 2, 939, 46, 'Movimiento de prueba', '2019-01-16 00:00:00'),
(559, 1, 2, 'E', 'Movimiento de prueba 59', 2, 984, 49, 'Movimiento de prueba', '2018-12-19 00:00:00'),
(560, 1, 5, 'E', 'Movimiento de prueba 60', 2, 920, 21, 'Movimiento de prueba', '2019-02-23 00:00:00'),
(561, 1, 1, 'S', 'Movimiento de prueba 61', 2, 988, 55, 'Movimiento de prueba', '2019-07-25 00:00:00'),
(562, 1, 5, 'E', 'Movimiento de prueba 62', 2, 906, 15, 'Movimiento de prueba', '2018-12-12 00:00:00'),
(563, 1, 4, 'E', 'Movimiento de prueba 63', 2, 925, 17, 'Movimiento de prueba', '2019-09-03 00:00:00'),
(564, 1, 3, 'E', 'Movimiento de prueba 64', 2, 985, 55, 'Movimiento de prueba', '2019-08-12 00:00:00'),
(565, 1, 6, 'E', 'Movimiento de prueba 65', 2, 941, 53, 'Movimiento de prueba', '2018-07-15 00:00:00'),
(566, 1, 5, 'S', 'Movimiento de prueba 66', 2, 959, 22, 'Movimiento de prueba', '2019-01-09 00:00:00'),
(567, 1, 4, 'E', 'Movimiento de prueba 67', 2, 941, 49, 'Movimiento de prueba', '2019-05-25 00:00:00'),
(568, 1, 3, 'S', 'Movimiento de prueba 68', 2, 966, 59, 'Movimiento de prueba', '2019-09-03 00:00:00'),
(569, 1, 6, 'S', 'Movimiento de prueba 69', 2, 968, 28, 'Movimiento de prueba', '2019-05-13 00:00:00'),
(570, 1, 4, 'S', 'Movimiento de prueba 70', 2, 902, 52, 'Movimiento de prueba', '2018-09-07 00:00:00'),
(571, 1, 3, 'E', 'Movimiento de prueba 71', 2, 945, 26, 'Movimiento de prueba', '2018-11-04 00:00:00'),
(572, 1, 4, 'S', 'Movimiento de prueba 72', 2, 972, 59, 'Movimiento de prueba', '2019-05-10 00:00:00'),
(573, 1, 5, 'E', 'Movimiento de prueba 73', 2, 934, 53, 'Movimiento de prueba', '2018-11-10 00:00:00'),
(574, 1, 1, 'E', 'Movimiento de prueba 74', 2, 962, 45, 'Movimiento de prueba', '2019-04-03 00:00:00'),
(575, 1, 1, 'S', 'Movimiento de prueba 75', 2, 902, 14, 'Movimiento de prueba', '2018-11-11 00:00:00'),
(576, 1, 3, 'E', 'Movimiento de prueba 76', 2, 917, 41, 'Movimiento de prueba', '2019-03-20 00:00:00'),
(577, 1, 2, 'E', 'Movimiento de prueba 77', 2, 994, 30, 'Movimiento de prueba', '2018-09-19 00:00:00'),
(578, 1, 6, 'S', 'Movimiento de prueba 78', 2, 927, 44, 'Movimiento de prueba', '2019-04-07 00:00:00'),
(579, 1, 2, 'S', 'Movimiento de prueba 79', 2, 936, 53, 'Movimiento de prueba', '2018-10-04 00:00:00'),
(580, 1, 4, 'E', 'Movimiento de prueba 80', 2, 998, 50, 'Movimiento de prueba', '2018-08-09 00:00:00'),
(581, 1, 2, 'E', 'Movimiento de prueba 81', 2, 989, 12, 'Movimiento de prueba', '2019-02-03 00:00:00'),
(582, 1, 3, 'S', 'Movimiento de prueba 82', 2, 929, 22, 'Movimiento de prueba', '2018-12-19 00:00:00'),
(583, 1, 2, 'E', 'Movimiento de prueba 83', 2, 940, 22, 'Movimiento de prueba', '2018-07-07 00:00:00'),
(584, 1, 3, 'E', 'Movimiento de prueba 84', 2, 995, 56, 'Movimiento de prueba', '2019-05-27 00:00:00'),
(585, 1, 1, 'S', 'Movimiento de prueba 85', 2, 974, 47, 'Movimiento de prueba', '2019-02-18 00:00:00'),
(586, 1, 3, 'S', 'Movimiento de prueba 86', 2, 943, 52, 'Movimiento de prueba', '2019-08-15 00:00:00'),
(587, 1, 1, 'S', 'Movimiento de prueba 87', 2, 948, 30, 'Movimiento de prueba', '2019-04-06 00:00:00'),
(588, 1, 1, 'E', 'Movimiento de prueba 88', 2, 943, 53, 'Movimiento de prueba', '2018-07-28 00:00:00'),
(589, 1, 6, 'S', 'Movimiento de prueba 89', 2, 917, 11, 'Movimiento de prueba', '2019-04-12 00:00:00'),
(590, 1, 2, 'E', 'Movimiento de prueba 90', 2, 994, 28, 'Movimiento de prueba', '2019-09-05 00:00:00'),
(591, 1, 6, 'E', 'Movimiento de prueba 91', 2, 979, 18, 'Movimiento de prueba', '2019-01-23 00:00:00'),
(592, 1, 6, 'E', 'Movimiento de prueba 92', 2, 916, 21, 'Movimiento de prueba', '2019-04-30 00:00:00'),
(593, 1, 5, 'S', 'Movimiento de prueba 93', 2, 939, 14, 'Movimiento de prueba', '2018-09-15 00:00:00'),
(594, 1, 5, 'E', 'Movimiento de prueba 94', 2, 923, 20, 'Movimiento de prueba', '2018-11-11 00:00:00'),
(595, 1, 1, 'E', 'Movimiento de prueba 95', 2, 990, 55, 'Movimiento de prueba', '2019-07-12 00:00:00'),
(596, 1, 4, 'E', 'Movimiento de prueba 96', 2, 993, 42, 'Movimiento de prueba', '2018-12-26 00:00:00'),
(597, 1, 2, 'S', 'Movimiento de prueba 97', 2, 916, 37, 'Movimiento de prueba', '2018-09-30 00:00:00'),
(598, 1, 4, 'E', 'Movimiento de prueba 98', 2, 960, 52, 'Movimiento de prueba', '2018-12-26 00:00:00'),
(599, 1, 4, 'S', 'Movimiento de prueba 99', 2, 903, 53, 'Movimiento de prueba', '2018-09-24 00:00:00'),
(600, 1, 4, 'S', 'Movimiento de prueba 100', 2, 993, 59, 'Movimiento de prueba', '2018-08-27 00:00:00'),
(601, 1, 5, 'S', 'Movimiento de prueba 101', 2, 979, 10, 'Movimiento de prueba', '2019-04-11 00:00:00'),
(602, 1, 2, 'E', 'Movimiento de prueba 102', 2, 949, 12, 'Movimiento de prueba', '2019-05-11 00:00:00'),
(603, 1, 4, 'E', 'Movimiento de prueba 103', 2, 962, 50, 'Movimiento de prueba', '2018-09-18 00:00:00'),
(604, 1, 4, 'E', 'Movimiento de prueba 104', 2, 900, 56, 'Movimiento de prueba', '2019-04-10 00:00:00'),
(605, 1, 4, 'S', 'Movimiento de prueba 105', 2, 923, 36, 'Movimiento de prueba', '2019-07-25 00:00:00'),
(606, 1, 6, 'S', 'Movimiento de prueba 106', 2, 991, 47, 'Movimiento de prueba', '2018-07-02 00:00:00'),
(607, 1, 6, 'E', 'Movimiento de prueba 107', 2, 969, 59, 'Movimiento de prueba', '2019-07-05 00:00:00'),
(608, 1, 2, 'S', 'Movimiento de prueba 108', 2, 904, 21, 'Movimiento de prueba', '2018-07-12 00:00:00'),
(609, 1, 4, 'S', 'Movimiento de prueba 109', 2, 999, 46, 'Movimiento de prueba', '2019-04-03 00:00:00'),
(610, 1, 1, 'E', 'Movimiento de prueba 110', 2, 948, 30, 'Movimiento de prueba', '2019-03-30 00:00:00'),
(611, 1, 6, 'S', 'Movimiento de prueba 111', 2, 923, 46, 'Movimiento de prueba', '2019-08-18 00:00:00'),
(612, 1, 4, 'S', 'Movimiento de prueba 112', 2, 993, 56, 'Movimiento de prueba', '2019-07-15 00:00:00'),
(613, 1, 4, 'E', 'Movimiento de prueba 113', 2, 909, 10, 'Movimiento de prueba', '2019-06-08 00:00:00'),
(614, 1, 6, 'E', 'Movimiento de prueba 114', 2, 931, 57, 'Movimiento de prueba', '2019-05-26 00:00:00'),
(615, 1, 6, 'S', 'Movimiento de prueba 115', 2, 938, 55, 'Movimiento de prueba', '2018-12-23 00:00:00'),
(616, 1, 3, 'S', 'Movimiento de prueba 116', 2, 978, 19, 'Movimiento de prueba', '2019-03-05 00:00:00'),
(617, 1, 3, 'E', 'Movimiento de prueba 117', 2, 999, 56, 'Movimiento de prueba', '2019-04-22 00:00:00'),
(618, 1, 4, 'E', 'Movimiento de prueba 118', 2, 983, 46, 'Movimiento de prueba', '2018-08-20 00:00:00'),
(619, 1, 4, 'E', 'Movimiento de prueba 119', 2, 957, 19, 'Movimiento de prueba', '2018-09-03 00:00:00'),
(620, 1, 3, 'E', 'Movimiento de prueba 120', 2, 978, 31, 'Movimiento de prueba', '2019-06-19 00:00:00'),
(621, 1, 5, 'E', 'Movimiento de prueba 121', 2, 910, 12, 'Movimiento de prueba', '2019-07-31 00:00:00'),
(622, 1, 3, 'E', 'Movimiento de prueba 122', 2, 939, 59, 'Movimiento de prueba', '2019-05-26 00:00:00'),
(623, 1, 6, 'E', 'Movimiento de prueba 123', 2, 944, 19, 'Movimiento de prueba', '2019-04-03 00:00:00'),
(624, 1, 4, 'E', 'Movimiento de prueba 124', 2, 964, 23, 'Movimiento de prueba', '2018-12-18 00:00:00'),
(625, 1, 2, 'E', 'Movimiento de prueba 125', 2, 931, 37, 'Movimiento de prueba', '2019-06-18 00:00:00'),
(626, 1, 3, 'S', 'Movimiento de prueba 126', 2, 988, 36, 'Movimiento de prueba', '2018-06-19 00:00:00'),
(627, 1, 3, 'E', 'Movimiento de prueba 127', 2, 994, 56, 'Movimiento de prueba', '2019-07-07 00:00:00'),
(628, 1, 3, 'S', 'Movimiento de prueba 128', 2, 942, 50, 'Movimiento de prueba', '2019-06-21 00:00:00'),
(629, 1, 4, 'S', 'Movimiento de prueba 129', 2, 902, 46, 'Movimiento de prueba', '2019-02-22 00:00:00'),
(630, 1, 4, 'E', 'Movimiento de prueba 130', 2, 915, 38, 'Movimiento de prueba', '2018-12-23 00:00:00'),
(631, 1, 3, 'S', 'Movimiento de prueba 131', 2, 908, 34, 'Movimiento de prueba', '2018-09-16 00:00:00'),
(632, 1, 4, 'E', 'Movimiento de prueba 132', 2, 910, 13, 'Movimiento de prueba', '2018-07-14 00:00:00'),
(633, 1, 1, 'E', 'Movimiento de prueba 133', 2, 900, 22, 'Movimiento de prueba', '2018-09-28 00:00:00'),
(634, 1, 3, 'E', 'Movimiento de prueba 134', 2, 988, 16, 'Movimiento de prueba', '2019-08-20 00:00:00'),
(635, 1, 3, 'E', 'Movimiento de prueba 135', 2, 969, 55, 'Movimiento de prueba', '2019-01-30 00:00:00'),
(636, 1, 5, 'E', 'Movimiento de prueba 136', 2, 966, 15, 'Movimiento de prueba', '2019-02-23 00:00:00'),
(637, 1, 3, 'S', 'Movimiento de prueba 137', 2, 994, 44, 'Movimiento de prueba', '2019-03-31 00:00:00'),
(638, 1, 1, 'S', 'Movimiento de prueba 138', 2, 908, 28, 'Movimiento de prueba', '2019-03-15 00:00:00'),
(639, 1, 6, 'S', 'Movimiento de prueba 139', 2, 971, 36, 'Movimiento de prueba', '2019-02-13 00:00:00'),
(640, 1, 1, 'S', 'Movimiento de prueba 140', 2, 964, 54, 'Movimiento de prueba', '2019-02-03 00:00:00'),
(641, 1, 6, 'E', 'Movimiento de prueba 141', 2, 945, 18, 'Movimiento de prueba', '2018-12-31 00:00:00'),
(642, 1, 5, 'E', 'Movimiento de prueba 142', 2, 913, 54, 'Movimiento de prueba', '2018-07-19 00:00:00'),
(643, 1, 5, 'E', 'Movimiento de prueba 143', 2, 911, 53, 'Movimiento de prueba', '2018-06-18 00:00:00'),
(644, 1, 3, 'E', 'Movimiento de prueba 144', 2, 907, 19, 'Movimiento de prueba', '2019-05-16 00:00:00'),
(645, 1, 1, 'E', 'Movimiento de prueba 145', 2, 964, 10, 'Movimiento de prueba', '2018-07-22 00:00:00'),
(646, 1, 3, 'S', 'Movimiento de prueba 146', 2, 967, 10, 'Movimiento de prueba', '2018-07-25 00:00:00'),
(647, 1, 3, 'S', 'Movimiento de prueba 147', 2, 918, 54, 'Movimiento de prueba', '2019-08-14 00:00:00'),
(648, 1, 1, 'E', 'Movimiento de prueba 148', 2, 926, 37, 'Movimiento de prueba', '2019-08-11 00:00:00'),
(649, 1, 1, 'E', 'Movimiento de prueba 149', 2, 971, 34, 'Movimiento de prueba', '2018-11-04 00:00:00'),
(650, 1, 1, 'S', 'Movimiento de prueba 150', 2, 938, 25, 'Movimiento de prueba', '2018-11-30 00:00:00'),
(651, 1, 6, 'S', 'Movimiento de prueba 151', 2, 935, 52, 'Movimiento de prueba', '2018-08-20 00:00:00'),
(652, 1, 2, 'S', 'Movimiento de prueba 152', 2, 936, 10, 'Movimiento de prueba', '2018-06-16 00:00:00'),
(653, 1, 6, 'S', 'Movimiento de prueba 153', 2, 911, 18, 'Movimiento de prueba', '2019-01-16 00:00:00'),
(654, 1, 6, 'E', 'Movimiento de prueba 154', 2, 947, 24, 'Movimiento de prueba', '2019-09-07 00:00:00'),
(655, 1, 1, 'S', 'Movimiento de prueba 155', 2, 981, 18, 'Movimiento de prueba', '2018-11-29 00:00:00'),
(656, 1, 3, 'S', 'Movimiento de prueba 156', 2, 950, 27, 'Movimiento de prueba', '2018-10-08 00:00:00'),
(657, 1, 2, 'E', 'Movimiento de prueba 157', 2, 999, 10, 'Movimiento de prueba', '2018-06-20 00:00:00'),
(658, 1, 1, 'E', 'Movimiento de prueba 158', 2, 998, 21, 'Movimiento de prueba', '2018-10-01 00:00:00'),
(659, 1, 3, 'S', 'Movimiento de prueba 159', 2, 909, 26, 'Movimiento de prueba', '2018-11-26 00:00:00'),
(660, 1, 5, 'E', 'Movimiento de prueba 160', 2, 986, 15, 'Movimiento de prueba', '2019-08-16 00:00:00'),
(661, 1, 3, 'E', 'Movimiento de prueba 161', 2, 975, 19, 'Movimiento de prueba', '2019-04-02 00:00:00'),
(662, 1, 5, 'E', 'Movimiento de prueba 162', 2, 937, 30, 'Movimiento de prueba', '2019-08-19 00:00:00'),
(663, 1, 4, 'S', 'Movimiento de prueba 163', 2, 911, 29, 'Movimiento de prueba', '2019-03-03 00:00:00'),
(664, 1, 5, 'S', 'Movimiento de prueba 164', 2, 938, 18, 'Movimiento de prueba', '2019-04-18 00:00:00'),
(665, 1, 6, 'E', 'Movimiento de prueba 165', 2, 971, 16, 'Movimiento de prueba', '2019-01-11 00:00:00'),
(666, 1, 6, 'E', 'Movimiento de prueba 166', 2, 913, 33, 'Movimiento de prueba', '2019-08-06 00:00:00'),
(667, 1, 2, 'E', 'Movimiento de prueba 167', 2, 903, 17, 'Movimiento de prueba', '2019-03-22 00:00:00'),
(668, 1, 5, 'E', 'Movimiento de prueba 168', 2, 938, 34, 'Movimiento de prueba', '2018-10-15 00:00:00'),
(669, 1, 6, 'S', 'Movimiento de prueba 169', 2, 972, 38, 'Movimiento de prueba', '2019-04-20 00:00:00'),
(670, 1, 5, 'E', 'Movimiento de prueba 170', 2, 931, 15, 'Movimiento de prueba', '2019-03-08 00:00:00'),
(671, 1, 4, 'E', 'Movimiento de prueba 171', 2, 905, 14, 'Movimiento de prueba', '2018-10-31 00:00:00'),
(672, 1, 2, 'E', 'Movimiento de prueba 172', 2, 997, 52, 'Movimiento de prueba', '2018-11-03 00:00:00'),
(673, 1, 1, 'E', 'Movimiento de prueba 173', 2, 964, 51, 'Movimiento de prueba', '2018-09-10 00:00:00'),
(674, 1, 3, 'S', 'Movimiento de prueba 174', 2, 975, 21, 'Movimiento de prueba', '2019-07-22 00:00:00'),
(675, 1, 5, 'E', 'Movimiento de prueba 175', 2, 955, 22, 'Movimiento de prueba', '2019-03-16 00:00:00'),
(676, 1, 2, 'S', 'Movimiento de prueba 176', 2, 998, 22, 'Movimiento de prueba', '2018-10-23 00:00:00'),
(677, 1, 5, 'S', 'Movimiento de prueba 177', 2, 993, 53, 'Movimiento de prueba', '2019-01-31 00:00:00'),
(678, 1, 6, 'E', 'Movimiento de prueba 178', 2, 947, 37, 'Movimiento de prueba', '2018-10-30 00:00:00'),
(679, 1, 6, 'S', 'Movimiento de prueba 179', 2, 911, 54, 'Movimiento de prueba', '2018-08-12 00:00:00'),
(680, 1, 6, 'E', 'Movimiento de prueba 180', 2, 924, 57, 'Movimiento de prueba', '2019-08-31 00:00:00'),
(681, 1, 1, 'E', 'Movimiento de prueba 181', 2, 978, 46, 'Movimiento de prueba', '2018-10-19 00:00:00'),
(682, 1, 2, 'E', 'Movimiento de prueba 182', 2, 970, 44, 'Movimiento de prueba', '2018-11-30 00:00:00'),
(683, 1, 5, 'S', 'Movimiento de prueba 183', 2, 942, 53, 'Movimiento de prueba', '2018-08-01 00:00:00'),
(684, 1, 6, 'E', 'Movimiento de prueba 184', 2, 925, 44, 'Movimiento de prueba', '2019-04-24 00:00:00'),
(685, 1, 3, 'S', 'Movimiento de prueba 185', 2, 932, 55, 'Movimiento de prueba', '2019-02-21 00:00:00'),
(686, 1, 1, 'S', 'Movimiento de prueba 186', 2, 918, 54, 'Movimiento de prueba', '2019-07-12 00:00:00'),
(687, 1, 5, 'S', 'Movimiento de prueba 187', 2, 917, 26, 'Movimiento de prueba', '2018-07-29 00:00:00'),
(688, 1, 4, 'E', 'Movimiento de prueba 188', 2, 998, 59, 'Movimiento de prueba', '2019-09-08 00:00:00'),
(689, 1, 1, 'E', 'Movimiento de prueba 189', 2, 938, 42, 'Movimiento de prueba', '2018-08-10 00:00:00'),
(690, 1, 4, 'S', 'Movimiento de prueba 190', 2, 963, 30, 'Movimiento de prueba', '2018-08-31 00:00:00'),
(691, 1, 4, 'S', 'Movimiento de prueba 191', 2, 984, 41, 'Movimiento de prueba', '2019-03-07 00:00:00'),
(692, 1, 1, 'S', 'Movimiento de prueba 192', 2, 956, 19, 'Movimiento de prueba', '2018-09-20 00:00:00'),
(693, 1, 4, 'S', 'Movimiento de prueba 193', 2, 931, 41, 'Movimiento de prueba', '2018-09-14 00:00:00'),
(694, 1, 1, 'E', 'Movimiento de prueba 194', 2, 984, 15, 'Movimiento de prueba', '2019-08-21 00:00:00'),
(695, 1, 3, 'S', 'Movimiento de prueba 195', 2, 926, 44, 'Movimiento de prueba', '2019-04-06 00:00:00'),
(696, 1, 2, 'E', 'Movimiento de prueba 196', 2, 959, 51, 'Movimiento de prueba', '2018-12-24 00:00:00'),
(697, 1, 4, 'S', 'Movimiento de prueba 197', 2, 908, 13, 'Movimiento de prueba', '2018-07-23 00:00:00'),
(698, 1, 2, 'S', 'Movimiento de prueba 198', 2, 968, 50, 'Movimiento de prueba', '2019-08-25 00:00:00'),
(699, 1, 3, 'E', 'Movimiento de prueba 199', 2, 964, 44, 'Movimiento de prueba', '2019-02-21 00:00:00'),
(700, 1, 5, 'S', 'Movimiento de prueba 200', 2, 978, 40, 'Movimiento de prueba', '2019-05-11 00:00:00'),
(701, 1, 5, 'S', 'Movimiento de prueba 201', 2, 973, 19, 'Movimiento de prueba', '2019-05-25 00:00:00'),
(702, 1, 2, 'S', 'Movimiento de prueba 202', 2, 953, 16, 'Movimiento de prueba', '2018-07-25 00:00:00'),
(703, 1, 1, 'S', 'Movimiento de prueba 203', 2, 944, 34, 'Movimiento de prueba', '2018-08-05 00:00:00'),
(704, 1, 1, 'E', 'Movimiento de prueba 204', 2, 960, 34, 'Movimiento de prueba', '2019-03-11 00:00:00'),
(705, 1, 4, 'S', 'Movimiento de prueba 205', 2, 968, 53, 'Movimiento de prueba', '2018-10-11 00:00:00'),
(706, 1, 5, 'S', 'Movimiento de prueba 206', 2, 995, 25, 'Movimiento de prueba', '2019-04-18 00:00:00'),
(707, 1, 3, 'E', 'Movimiento de prueba 207', 2, 918, 57, 'Movimiento de prueba', '2018-08-31 00:00:00'),
(708, 1, 1, 'S', 'Movimiento de prueba 208', 2, 909, 38, 'Movimiento de prueba', '2019-03-04 00:00:00'),
(709, 1, 2, 'E', 'Movimiento de prueba 209', 2, 930, 59, 'Movimiento de prueba', '2018-07-21 00:00:00'),
(710, 1, 3, 'S', 'Movimiento de prueba 210', 2, 989, 59, 'Movimiento de prueba', '2018-09-26 00:00:00'),
(711, 1, 2, 'E', 'Movimiento de prueba 211', 2, 995, 52, 'Movimiento de prueba', '2018-12-08 00:00:00'),
(712, 1, 3, 'S', 'Movimiento de prueba 212', 2, 976, 33, 'Movimiento de prueba', '2018-07-25 00:00:00'),
(713, 1, 1, 'S', 'Movimiento de prueba 213', 2, 981, 47, 'Movimiento de prueba', '2018-11-20 00:00:00'),
(714, 1, 3, 'E', 'Movimiento de prueba 214', 2, 939, 53, 'Movimiento de prueba', '2018-08-29 00:00:00'),
(715, 1, 2, 'S', 'Movimiento de prueba 215', 2, 932, 52, 'Movimiento de prueba', '2018-10-08 00:00:00'),
(716, 1, 5, 'S', 'Movimiento de prueba 216', 2, 928, 47, 'Movimiento de prueba', '2019-07-05 00:00:00'),
(717, 1, 1, 'S', 'Movimiento de prueba 217', 2, 999, 16, 'Movimiento de prueba', '2019-03-25 00:00:00'),
(718, 1, 5, 'S', 'Movimiento de prueba 218', 2, 940, 19, 'Movimiento de prueba', '2019-05-29 00:00:00'),
(719, 1, 2, 'E', 'Movimiento de prueba 219', 2, 924, 19, 'Movimiento de prueba', '2018-10-06 00:00:00'),
(720, 1, 4, 'S', 'Movimiento de prueba 220', 2, 984, 35, 'Movimiento de prueba', '2018-06-25 00:00:00'),
(721, 1, 4, 'S', 'Movimiento de prueba 221', 2, 962, 35, 'Movimiento de prueba', '2019-03-24 00:00:00'),
(722, 1, 4, 'E', 'Movimiento de prueba 222', 2, 931, 52, 'Movimiento de prueba', '2018-11-11 00:00:00'),
(723, 1, 1, 'E', 'Movimiento de prueba 223', 2, 900, 42, 'Movimiento de prueba', '2018-10-02 00:00:00'),
(724, 1, 2, 'S', 'Movimiento de prueba 224', 2, 907, 44, 'Movimiento de prueba', '2018-09-04 00:00:00'),
(725, 1, 6, 'S', 'Movimiento de prueba 225', 2, 905, 14, 'Movimiento de prueba', '2018-10-22 00:00:00'),
(726, 1, 2, 'E', 'Movimiento de prueba 226', 2, 950, 36, 'Movimiento de prueba', '2018-08-01 00:00:00'),
(727, 1, 6, 'E', 'Movimiento de prueba 227', 2, 916, 41, 'Movimiento de prueba', '2019-03-25 00:00:00'),
(728, 1, 2, 'E', 'Movimiento de prueba 228', 2, 942, 50, 'Movimiento de prueba', '2019-05-26 00:00:00'),
(729, 1, 3, 'S', 'Movimiento de prueba 229', 2, 922, 13, 'Movimiento de prueba', '2019-04-13 00:00:00'),
(730, 1, 1, 'S', 'Movimiento de prueba 230', 2, 909, 29, 'Movimiento de prueba', '2019-03-14 00:00:00'),
(731, 1, 6, 'S', 'Movimiento de prueba 231', 2, 918, 21, 'Movimiento de prueba', '2019-03-27 00:00:00'),
(732, 1, 3, 'E', 'Movimiento de prueba 232', 2, 932, 41, 'Movimiento de prueba', '2018-09-13 00:00:00'),
(733, 1, 1, 'S', 'Movimiento de prueba 233', 2, 905, 42, 'Movimiento de prueba', '2018-08-07 00:00:00'),
(734, 1, 4, 'S', 'Movimiento de prueba 234', 2, 913, 22, 'Movimiento de prueba', '2019-07-03 00:00:00'),
(735, 1, 3, 'S', 'Movimiento de prueba 235', 2, 913, 54, 'Movimiento de prueba', '2018-07-11 00:00:00'),
(736, 1, 4, 'S', 'Movimiento de prueba 236', 2, 978, 17, 'Movimiento de prueba', '2018-11-18 00:00:00'),
(737, 1, 2, 'S', 'Movimiento de prueba 237', 2, 958, 30, 'Movimiento de prueba', '2018-11-06 00:00:00'),
(738, 1, 3, 'S', 'Movimiento de prueba 238', 2, 902, 44, 'Movimiento de prueba', '2018-11-18 00:00:00'),
(739, 1, 5, 'E', 'Movimiento de prueba 239', 2, 949, 39, 'Movimiento de prueba', '2018-12-31 00:00:00'),
(740, 1, 3, 'S', 'Movimiento de prueba 240', 2, 914, 13, 'Movimiento de prueba', '2019-07-07 00:00:00'),
(741, 1, 1, 'S', 'Movimiento de prueba 241', 2, 939, 17, 'Movimiento de prueba', '2019-03-16 00:00:00'),
(742, 1, 4, 'S', 'Movimiento de prueba 242', 2, 919, 12, 'Movimiento de prueba', '2019-04-01 00:00:00'),
(743, 1, 1, 'E', 'Movimiento de prueba 243', 2, 903, 51, 'Movimiento de prueba', '2018-06-29 00:00:00'),
(744, 1, 5, 'E', 'Movimiento de prueba 244', 2, 936, 59, 'Movimiento de prueba', '2019-06-29 00:00:00'),
(745, 1, 2, 'S', 'Movimiento de prueba 245', 2, 968, 29, 'Movimiento de prueba', '2019-07-17 00:00:00'),
(746, 1, 2, 'S', 'Movimiento de prueba 246', 2, 901, 32, 'Movimiento de prueba', '2018-09-09 00:00:00'),
(747, 1, 4, 'E', 'Movimiento de prueba 247', 2, 961, 39, 'Movimiento de prueba', '2018-07-25 00:00:00'),
(748, 1, 5, 'E', 'Movimiento de prueba 248', 2, 985, 46, 'Movimiento de prueba', '2018-07-22 00:00:00'),
(749, 1, 2, 'S', 'Movimiento de prueba 249', 2, 958, 29, 'Movimiento de prueba', '2018-08-20 00:00:00'),
(750, 1, 4, 'S', 'Movimiento de prueba 250', 2, 991, 57, 'Movimiento de prueba', '2018-06-22 00:00:00'),
(751, 1, 2, 'E', 'Movimiento de prueba 251', 2, 971, 27, 'Movimiento de prueba', '2019-02-21 00:00:00'),
(752, 1, 5, 'E', 'Movimiento de prueba 252', 2, 945, 52, 'Movimiento de prueba', '2019-06-29 00:00:00'),
(753, 1, 4, 'S', 'Movimiento de prueba 253', 2, 906, 53, 'Movimiento de prueba', '2018-09-06 00:00:00'),
(754, 1, 2, 'S', 'Movimiento de prueba 254', 2, 988, 37, 'Movimiento de prueba', '2018-08-05 00:00:00'),
(755, 1, 6, 'E', 'Movimiento de prueba 255', 2, 917, 28, 'Movimiento de prueba', '2018-10-13 00:00:00'),
(756, 1, 2, 'E', 'Movimiento de prueba 256', 2, 945, 58, 'Movimiento de prueba', '2019-01-01 00:00:00'),
(757, 1, 2, 'E', 'Movimiento de prueba 257', 2, 953, 49, 'Movimiento de prueba', '2018-10-25 00:00:00'),
(758, 1, 1, 'S', 'Movimiento de prueba 258', 2, 921, 55, 'Movimiento de prueba', '2019-08-12 00:00:00'),
(759, 1, 6, 'S', 'Movimiento de prueba 259', 2, 966, 41, 'Movimiento de prueba', '2018-09-04 00:00:00'),
(760, 1, 6, 'E', 'Movimiento de prueba 260', 2, 926, 57, 'Movimiento de prueba', '2019-08-27 00:00:00'),
(761, 1, 6, 'E', 'Movimiento de prueba 261', 2, 941, 50, 'Movimiento de prueba', '2019-06-25 00:00:00'),
(762, 1, 5, 'E', 'Movimiento de prueba 262', 2, 924, 10, 'Movimiento de prueba', '2018-10-21 00:00:00'),
(763, 1, 3, 'E', 'Movimiento de prueba 263', 2, 955, 26, 'Movimiento de prueba', '2019-08-28 00:00:00'),
(764, 1, 6, 'E', 'Movimiento de prueba 264', 2, 965, 55, 'Movimiento de prueba', '2019-02-21 00:00:00'),
(765, 1, 1, 'S', 'Movimiento de prueba 265', 2, 917, 52, 'Movimiento de prueba', '2019-05-05 00:00:00'),
(766, 1, 1, 'E', 'Movimiento de prueba 266', 2, 918, 46, 'Movimiento de prueba', '2018-07-26 00:00:00'),
(767, 1, 2, 'E', 'Movimiento de prueba 267', 2, 972, 23, 'Movimiento de prueba', '2018-09-13 00:00:00'),
(768, 1, 2, 'E', 'Movimiento de prueba 268', 2, 904, 22, 'Movimiento de prueba', '2018-08-10 00:00:00'),
(769, 1, 6, 'E', 'Movimiento de prueba 269', 2, 944, 19, 'Movimiento de prueba', '2019-03-01 00:00:00'),
(770, 1, 2, 'S', 'Movimiento de prueba 270', 2, 949, 50, 'Movimiento de prueba', '2019-02-26 00:00:00'),
(771, 1, 3, 'E', 'Movimiento de prueba 271', 2, 925, 30, 'Movimiento de prueba', '2018-10-20 00:00:00'),
(772, 1, 2, 'E', 'Movimiento de prueba 272', 2, 967, 21, 'Movimiento de prueba', '2018-08-25 00:00:00'),
(773, 1, 1, 'S', 'Movimiento de prueba 273', 2, 956, 55, 'Movimiento de prueba', '2019-07-16 00:00:00'),
(774, 1, 4, 'S', 'Movimiento de prueba 274', 2, 912, 49, 'Movimiento de prueba', '2019-03-11 00:00:00'),
(775, 1, 4, 'E', 'Movimiento de prueba 275', 2, 917, 23, 'Movimiento de prueba', '2019-07-10 00:00:00'),
(776, 1, 3, 'S', 'Movimiento de prueba 276', 2, 994, 13, 'Movimiento de prueba', '2019-02-05 00:00:00'),
(777, 1, 3, 'E', 'Movimiento de prueba 277', 2, 975, 41, 'Movimiento de prueba', '2019-07-26 00:00:00'),
(778, 1, 4, 'E', 'Movimiento de prueba 278', 2, 950, 47, 'Movimiento de prueba', '2018-09-16 00:00:00'),
(779, 1, 5, 'E', 'Movimiento de prueba 279', 2, 971, 23, 'Movimiento de prueba', '2018-09-21 00:00:00'),
(780, 1, 2, 'S', 'Movimiento de prueba 280', 2, 984, 11, 'Movimiento de prueba', '2019-03-14 00:00:00'),
(781, 1, 6, 'S', 'Movimiento de prueba 281', 2, 932, 19, 'Movimiento de prueba', '2019-08-10 00:00:00'),
(782, 1, 1, 'S', 'Movimiento de prueba 282', 2, 949, 17, 'Movimiento de prueba', '2018-10-25 00:00:00'),
(783, 1, 1, 'E', 'Movimiento de prueba 283', 2, 978, 32, 'Movimiento de prueba', '2019-08-01 00:00:00'),
(784, 1, 2, 'E', 'Movimiento de prueba 284', 2, 964, 34, 'Movimiento de prueba', '2019-02-14 00:00:00'),
(785, 1, 2, 'E', 'Movimiento de prueba 285', 2, 954, 31, 'Movimiento de prueba', '2019-01-30 00:00:00'),
(786, 1, 2, 'S', 'Movimiento de prueba 286', 2, 984, 14, 'Movimiento de prueba', '2019-07-16 00:00:00'),
(787, 1, 1, 'E', 'Movimiento de prueba 287', 2, 972, 38, 'Movimiento de prueba', '2019-03-31 00:00:00'),
(788, 1, 4, 'S', 'Movimiento de prueba 288', 2, 960, 18, 'Movimiento de prueba', '2019-08-31 00:00:00'),
(789, 1, 3, 'E', 'Movimiento de prueba 289', 2, 933, 27, 'Movimiento de prueba', '2019-05-23 00:00:00'),
(790, 1, 5, 'E', 'Movimiento de prueba 290', 2, 949, 34, 'Movimiento de prueba', '2019-08-17 00:00:00'),
(791, 1, 2, 'S', 'Movimiento de prueba 291', 2, 988, 50, 'Movimiento de prueba', '2018-11-22 00:00:00'),
(792, 1, 3, 'S', 'Movimiento de prueba 292', 2, 969, 20, 'Movimiento de prueba', '2019-08-13 00:00:00'),
(793, 1, 1, 'S', 'Movimiento de prueba 293', 2, 971, 49, 'Movimiento de prueba', '2019-06-24 00:00:00'),
(794, 1, 5, 'E', 'Movimiento de prueba 294', 2, 924, 25, 'Movimiento de prueba', '2019-06-13 00:00:00'),
(795, 1, 1, 'E', 'Movimiento de prueba 295', 2, 919, 42, 'Movimiento de prueba', '2019-05-01 00:00:00'),
(796, 1, 4, 'S', 'Movimiento de prueba 296', 2, 905, 59, 'Movimiento de prueba', '2019-05-24 00:00:00'),
(797, 1, 6, 'S', 'Movimiento de prueba 297', 2, 933, 46, 'Movimiento de prueba', '2019-04-06 00:00:00'),
(798, 1, 1, 'E', 'Movimiento de prueba 298', 2, 994, 30, 'Movimiento de prueba', '2018-09-19 00:00:00'),
(799, 1, 6, 'S', 'Movimiento de prueba 299', 2, 934, 59, 'Movimiento de prueba', '2019-07-25 00:00:00'),
(800, 1, 4, 'S', 'Movimiento de prueba 300', 2, 934, 48, 'Movimiento de prueba', '2019-06-08 00:00:00'),
(801, 1, 4, 'S', 'Movimiento de prueba 301', 2, 957, 17, 'Movimiento de prueba', '2018-07-03 00:00:00'),
(802, 1, 5, 'S', 'Movimiento de prueba 302', 2, 973, 54, 'Movimiento de prueba', '2018-09-29 00:00:00'),
(803, 1, 4, 'S', 'Movimiento de prueba 303', 2, 976, 22, 'Movimiento de prueba', '2019-08-18 00:00:00'),
(804, 1, 1, 'E', 'Movimiento de prueba 304', 2, 979, 34, 'Movimiento de prueba', '2018-07-21 00:00:00'),
(805, 1, 6, 'E', 'Movimiento de prueba 305', 2, 908, 26, 'Movimiento de prueba', '2018-11-17 00:00:00'),
(806, 1, 5, 'S', 'Movimiento de prueba 306', 2, 950, 22, 'Movimiento de prueba', '2019-05-27 00:00:00'),
(807, 1, 1, 'E', 'Movimiento de prueba 307', 2, 987, 25, 'Movimiento de prueba', '2019-09-01 00:00:00'),
(808, 1, 6, 'S', 'Movimiento de prueba 308', 2, 918, 34, 'Movimiento de prueba', '2019-07-24 00:00:00'),
(809, 1, 1, 'E', 'Movimiento de prueba 309', 2, 978, 51, 'Movimiento de prueba', '2019-05-23 00:00:00'),
(810, 1, 2, 'E', 'Movimiento de prueba 310', 2, 992, 32, 'Movimiento de prueba', '2019-01-31 00:00:00'),
(811, 1, 2, 'E', 'Movimiento de prueba 311', 2, 948, 19, 'Movimiento de prueba', '2019-01-19 00:00:00'),
(812, 1, 6, 'S', 'Movimiento de prueba 312', 2, 953, 20, 'Movimiento de prueba', '2019-01-06 00:00:00'),
(813, 1, 4, 'S', 'Movimiento de prueba 313', 2, 930, 10, 'Movimiento de prueba', '2018-07-26 00:00:00'),
(814, 1, 3, 'S', 'Movimiento de prueba 314', 2, 946, 32, 'Movimiento de prueba', '2019-07-02 00:00:00'),
(815, 1, 6, 'S', 'Movimiento de prueba 315', 2, 977, 21, 'Movimiento de prueba', '2019-06-09 00:00:00'),
(816, 1, 2, 'E', 'Movimiento de prueba 316', 2, 974, 26, 'Movimiento de prueba', '2018-12-10 00:00:00'),
(817, 1, 1, 'S', 'Movimiento de prueba 317', 2, 907, 57, 'Movimiento de prueba', '2019-01-20 00:00:00'),
(818, 1, 4, 'S', 'Movimiento de prueba 318', 2, 983, 39, 'Movimiento de prueba', '2019-01-17 00:00:00'),
(819, 1, 4, 'S', 'Movimiento de prueba 319', 2, 909, 46, 'Movimiento de prueba', '2018-11-11 00:00:00'),
(820, 1, 3, 'E', 'Movimiento de prueba 320', 2, 978, 39, 'Movimiento de prueba', '2019-02-27 00:00:00'),
(821, 1, 1, 'S', 'Movimiento de prueba 321', 2, 934, 37, 'Movimiento de prueba', '2019-04-29 00:00:00'),
(822, 1, 6, 'E', 'Movimiento de prueba 322', 2, 901, 13, 'Movimiento de prueba', '2018-10-10 00:00:00'),
(823, 1, 1, 'S', 'Movimiento de prueba 323', 2, 963, 49, 'Movimiento de prueba', '2018-07-18 00:00:00'),
(824, 1, 6, 'S', 'Movimiento de prueba 324', 2, 941, 13, 'Movimiento de prueba', '2018-08-04 00:00:00'),
(825, 1, 3, 'E', 'Movimiento de prueba 325', 2, 980, 56, 'Movimiento de prueba', '2018-09-10 00:00:00'),
(826, 1, 2, 'E', 'Movimiento de prueba 326', 2, 958, 41, 'Movimiento de prueba', '2018-11-16 00:00:00'),
(827, 1, 6, 'E', 'Movimiento de prueba 327', 2, 943, 39, 'Movimiento de prueba', '2019-04-18 00:00:00'),
(828, 1, 4, 'S', 'Movimiento de prueba 328', 2, 912, 43, 'Movimiento de prueba', '2019-08-11 00:00:00'),
(829, 1, 5, 'S', 'Movimiento de prueba 329', 2, 918, 58, 'Movimiento de prueba', '2018-10-25 00:00:00'),
(830, 1, 4, 'S', 'Movimiento de prueba 330', 2, 984, 36, 'Movimiento de prueba', '2018-07-14 00:00:00'),
(831, 1, 5, 'S', 'Movimiento de prueba 331', 2, 979, 16, 'Movimiento de prueba', '2018-10-07 00:00:00'),
(832, 1, 6, 'S', 'Movimiento de prueba 332', 2, 955, 52, 'Movimiento de prueba', '2019-02-21 00:00:00'),
(833, 1, 2, 'S', 'Movimiento de prueba 333', 2, 928, 39, 'Movimiento de prueba', '2018-07-16 00:00:00'),
(834, 1, 4, 'S', 'Movimiento de prueba 334', 2, 909, 16, 'Movimiento de prueba', '2018-12-05 00:00:00'),
(835, 1, 4, 'E', 'Movimiento de prueba 335', 2, 972, 23, 'Movimiento de prueba', '2018-08-13 00:00:00'),
(836, 1, 6, 'S', 'Movimiento de prueba 336', 2, 920, 16, 'Movimiento de prueba', '2018-07-11 00:00:00'),
(837, 1, 6, 'E', 'Movimiento de prueba 337', 2, 966, 35, 'Movimiento de prueba', '2019-03-15 00:00:00'),
(838, 1, 3, 'S', 'Movimiento de prueba 338', 2, 928, 49, 'Movimiento de prueba', '2018-08-20 00:00:00'),
(839, 1, 3, 'E', 'Movimiento de prueba 339', 2, 923, 30, 'Movimiento de prueba', '2018-11-14 00:00:00'),
(840, 1, 3, 'E', 'Movimiento de prueba 340', 2, 929, 31, 'Movimiento de prueba', '2018-11-02 00:00:00'),
(841, 1, 2, 'E', 'Movimiento de prueba 341', 2, 965, 32, 'Movimiento de prueba', '2018-10-29 00:00:00'),
(842, 1, 1, 'S', 'Movimiento de prueba 342', 2, 973, 17, 'Movimiento de prueba', '2019-02-28 00:00:00'),
(843, 1, 3, 'E', 'Movimiento de prueba 343', 2, 912, 50, 'Movimiento de prueba', '2019-05-14 00:00:00'),
(844, 1, 2, 'S', 'Movimiento de prueba 344', 2, 993, 55, 'Movimiento de prueba', '2019-04-28 00:00:00'),
(845, 1, 5, 'S', 'Movimiento de prueba 345', 2, 933, 49, 'Movimiento de prueba', '2019-08-25 00:00:00'),
(846, 1, 3, 'E', 'Movimiento de prueba 346', 2, 954, 39, 'Movimiento de prueba', '2018-10-21 00:00:00'),
(847, 1, 4, 'E', 'Movimiento de prueba 347', 2, 935, 27, 'Movimiento de prueba', '2019-05-11 00:00:00'),
(848, 1, 4, 'S', 'Movimiento de prueba 348', 2, 975, 44, 'Movimiento de prueba', '2018-08-29 00:00:00'),
(849, 1, 5, 'E', 'Movimiento de prueba 349', 2, 943, 16, 'Movimiento de prueba', '2018-12-04 00:00:00'),
(850, 1, 3, 'E', 'Movimiento de prueba 350', 2, 917, 53, 'Movimiento de prueba', '2019-06-20 00:00:00'),
(851, 1, 3, 'E', 'Movimiento de prueba 351', 2, 962, 13, 'Movimiento de prueba', '2019-01-08 00:00:00'),
(852, 1, 1, 'E', 'Movimiento de prueba 352', 2, 917, 40, 'Movimiento de prueba', '2019-01-27 00:00:00'),
(853, 1, 5, 'S', 'Movimiento de prueba 353', 2, 967, 36, 'Movimiento de prueba', '2019-03-11 00:00:00'),
(854, 1, 3, 'E', 'Movimiento de prueba 354', 2, 912, 50, 'Movimiento de prueba', '2019-03-29 00:00:00'),
(855, 1, 5, 'S', 'Movimiento de prueba 355', 2, 947, 34, 'Movimiento de prueba', '2018-07-16 00:00:00'),
(856, 1, 6, 'E', 'Movimiento de prueba 356', 2, 967, 22, 'Movimiento de prueba', '2018-09-17 00:00:00'),
(857, 1, 2, 'S', 'Movimiento de prueba 357', 2, 943, 39, 'Movimiento de prueba', '2019-03-21 00:00:00'),
(858, 1, 3, 'S', 'Movimiento de prueba 358', 2, 907, 57, 'Movimiento de prueba', '2019-01-27 00:00:00'),
(859, 1, 4, 'S', 'Movimiento de prueba 359', 2, 909, 11, 'Movimiento de prueba', '2019-07-22 00:00:00'),
(860, 1, 3, 'E', 'Movimiento de prueba 360', 2, 916, 45, 'Movimiento de prueba', '2018-06-25 00:00:00'),
(861, 1, 1, 'S', 'Movimiento de prueba 361', 2, 975, 54, 'Movimiento de prueba', '2018-09-28 00:00:00'),
(862, 1, 3, 'S', 'Movimiento de prueba 362', 2, 987, 29, 'Movimiento de prueba', '2018-10-26 00:00:00'),
(863, 1, 2, 'S', 'Movimiento de prueba 363', 2, 987, 13, 'Movimiento de prueba', '2019-04-23 00:00:00'),
(864, 1, 2, 'E', 'Movimiento de prueba 364', 2, 935, 14, 'Movimiento de prueba', '2018-11-28 00:00:00'),
(865, 1, 4, 'S', 'Movimiento de prueba 365', 2, 931, 17, 'Movimiento de prueba', '2019-05-30 00:00:00'),
(866, 1, 3, 'S', 'Movimiento de prueba 366', 2, 982, 43, 'Movimiento de prueba', '2019-06-23 00:00:00'),
(867, 1, 1, 'E', 'Movimiento de prueba 367', 2, 999, 15, 'Movimiento de prueba', '2019-02-14 00:00:00'),
(868, 1, 3, 'E', 'Movimiento de prueba 368', 2, 938, 10, 'Movimiento de prueba', '2019-07-21 00:00:00'),
(869, 1, 3, 'E', 'Movimiento de prueba 369', 2, 972, 31, 'Movimiento de prueba', '2019-09-09 00:00:00'),
(870, 1, 5, 'E', 'Movimiento de prueba 370', 2, 934, 22, 'Movimiento de prueba', '2018-09-13 00:00:00'),
(871, 1, 2, 'S', 'Movimiento de prueba 371', 2, 998, 42, 'Movimiento de prueba', '2018-10-13 00:00:00'),
(872, 1, 3, 'E', 'Movimiento de prueba 372', 2, 974, 17, 'Movimiento de prueba', '2019-02-01 00:00:00'),
(873, 1, 1, 'E', 'Movimiento de prueba 373', 2, 900, 50, 'Movimiento de prueba', '2018-06-29 00:00:00'),
(874, 1, 5, 'S', 'Movimiento de prueba 374', 2, 957, 20, 'Movimiento de prueba', '2018-11-13 00:00:00'),
(875, 1, 1, 'E', 'Movimiento de prueba 375', 2, 993, 11, 'Movimiento de prueba', '2018-11-09 00:00:00'),
(876, 1, 4, 'S', 'Movimiento de prueba 376', 2, 935, 28, 'Movimiento de prueba', '2019-05-21 00:00:00'),
(877, 1, 5, 'E', 'Movimiento de prueba 377', 2, 953, 27, 'Movimiento de prueba', '2018-08-27 00:00:00'),
(878, 1, 5, 'E', 'Movimiento de prueba 378', 2, 903, 29, 'Movimiento de prueba', '2019-07-22 00:00:00'),
(879, 1, 2, 'S', 'Movimiento de prueba 379', 2, 930, 44, 'Movimiento de prueba', '2019-02-27 00:00:00'),
(880, 1, 5, 'E', 'Movimiento de prueba 380', 2, 990, 31, 'Movimiento de prueba', '2018-12-18 00:00:00'),
(881, 1, 5, 'S', 'Movimiento de prueba 381', 2, 917, 47, 'Movimiento de prueba', '2018-09-15 00:00:00'),
(882, 1, 5, 'E', 'Movimiento de prueba 382', 2, 922, 19, 'Movimiento de prueba', '2018-10-03 00:00:00'),
(883, 1, 5, 'S', 'Movimiento de prueba 383', 2, 904, 29, 'Movimiento de prueba', '2019-06-16 00:00:00'),
(884, 1, 6, 'E', 'Movimiento de prueba 384', 2, 947, 24, 'Movimiento de prueba', '2018-06-30 00:00:00'),
(885, 1, 2, 'E', 'Movimiento de prueba 385', 2, 986, 25, 'Movimiento de prueba', '2019-07-29 00:00:00'),
(886, 1, 4, 'E', 'Movimiento de prueba 386', 2, 999, 54, 'Movimiento de prueba', '2018-12-29 00:00:00'),
(887, 1, 4, 'E', 'Movimiento de prueba 387', 2, 997, 57, 'Movimiento de prueba', '2019-06-08 00:00:00'),
(888, 1, 1, 'E', 'Movimiento de prueba 388', 2, 912, 45, 'Movimiento de prueba', '2018-09-02 00:00:00'),
(889, 1, 5, 'E', 'Movimiento de prueba 389', 2, 970, 57, 'Movimiento de prueba', '2019-04-04 00:00:00'),
(890, 1, 3, 'E', 'Movimiento de prueba 390', 2, 992, 38, 'Movimiento de prueba', '2018-07-12 00:00:00'),
(891, 1, 4, 'S', 'Movimiento de prueba 391', 2, 933, 18, 'Movimiento de prueba', '2019-07-05 00:00:00'),
(892, 1, 5, 'E', 'Movimiento de prueba 392', 2, 986, 43, 'Movimiento de prueba', '2019-05-02 00:00:00'),
(893, 1, 4, 'S', 'Movimiento de prueba 393', 2, 970, 34, 'Movimiento de prueba', '2018-11-28 00:00:00'),
(894, 1, 3, 'S', 'Movimiento de prueba 394', 2, 912, 45, 'Movimiento de prueba', '2018-09-19 00:00:00'),
(895, 1, 6, 'S', 'Movimiento de prueba 395', 2, 993, 53, 'Movimiento de prueba', '2019-02-18 00:00:00'),
(896, 1, 1, 'E', 'Movimiento de prueba 396', 2, 975, 43, 'Movimiento de prueba', '2018-07-10 00:00:00'),
(897, 1, 2, 'E', 'Movimiento de prueba 397', 2, 967, 32, 'Movimiento de prueba', '2018-09-09 00:00:00'),
(898, 1, 4, 'S', 'Movimiento de prueba 398', 2, 984, 39, 'Movimiento de prueba', '2018-12-11 00:00:00'),
(899, 1, 2, 'S', 'Movimiento de prueba 399', 2, 910, 42, 'Movimiento de prueba', '2019-07-27 00:00:00'),
(900, 1, 4, 'E', 'Movimiento de prueba 400', 2, 927, 48, 'Movimiento de prueba', '2018-06-28 00:00:00'),
(901, 1, 6, 'E', 'Movimiento de prueba 401', 2, 993, 30, 'Movimiento de prueba', '2018-09-20 00:00:00'),
(902, 1, 6, 'S', 'Movimiento de prueba 402', 2, 980, 59, 'Movimiento de prueba', '2019-02-18 00:00:00'),
(903, 1, 5, 'E', 'Movimiento de prueba 403', 2, 960, 33, 'Movimiento de prueba', '2019-01-31 00:00:00'),
(904, 1, 1, 'E', 'Movimiento de prueba 404', 2, 988, 39, 'Movimiento de prueba', '2018-11-09 00:00:00'),
(905, 1, 6, 'E', 'Movimiento de prueba 405', 2, 977, 14, 'Movimiento de prueba', '2018-08-04 00:00:00'),
(906, 1, 2, 'E', 'Movimiento de prueba 406', 2, 973, 25, 'Movimiento de prueba', '2018-11-23 00:00:00'),
(907, 1, 6, 'E', 'Movimiento de prueba 407', 2, 928, 57, 'Movimiento de prueba', '2019-07-03 00:00:00'),
(908, 1, 3, 'S', 'Movimiento de prueba 408', 2, 945, 41, 'Movimiento de prueba', '2019-06-20 00:00:00'),
(909, 1, 2, 'S', 'Movimiento de prueba 409', 2, 902, 37, 'Movimiento de prueba', '2019-04-08 00:00:00'),
(910, 1, 4, 'E', 'Movimiento de prueba 410', 2, 951, 44, 'Movimiento de prueba', '2019-08-01 00:00:00'),
(911, 1, 3, 'S', 'Movimiento de prueba 411', 2, 996, 49, 'Movimiento de prueba', '2018-07-08 00:00:00'),
(912, 1, 6, 'E', 'Movimiento de prueba 412', 2, 963, 30, 'Movimiento de prueba', '2018-08-20 00:00:00'),
(913, 1, 4, 'E', 'Movimiento de prueba 413', 2, 992, 28, 'Movimiento de prueba', '2018-07-20 00:00:00'),
(914, 1, 2, 'E', 'Movimiento de prueba 414', 2, 993, 19, 'Movimiento de prueba', '2018-09-04 00:00:00'),
(915, 1, 2, 'E', 'Movimiento de prueba 415', 2, 935, 40, 'Movimiento de prueba', '2019-08-10 00:00:00'),
(916, 1, 6, 'E', 'Movimiento de prueba 416', 2, 982, 44, 'Movimiento de prueba', '2018-06-16 00:00:00'),
(917, 1, 6, 'S', 'Movimiento de prueba 417', 2, 928, 39, 'Movimiento de prueba', '2018-08-11 00:00:00'),
(918, 1, 6, 'S', 'Movimiento de prueba 418', 2, 972, 13, 'Movimiento de prueba', '2018-08-28 00:00:00'),
(919, 1, 4, 'S', 'Movimiento de prueba 419', 2, 906, 38, 'Movimiento de prueba', '2019-04-10 00:00:00'),
(920, 1, 4, 'E', 'Movimiento de prueba 420', 2, 938, 51, 'Movimiento de prueba', '2019-08-11 00:00:00'),
(921, 1, 2, 'E', 'Movimiento de prueba 421', 2, 960, 23, 'Movimiento de prueba', '2019-02-14 00:00:00'),
(922, 1, 6, 'S', 'Movimiento de prueba 422', 2, 962, 36, 'Movimiento de prueba', '2019-05-22 00:00:00'),
(923, 1, 2, 'S', 'Movimiento de prueba 423', 2, 913, 32, 'Movimiento de prueba', '2019-06-11 00:00:00'),
(924, 1, 5, 'S', 'Movimiento de prueba 424', 2, 970, 45, 'Movimiento de prueba', '2018-12-26 00:00:00'),
(925, 1, 1, 'S', 'Movimiento de prueba 425', 2, 905, 49, 'Movimiento de prueba', '2019-06-11 00:00:00'),
(926, 1, 4, 'S', 'Movimiento de prueba 426', 2, 975, 39, 'Movimiento de prueba', '2019-05-03 00:00:00'),
(927, 1, 5, 'S', 'Movimiento de prueba 427', 2, 943, 56, 'Movimiento de prueba', '2018-11-19 00:00:00'),
(928, 1, 6, 'S', 'Movimiento de prueba 428', 2, 947, 28, 'Movimiento de prueba', '2019-01-10 00:00:00'),
(929, 1, 2, 'S', 'Movimiento de prueba 429', 2, 938, 16, 'Movimiento de prueba', '2019-02-12 00:00:00'),
(930, 1, 2, 'S', 'Movimiento de prueba 430', 2, 992, 28, 'Movimiento de prueba', '2018-07-20 00:00:00'),
(931, 1, 2, 'E', 'Movimiento de prueba 431', 2, 902, 39, 'Movimiento de prueba', '2019-07-18 00:00:00'),
(932, 1, 4, 'S', 'Movimiento de prueba 432', 2, 981, 31, 'Movimiento de prueba', '2019-05-11 00:00:00'),
(933, 1, 3, 'S', 'Movimiento de prueba 433', 2, 979, 24, 'Movimiento de prueba', '2018-06-18 00:00:00'),
(934, 1, 2, 'S', 'Movimiento de prueba 434', 2, 917, 11, 'Movimiento de prueba', '2019-03-04 00:00:00'),
(935, 1, 6, 'E', 'Movimiento de prueba 435', 2, 969, 18, 'Movimiento de prueba', '2019-05-10 00:00:00'),
(936, 1, 1, 'S', 'Movimiento de prueba 436', 2, 940, 26, 'Movimiento de prueba', '2018-12-08 00:00:00'),
(937, 1, 6, 'S', 'Movimiento de prueba 437', 2, 970, 26, 'Movimiento de prueba', '2019-01-29 00:00:00'),
(938, 1, 4, 'E', 'Movimiento de prueba 438', 2, 972, 48, 'Movimiento de prueba', '2019-04-28 00:00:00'),
(939, 1, 2, 'S', 'Movimiento de prueba 439', 2, 960, 36, 'Movimiento de prueba', '2019-07-02 00:00:00'),
(940, 1, 4, 'S', 'Movimiento de prueba 440', 2, 923, 25, 'Movimiento de prueba', '2019-07-04 00:00:00'),
(941, 1, 2, 'E', 'Movimiento de prueba 441', 2, 910, 35, 'Movimiento de prueba', '2018-09-08 00:00:00'),
(942, 1, 3, 'S', 'Movimiento de prueba 442', 2, 987, 32, 'Movimiento de prueba', '2019-03-23 00:00:00'),
(943, 1, 5, 'S', 'Movimiento de prueba 443', 2, 958, 10, 'Movimiento de prueba', '2018-10-06 00:00:00'),
(944, 1, 2, 'E', 'Movimiento de prueba 444', 2, 971, 14, 'Movimiento de prueba', '2018-11-18 00:00:00'),
(945, 1, 3, 'E', 'Movimiento de prueba 445', 2, 945, 50, 'Movimiento de prueba', '2019-05-04 00:00:00'),
(946, 1, 1, 'S', 'Movimiento de prueba 446', 2, 912, 14, 'Movimiento de prueba', '2018-08-08 00:00:00'),
(947, 1, 2, 'E', 'Movimiento de prueba 447', 2, 905, 44, 'Movimiento de prueba', '2018-10-09 00:00:00'),
(948, 1, 2, 'E', 'Movimiento de prueba 448', 2, 918, 50, 'Movimiento de prueba', '2019-01-29 00:00:00'),
(949, 1, 1, 'S', 'Movimiento de prueba 449', 2, 925, 37, 'Movimiento de prueba', '2018-06-25 00:00:00'),
(950, 1, 3, 'E', 'Movimiento de prueba 450', 2, 963, 38, 'Movimiento de prueba', '2019-09-06 00:00:00'),
(951, 1, 2, 'E', 'Movimiento de prueba 451', 2, 992, 24, 'Movimiento de prueba', '2019-04-28 00:00:00'),
(952, 1, 4, 'S', 'Movimiento de prueba 452', 2, 996, 58, 'Movimiento de prueba', '2019-07-25 00:00:00'),
(953, 1, 4, 'E', 'Movimiento de prueba 453', 2, 977, 56, 'Movimiento de prueba', '2018-10-23 00:00:00'),
(954, 1, 5, 'S', 'Movimiento de prueba 454', 2, 956, 23, 'Movimiento de prueba', '2019-04-12 00:00:00'),
(955, 1, 4, 'S', 'Movimiento de prueba 455', 2, 939, 20, 'Movimiento de prueba', '2019-07-04 00:00:00'),
(956, 1, 4, 'S', 'Movimiento de prueba 456', 2, 909, 43, 'Movimiento de prueba', '2018-07-17 00:00:00'),
(957, 1, 3, 'S', 'Movimiento de prueba 457', 2, 962, 36, 'Movimiento de prueba', '2019-05-19 00:00:00'),
(958, 1, 1, 'S', 'Movimiento de prueba 458', 2, 942, 28, 'Movimiento de prueba', '2019-02-12 00:00:00'),
(959, 1, 4, 'E', 'Movimiento de prueba 459', 2, 919, 47, 'Movimiento de prueba', '2018-09-20 00:00:00'),
(960, 1, 5, 'E', 'Movimiento de prueba 460', 2, 940, 57, 'Movimiento de prueba', '2019-02-04 00:00:00'),
(961, 1, 5, 'E', 'Movimiento de prueba 461', 2, 980, 29, 'Movimiento de prueba', '2019-02-02 00:00:00'),
(962, 1, 3, 'S', 'Movimiento de prueba 462', 2, 932, 14, 'Movimiento de prueba', '2019-01-28 00:00:00'),
(963, 1, 2, 'S', 'Movimiento de prueba 463', 2, 942, 22, 'Movimiento de prueba', '2019-09-06 00:00:00'),
(964, 1, 2, 'E', 'Movimiento de prueba 464', 2, 961, 56, 'Movimiento de prueba', '2019-06-03 00:00:00'),
(965, 1, 1, 'E', 'Movimiento de prueba 465', 2, 928, 30, 'Movimiento de prueba', '2018-09-03 00:00:00'),
(966, 1, 5, 'S', 'Movimiento de prueba 466', 2, 908, 59, 'Movimiento de prueba', '2019-03-31 00:00:00'),
(967, 1, 2, 'E', 'Movimiento de prueba 467', 2, 903, 15, 'Movimiento de prueba', '2018-12-14 00:00:00'),
(968, 1, 5, 'E', 'Movimiento de prueba 468', 2, 951, 40, 'Movimiento de prueba', '2019-01-16 00:00:00'),
(969, 1, 4, 'E', 'Movimiento de prueba 469', 2, 933, 33, 'Movimiento de prueba', '2018-11-02 00:00:00');
INSERT INTO `kardexalmhuevo` (`idAlmacenHuevos`, `idcolaborador`, `idhuevo`, `tipomovimiento`, `motivomovimiento`, `idlote`, `stockProducto`, `cantidad`, `descripcion`, `creado`) VALUES
(970, 1, 1, 'S', 'Movimiento de prueba 470', 2, 987, 47, 'Movimiento de prueba', '2018-08-12 00:00:00'),
(971, 1, 3, 'S', 'Movimiento de prueba 471', 2, 988, 39, 'Movimiento de prueba', '2018-10-01 00:00:00'),
(972, 1, 3, 'S', 'Movimiento de prueba 472', 2, 945, 39, 'Movimiento de prueba', '2019-03-13 00:00:00'),
(973, 1, 2, 'E', 'Movimiento de prueba 473', 2, 978, 12, 'Movimiento de prueba', '2019-08-11 00:00:00'),
(974, 1, 3, 'S', 'Movimiento de prueba 474', 2, 994, 42, 'Movimiento de prueba', '2019-01-01 00:00:00'),
(975, 1, 2, 'S', 'Movimiento de prueba 475', 2, 996, 59, 'Movimiento de prueba', '2018-07-18 00:00:00'),
(976, 1, 3, 'S', 'Movimiento de prueba 476', 2, 942, 58, 'Movimiento de prueba', '2019-02-18 00:00:00'),
(977, 1, 6, 'S', 'Movimiento de prueba 477', 2, 952, 49, 'Movimiento de prueba', '2018-11-21 00:00:00'),
(978, 1, 3, 'S', 'Movimiento de prueba 478', 2, 962, 22, 'Movimiento de prueba', '2018-11-03 00:00:00'),
(979, 1, 6, 'E', 'Movimiento de prueba 479', 2, 982, 26, 'Movimiento de prueba', '2018-08-21 00:00:00'),
(980, 1, 5, 'E', 'Movimiento de prueba 480', 2, 971, 27, 'Movimiento de prueba', '2019-03-29 00:00:00'),
(981, 1, 1, 'S', 'Movimiento de prueba 481', 2, 987, 33, 'Movimiento de prueba', '2019-05-10 00:00:00'),
(982, 1, 2, 'S', 'Movimiento de prueba 482', 2, 905, 30, 'Movimiento de prueba', '2019-08-14 00:00:00'),
(983, 1, 3, 'E', 'Movimiento de prueba 483', 2, 983, 52, 'Movimiento de prueba', '2019-06-01 00:00:00'),
(984, 1, 2, 'E', 'Movimiento de prueba 484', 2, 931, 50, 'Movimiento de prueba', '2018-07-30 00:00:00'),
(985, 1, 1, 'E', 'Movimiento de prueba 485', 2, 924, 56, 'Movimiento de prueba', '2019-07-16 00:00:00'),
(986, 1, 4, 'E', 'Movimiento de prueba 486', 2, 958, 32, 'Movimiento de prueba', '2019-01-20 00:00:00'),
(987, 1, 1, 'S', 'Movimiento de prueba 487', 2, 959, 12, 'Movimiento de prueba', '2019-01-30 00:00:00'),
(988, 1, 3, 'E', 'Movimiento de prueba 488', 2, 945, 28, 'Movimiento de prueba', '2018-12-25 00:00:00'),
(989, 1, 1, 'E', 'Movimiento de prueba 489', 2, 987, 27, 'Movimiento de prueba', '2018-08-05 00:00:00'),
(990, 1, 4, 'E', 'Movimiento de prueba 490', 2, 973, 55, 'Movimiento de prueba', '2018-11-23 00:00:00'),
(991, 1, 1, 'E', 'Movimiento de prueba 491', 2, 954, 27, 'Movimiento de prueba', '2018-07-17 00:00:00'),
(992, 1, 2, 'E', 'Movimiento de prueba 492', 2, 914, 33, 'Movimiento de prueba', '2019-07-08 00:00:00'),
(993, 1, 6, 'E', 'Movimiento de prueba 493', 2, 930, 34, 'Movimiento de prueba', '2019-02-17 00:00:00'),
(994, 1, 2, 'S', 'Movimiento de prueba 494', 2, 954, 46, 'Movimiento de prueba', '2018-06-15 00:00:00'),
(995, 1, 5, 'E', 'Movimiento de prueba 495', 2, 911, 20, 'Movimiento de prueba', '2019-04-30 00:00:00'),
(996, 1, 6, 'E', 'Movimiento de prueba 496', 2, 930, 25, 'Movimiento de prueba', '2019-04-16 00:00:00'),
(997, 1, 3, 'E', 'Movimiento de prueba 497', 2, 912, 30, 'Movimiento de prueba', '2019-03-31 00:00:00'),
(998, 1, 6, 'E', 'Movimiento de prueba 498', 2, 906, 26, 'Movimiento de prueba', '2018-12-19 00:00:00'),
(999, 1, 1, 'E', 'Movimiento de prueba 499', 2, 903, 29, 'Movimiento de prueba', '2019-06-26 00:00:00'),
(1000, 1, 6, 'E', 'Movimiento de prueba 500', 2, 931, 19, 'Movimiento de prueba', '2018-07-02 00:00:00'),
(1001, 1, 1, 'E', 'Entrada por Producción', 9, 6987, 6000, NULL, '2024-11-15 10:57:33'),
(1002, 1, 2, 'E', 'Entrada por Producción', 9, 1342, 400, NULL, '2024-11-15 10:57:42');

--
-- Disparadores `kardexalmhuevo`
--
DELIMITER $$
CREATE TRIGGER `trg_sumar_cantidad_kardex` AFTER INSERT ON `kardexalmhuevo` FOR EACH ROW BEGIN
    DECLARE totalCantidad INT;
    -- Sumar la cantidad de todos los registros que coincidan con la misma fecha y idlote
    SELECT SUM(cantidad) INTO totalCantidad
    FROM KardexAlmHuevo
    WHERE DATE(creado) = DATE(NEW.creado) AND idlote = NEW.idlote;

    -- Actualizar la columna cantHuevos en el último registro de controlLote
    UPDATE controlLote
    SET cantHuevos = totalCantidad
    WHERE idlote = NEW.idlote
    ORDER BY idcontrollote DESC
    LIMIT 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexalmproducto`
--

CREATE TABLE `kardexalmproducto` (
  `idAlmacenProducto` int(11) NOT NULL,
  `tipomovimiento` char(1) NOT NULL,
  `stockProducto` decimal(6,2) NOT NULL,
  `cantidad` decimal(6,2) NOT NULL,
  `motivomovimiento` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idcolaborador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kardexalmproducto`
--

INSERT INTO `kardexalmproducto` (`idAlmacenProducto`, `tipomovimiento`, `stockProducto`, `cantidad`, `motivomovimiento`, `descripcion`, `creado`, `idproducto`, `idcolaborador`) VALUES
(1, 'E', 300.00, 300.00, 'Ingreso inicial de stock', 'Stock de Maíz', '2024-11-01 08:00:00', 1, 1),
(2, 'E', 200.00, 200.00, 'Ingreso inicial de stock', 'Stock de Soya', '2024-11-01 08:10:00', 2, 1),
(3, 'E', 150.00, 150.00, 'Ingreso inicial de stock', 'Stock de Afrecho', '2024-11-01 08:20:00', 3, 1),
(4, 'E', 250.00, 250.00, 'Ingreso inicial de stock', 'Stock de Carbonato en Polvo', '2024-11-01 08:30:00', 4, 1),
(5, 'E', 250.00, 250.00, 'Ingreso inicial de stock', 'Stock de Carbonato en Grano', '2024-11-01 08:40:00', 5, 1),
(6, 'E', 80.00, 80.00, 'Ingreso inicial de stock', 'Stock de Aceite', '2024-11-01 08:50:00', 6, 1),
(7, 'E', 100.00, 100.00, 'Ingreso inicial de stock', 'Stock de Núcleo Postura', '2024-11-01 09:00:00', 7, 1),
(8, 'E', 100.00, 100.00, 'Ingreso inicial de stock', 'Stock de Núcleo Levante', '2024-11-01 09:10:00', 8, 1),
(9, 'E', 200.00, 200.00, 'Ingreso inicial de stock', 'Stock de Sal', '2024-11-01 09:20:00', 9, 1),
(10, 'E', 50.00, 50.00, 'Ingreso inicial de stock', 'Stock de Larvamix', '2024-11-01 09:30:00', 10, 1),
(11, 'E', 50.00, 50.00, 'Ingreso inicial de stock', 'Stock de Mycofung', '2024-11-01 09:40:00', 11, 1),
(12, 'E', 150.00, 150.00, 'Ingreso inicial de stock', 'Stock de Bicarbonato de Sodio', '2024-11-01 09:50:00', 12, 1),
(13, 'E', 20.00, 20.00, 'Ingreso inicial de stock', 'Stock de Casilleros', '2024-11-01 10:00:00', 13, 1),
(14, 'S', 290.00, 10.00, 'Salida por consumo diario', 'Consumo de Maíz', '2024-11-01 12:00:00', 1, 1),
(15, 'S', 180.00, 20.00, 'Salida por consumo diario', 'Consumo de Soya', '2024-11-01 12:10:00', 2, 1),
(16, 'S', 130.00, 20.00, 'Salida para mezcla de alimentos', 'Consumo de Afrecho', '2024-11-01 12:20:00', 3, 1),
(17, 'S', 245.00, 5.00, 'Salida para suplemento', 'Consumo de Carbonato en Polvo', '2024-11-01 12:30:00', 4, 1),
(18, 'S', 245.00, 5.00, 'Salida para suplemento', 'Consumo de Carbonato en Grano', '2024-11-01 12:40:00', 5, 1),
(19, 'E', 90.00, 10.00, 'Compra de emergencia', 'Reabastecimiento de Aceite', '2024-11-01 13:00:00', 6, 1),
(20, 'S', 95.00, 5.00, 'Salida para suplemento', 'Uso de Núcleo Postura', '2024-11-01 13:10:00', 7, 1),
(21, 'E', 105.00, 5.00, 'Compra adicional', 'Reabastecimiento de Núcleo Levante', '2024-11-01 13:20:00', 8, 1),
(22, 'S', 190.00, 10.00, 'Salida para preparación de alimento', 'Uso de Sal', '2024-11-01 13:30:00', 9, 1),
(23, 'S', 45.00, 5.00, 'Salida para control de plagas', 'Uso de Larvamix', '2024-11-01 14:00:00', 10, 1),
(24, 'S', 45.00, 5.00, 'Salida para control de hongos', 'Uso de Mycofung', '2024-11-01 14:10:00', 11, 1),
(25, 'S', 140.00, 10.00, 'Salida para control de acidez', 'Uso de Bicarbonato de Sodio', '2024-11-01 14:20:00', 12, 1),
(26, 'S', 15.00, 5.00, 'Salida para mantenimiento', 'Uso de Casilleros', '2024-11-01 14:30:00', 13, 1),
(27, 'E', 310.00, 20.00, 'Compra adicional de stock', 'Reabastecimiento de Maíz', '2024-11-02 08:00:00', 1, 1),
(28, 'S', 300.00, 10.00, 'Salida por consumo diario', 'Consumo de Maíz', '2024-11-02 08:10:00', 1, 1),
(29, 'E', 220.00, 20.00, 'Compra adicional de stock', 'Reabastecimiento de Soya', '2024-11-02 08:20:00', 2, 1),
(30, 'S', 200.00, 20.00, 'Salida por consumo diario', 'Consumo de Soya', '2024-11-02 08:30:00', 2, 1),
(31, 'E', 160.00, 30.00, 'Reabastecimiento de stock', 'Compra de Afrecho', '2024-11-02 08:40:00', 3, 1),
(32, 'S', 150.00, 10.00, 'Salida para mezcla de alimentos', 'Consumo de Afrecho', '2024-11-02 08:50:00', 3, 1),
(33, 'E', 255.00, 10.00, 'Reabastecimiento de stock', 'Compra de Carbonato en Polvo', '2024-11-02 09:00:00', 4, 1),
(34, 'S', 250.00, 5.00, 'Salida para suplemento', 'Consumo de Carbonato en Polvo', '2024-11-02 09:10:00', 4, 1),
(35, 'E', 255.00, 10.00, 'Reabastecimiento de stock', 'Compra de Carbonato en Grano', '2024-11-02 09:20:00', 5, 1),
(36, 'S', 250.00, 5.00, 'Salida para suplemento', 'Consumo de Carbonato en Grano', '2024-11-02 09:30:00', 5, 1),
(37, 'E', 85.00, 5.00, 'Reabastecimiento de stock', 'Compra de Aceite', '2024-11-02 09:40:00', 6, 1),
(38, 'S', 80.00, 5.00, 'Salida para consumo', 'Consumo de Aceite', '2024-11-02 09:50:00', 6, 1),
(39, 'E', 110.00, 10.00, 'Compra adicional', 'Reabastecimiento de Núcleo Postura', '2024-11-02 10:00:00', 7, 1),
(40, 'S', 100.00, 10.00, 'Salida para suplemento', 'Uso de Núcleo Postura', '2024-11-02 10:10:00', 7, 1),
(41, 'E', 115.00, 10.00, 'Compra adicional', 'Reabastecimiento de Núcleo Levante', '2024-11-02 10:20:00', 8, 1),
(42, 'S', 105.00, 10.00, 'Salida para suplemento', 'Uso de Núcleo Levante', '2024-11-02 10:30:00', 8, 1),
(43, 'E', 220.00, 20.00, 'Compra adicional', 'Reabastecimiento de Sal', '2024-11-02 10:40:00', 9, 1),
(44, 'S', 200.00, 20.00, 'Salida para preparación de alimento', 'Uso de Sal', '2024-11-02 10:50:00', 9, 1),
(45, 'E', 55.00, 10.00, 'Compra adicional', 'Reabastecimiento de Larvamix', '2024-11-02 11:00:00', 10, 1),
(46, 'S', 50.00, 5.00, 'Salida para control de plagas', 'Uso de Larvamix', '2024-11-02 11:10:00', 10, 1),
(47, 'E', 55.00, 10.00, 'Compra adicional', 'Reabastecimiento de Mycofung', '2024-11-02 11:20:00', 11, 1),
(48, 'S', 50.00, 5.00, 'Salida para control de hongos', 'Uso de Mycofung', '2024-11-02 11:30:00', 11, 1),
(49, 'E', 160.00, 10.00, 'Compra adicional', 'Reabastecimiento de Bicarbonato de Sodio', '2024-11-02 11:40:00', 12, 1),
(50, 'S', 150.00, 10.00, 'Salida para control de acidez', 'Uso de Bicarbonato de Sodio', '2024-11-02 11:50:00', 12, 1),
(51, 'E', 25.00, 5.00, 'Compra adicional', 'Reabastecimiento de Casilleros', '2024-11-02 12:00:00', 13, 1),
(52, 'S', 20.00, 5.00, 'Salida para mantenimiento', 'Uso de Casilleros', '2024-11-02 12:10:00', 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numlote`
--

CREATE TABLE `numlote` (
  `idlote` int(11) NOT NULL,
  `numLote` int(11) NOT NULL,
  `CantInicio` int(11) NOT NULL,
  `edadAve` int(11) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `descripcion` varchar(60) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `numlote`
--

INSERT INTO `numlote` (`idlote`, `numLote`, `CantInicio`, `edadAve`, `estado`, `descripcion`, `create_at`) VALUES
(1, 1, 3000, 90, 'I', 'Lote Finalizado', '2017-03-01 00:00:00'),
(2, 2, 4000, 100, 'I', 'Lote Finalizado', '2018-06-15 00:00:00'),
(3, 3, 4000, 101, 'I', 'Lote Finalizado', '2019-09-10 00:00:00'),
(4, 4, 4500, 97, 'I', 'Lote Finalizado', '2020-12-25 00:00:00'),
(5, 5, 6000, 100, 'I', 'Lote Finalizado', '2021-02-18 00:00:00'),
(6, 6, 6000, 95, 'I', 'Lote Finalizado', '2022-05-11 00:00:00'),
(7, 7, 7000, 91, 'I', 'Lote Finalizado', '2023-07-20 00:00:00'),
(8, 8, 7120, 106, 'I', 'Lote Finalizado', '2023-11-04 00:00:00'),
(9, 9, 7120, 93, 'A', 'Lote en Proceso', '2024-01-22 00:00:00'),
(10, 10, 6120, 21, 'A', 'Lote en Proceso', '2024-06-30 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermisos` int(11) NOT NULL,
  `permisos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosasignados`
--

CREATE TABLE `permisosasignados` (
  `idpermisoAsignados` int(11) NOT NULL,
  `idpermisos` int(11) DEFAULT NULL,
  `idroles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL,
  `apematerno` varchar(50) DEFAULT NULL,
  `apepaterno` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `nrodocumento` char(12) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idpersona`, `apematerno`, `apepaterno`, `nombres`, `nrodocumento`, `create_at`, `inactive_at`) VALUES
(1, 'ROJAS', 'BULEJE', 'BRAULIO DANIEL', '76363997', '2024-11-15 10:52:35', NULL),
(2, 'JACOBO', 'ORTIZ', 'EMERSSON ALEJANDRO', '73039705', '2024-11-15 10:52:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `stockminimo` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `producto`, `stockminimo`, `descripcion`) VALUES
(1, 'Maíz', 300, 'Maíz amarillo, utilizado como base en la alimentación de aves'),
(2, 'Soya', 200, 'Soya molida para incrementar el contenido proteico en la dieta'),
(3, 'Afrecho', 150, 'Subproducto de trigo para complementar la alimentación'),
(4, 'Carbonato en Polvo', 250, 'Carbonato de calcio en polvo para fortalecer cáscaras de huevo'),
(5, 'Carbonato en Grano', 250, 'Carbonato de calcio en grano, fuente de calcio para aves'),
(6, 'Aceite', 80, 'Aceite vegetal para enriquecer las dietas con grasas esenciales'),
(7, 'Núcleo Postura', 100, 'Suplemento vitamínico y mineral para gallinas ponedoras'),
(8, 'Núcleo Levante', 100, 'Suplemento para mejorar el crecimiento en etapa de levante'),
(9, 'Sal', 200, 'Sal común utilizada para balancear minerales en la dieta'),
(10, 'Larvamix', 50, 'Producto para control de larvas y plagas en el ambiente de aves'),
(11, 'Mycofung', 50, 'Aditivo antifúngico para el control de hongos en alimentos'),
(12, 'Bicarbonato de Sodio', 150, 'Suplemento para regular la acidez y mejorar la digestión en aves'),
(13, 'Casilleros', 20, 'Casilleros para almacenamiento y organización de herramientas y productos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_users`
--

CREATE TABLE `roles_users` (
  `idroles_users` int(11) NOT NULL,
  `idcolaborador` int(11) NOT NULL,
  `idroles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohuevo`
--

CREATE TABLE `tipohuevo` (
  `idhuevo` int(11) NOT NULL,
  `tiposHuevos` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipohuevo`
--

INSERT INTO `tipohuevo` (`idhuevo`, `tiposHuevos`, `descripcion`) VALUES
(1, 'Comerciales', 'Huevos aptos para comercialización estándar'),
(2, 'Pardo', 'Huevos de cáscara marrón'),
(3, 'Sucio', 'Huevos con cáscara sucia o manchada'),
(4, 'Doble Yema', 'Huevos con doble yema en su interior'),
(5, 'Margarito', 'Huevos con mucho tamaño'),
(6, 'Merma', 'Huevos que no cumplen con los estándares de calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idcolaborador` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `direccion` varchar(50) DEFAULT NULL,
  `PrecioVenta` decimal(7,2) DEFAULT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'Por entregar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_stock_minimo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_stock_minimo` (
`producto` varchar(100)
,`stockProducto` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_stock_minimo`
--
DROP TABLE IF EXISTS `vista_productos_stock_minimo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_stock_minimo`  AS SELECT `p`.`producto` AS `producto`, `k`.`stockProducto` AS `stockProducto` FROM (`productos` `p` join `kardexalmproducto` `k` on(`p`.`idproducto` = `k`.`idproducto`)) WHERE `k`.`creado` = (select max(`k2`.`creado`) from `kardexalmproducto` `k2` where `k2`.`idproducto` = `p`.`idproducto`) AND `k`.`stockProducto` <= `p`.`stockminimo` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `fk_idpersona_cliente` (`idpersona`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`idcolaborador`),
  ADD UNIQUE KEY `uk_idpersona_usu` (`idpersona`);

--
-- Indices de la tabla `controllote`
--
ALTER TABLE `controllote`
  ADD PRIMARY KEY (`idcontrollote`),
  ADD KEY `FK_numLote_controllote` (`idlote`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`iddetalleventa`),
  ADD KEY `fk_idhuevo_detalleventa` (`idhuevo`),
  ADD KEY `fk_idventa_detalleventa` (`idventa`);

--
-- Indices de la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
  ADD PRIMARY KEY (`idAlmacenHuevos`),
  ADD KEY `fk_idhuevo` (`idhuevo`),
  ADD KEY `FK_idlote` (`idlote`),
  ADD KEY `fk_idcolaborador_huevo` (`idcolaborador`);

--
-- Indices de la tabla `kardexalmproducto`
--
ALTER TABLE `kardexalmproducto`
  ADD PRIMARY KEY (`idAlmacenProducto`),
  ADD KEY `fk_idproducto` (`idproducto`),
  ADD KEY `fk_idcolaborador` (`idcolaborador`);

--
-- Indices de la tabla `numlote`
--
ALTER TABLE `numlote`
  ADD PRIMARY KEY (`idlote`),
  ADD UNIQUE KEY `numLote` (`numLote`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermisos`);

--
-- Indices de la tabla `permisosasignados`
--
ALTER TABLE `permisosasignados`
  ADD PRIMARY KEY (`idpermisoAsignados`),
  ADD KEY `fk_idpermisos` (`idpermisos`),
  ADD KEY `fk_idroles` (`idroles`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `uk_nrodocumento_per` (`nrodocumento`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD UNIQUE KEY `producto` (`producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`idroles_users`),
  ADD KEY `fk_roles_users` (`idroles`),
  ADD KEY `fk_roles_users_idcolaborador` (`idcolaborador`);

--
-- Indices de la tabla `tipohuevo`
--
ALTER TABLE `tipohuevo`
  ADD PRIMARY KEY (`idhuevo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_idcliente_venta` (`idcliente`),
  ADD KEY `fk_idcolaborador_venta` (`idcolaborador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `idcolaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `controllote`
--
ALTER TABLE `controllote`
  MODIFY `idcontrollote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2502;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
  MODIFY `idAlmacenHuevos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT de la tabla `kardexalmproducto`
--
ALTER TABLE `kardexalmproducto`
  MODIFY `idAlmacenProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `numlote`
--
ALTER TABLE `numlote`
  MODIFY `idlote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermisos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisosasignados`
--
ALTER TABLE `permisosasignados`
  MODIFY `idpermisoAsignados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idroles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `idroles_users` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipohuevo`
--
ALTER TABLE `tipohuevo`
  MODIFY `idhuevo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_idpersona_cliente` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`);

--
-- Filtros para la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD CONSTRAINT `fk_idpersona_usu` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`);

--
-- Filtros para la tabla `controllote`
--
ALTER TABLE `controllote`
  ADD CONSTRAINT `FK_numLote_controllote` FOREIGN KEY (`idlote`) REFERENCES `numlote` (`idlote`);

--
-- Filtros para la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD CONSTRAINT `fk_idhuevo_detalleventa` FOREIGN KEY (`idhuevo`) REFERENCES `tipohuevo` (`idhuevo`),
  ADD CONSTRAINT `fk_idventa_detalleventa` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`);

--
-- Filtros para la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
  ADD CONSTRAINT `FK_idlote` FOREIGN KEY (`idlote`) REFERENCES `numlote` (`idlote`),
  ADD CONSTRAINT `fk_idcolaborador_huevo` FOREIGN KEY (`idcolaborador`) REFERENCES `colaboradores` (`idcolaborador`),
  ADD CONSTRAINT `fk_idhuevo` FOREIGN KEY (`idhuevo`) REFERENCES `tipohuevo` (`idhuevo`);

--
-- Filtros para la tabla `kardexalmproducto`
--
ALTER TABLE `kardexalmproducto`
  ADD CONSTRAINT `fk_idcolaborador` FOREIGN KEY (`idcolaborador`) REFERENCES `colaboradores` (`idcolaborador`),
  ADD CONSTRAINT `fk_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `permisosasignados`
--
ALTER TABLE `permisosasignados`
  ADD CONSTRAINT `fk_idpermisos` FOREIGN KEY (`idpermisos`) REFERENCES `permisos` (`idpermisos`),
  ADD CONSTRAINT `fk_idroles` FOREIGN KEY (`idroles`) REFERENCES `roles` (`idroles`);

--
-- Filtros para la tabla `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `fk_roles_users` FOREIGN KEY (`idroles`) REFERENCES `roles` (`idroles`),
  ADD CONSTRAINT `fk_roles_users_idcolaborador` FOREIGN KEY (`idcolaborador`) REFERENCES `colaboradores` (`idcolaborador`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_idcliente_venta` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `fk_idcolaborador_venta` FOREIGN KEY (`idcolaborador`) REFERENCES `colaboradores` (`idcolaborador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
