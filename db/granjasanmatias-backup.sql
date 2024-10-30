-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 20:46:04
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_kardexhuevo` (IN `_idAlmacenHuevos` INT, IN `_motivomovimiento` VARCHAR(500), IN `_cantidad` SMALLINT, IN `_descripcion` VARCHAR(100))   BEGIN
    DECLARE _stockProducto INT;
    -- Obtener el stock actual antes de la actualización
    SELECT stockProducto INTO _stockProducto FROM KardexAlmHuevo WHERE idAlmacenHuevos = _idAlmacenHuevos;
    -- Actualizar la cantidad y el motivo de movimiento
    UPDATE KardexAlmHuevo
    SET 
        motivomovimiento = _motivomovimiento,
        cantidad = _cantidad,
        descripcion = NULLIF(_descripcion, ''),
        creado = NOW()
    WHERE idAlmacenHuevos = _idAlmacenHuevos;

    -- Actualizar el stock de productos basado en el nuevo movimiento
    IF _motivomovimiento LIKE 'Salida%' THEN
        SET _stockProducto = _stockProducto - _cantidad;  -- Salida
    ELSEIF _motivomovimiento LIKE 'Entrada%' THEN
        SET _stockProducto = _stockProducto + _cantidad;  -- Entrada
    END IF;
    -- Actualizar el stock en el registro
    UPDATE KardexAlmHuevo
    SET stockProducto = _stockProducto
    WHERE idAlmacenHuevos = _idAlmacenHuevos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_productos` (IN `_idproducto` INT, IN `_producto` VARCHAR(100), IN `_descripcion` VARCHAR(100))   BEGIN
    UPDATE productos
    SET producto = _producto,
        descripcion = _descripcion
    WHERE idproducto = _idproducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_productos` (IN `_idproducto` INT)   BEGIN
    DELETE FROM productos
    WHERE idproducto = _idproducto;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_insertar_kardexhuevo` (IN `_idcolaborador` INT, IN `_idhuevo` INT, IN `_tipomovimiento` CHAR(1), IN `_motivomoviento` VARCHAR(500), IN `_cantidad` SMALLINT, IN `_descripcion` VARCHAR(100))   BEGIN
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
    INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, stockProducto, cantidad, descripcion, creado)
    VALUES (_idcolaborador, _idhuevo, _tipomovimiento, _motivomoviento, _stockProducto, _cantidad, NULLIF(_descripcion,''), NOW());
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
		PER.nrodocumento,
        PER.apepaterno,
        PER.apematerno,
        PER.nombres,
		COL.nomusuario
		FROM colaboradores COL 
        LEFT JOIN personas PER
        ON PER.idpersona = COL.idpersona 
        ORDER BY idcolaborador DESC ;
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
        kh.creado
    FROM KardexAlmHuevo kh
    JOIN colaboradores c ON kh.idcolaborador = c.idcolaborador
    JOIN tipoHuevo th ON kh.idhuevo = th.idhuevo
    ORDER BY kh.creado DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_productos` ()   BEGIN
    SELECT * FROM productos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_tipohuevo` ()   BEGIN
    SELECT * FROM tipohuevo;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_Detalleventas` (IN `_idventa` INT, IN `_idhuevo` INT, IN `_cantidad` INT, IN `_pesoTotal` DECIMAL(7,2), IN `_preciounitario` DECIMAL(6,2), IN `_preciototal` DECIMAL(10,2))   BEGIN 
 -- declara variable de stock
	DECLARE _stockProducto DECIMAL(6,2) DEFAULT 0;
    DECLARE _iduser INT;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_productos` (IN `_producto` VARCHAR(60), IN `_descripcion` VARCHAR(60))   BEGIN
	INSERT INTO productos 
		(producto, descripcion) VALUES 
        (_producto, _descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_ventas` (IN `_idcliente` INT, IN `_idcolaborador` INT, IN `_direccion` VARCHAR(90))   BEGIN 
    INSERT INTO ventas(idcliente, idcolaborador, direccion) 
    VALUES(_idcliente, _idcolaborador, _direccion);
    SELECT @@last_insert_id AS idventa;
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

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `idpersona`, `telefono`, `tipodocumento`, `razonsocial`, `direccion`, `email`) VALUES
(1, 2, '123456789', 'DNI', '', 'Grocio Prado S/N', 'loyola@gmail.com');

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
(1, 'BBuleje', '$2y$10$qUlMNWuW6wdkZ0ZHIpNkl.hYm6Rc7GpxYDEp/NWmTPQS/wZw7FZvS', 1, '2024-10-30 14:36:50', NULL);

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
-- Volcado de datos para la tabla `detalleventas`
--

INSERT INTO `detalleventas` (`iddetalleventa`, `idventa`, `idhuevo`, `cantidad`, `PesoTotal`, `precioUnitario`, `precioTotal`) VALUES
(1, 1, 1, 500, 1500.00, 4.00, 6000.00);

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
  `stockProducto` varchar(100) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `creado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kardexalmhuevo`
--

INSERT INTO `kardexalmhuevo` (`idAlmacenHuevos`, `idcolaborador`, `idhuevo`, `tipomovimiento`, `motivomovimiento`, `stockProducto`, `cantidad`, `descripcion`, `creado`) VALUES
(1, 1, 1, 'E', 'Entrada por Producción', '1000', '1000', NULL, '2024-10-30 14:38:32'),
(2, 1, 1, 'S', 'Salida por Venta', '500.00', '500', NULL, '2024-10-30 14:40:57');

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
(1, 'ROJAS', 'BULEJE', 'BRAULIO DANIEL', '76363997', '2024-10-30 14:36:45', NULL),
(2, 'TORRES', 'LOYOLA', 'MIGUEL ALEXANDER', '73217990', '2024-10-30 14:39:19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `producto`, `descripcion`) VALUES
(1, 'soya', ''),
(2, 'afrecho', '');

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
(5, 'Merma', 'Huevos que no cumplen con los estándares de calidad');

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
  `estado` varchar(30) NOT NULL DEFAULT 'Por entregar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `idcliente`, `idcolaborador`, `fecha`, `direccion`, `estado`) VALUES
(1, 1, 1, '2024-10-30 14:40:57', 'Grocio Prado S/N', 'Por entregar');

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
  ADD KEY `fk_idcolaborador_huevo` (`idcolaborador`);

--
-- Indices de la tabla `kardexalmproducto`
--
ALTER TABLE `kardexalmproducto`
  ADD PRIMARY KEY (`idAlmacenProducto`),
  ADD KEY `fk_idproducto` (`idproducto`),
  ADD KEY `fk_idcolaborador` (`idcolaborador`);

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
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `idcolaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
  MODIFY `idAlmacenHuevos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `kardexalmproducto`
--
ALTER TABLE `kardexalmproducto`
  MODIFY `idAlmacenProducto` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `idhuevo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Filtros para la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD CONSTRAINT `fk_idhuevo_detalleventa` FOREIGN KEY (`idhuevo`) REFERENCES `tipohuevo` (`idhuevo`),
  ADD CONSTRAINT `fk_idventa_detalleventa` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`);

--
-- Filtros para la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
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
