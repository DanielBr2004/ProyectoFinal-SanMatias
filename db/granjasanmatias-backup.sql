-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2024 a las 20:18:07
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
		PER.idpersona,
        CLI.idcliente,
        PER.apepaterno, 
        PER.apematerno,
        PER.nombres,
        CLI.telefono,
        CLI.razonsocial,
        CLI.direccion
		FROM personas PER 
        LEFT JOIN cliente CLI
        ON CLI.idpersona = PER.idpersona 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_insertar_KardexAlmProducto` (IN `_idcolaborador` INT, IN `_idproducto` INT, IN `_tipomovimiento` CHAR(1), IN `_motivomoviento` VARCHAR(100), IN `_cantidad` SMALLINT, IN `_descripcion` VARCHAR(100))   BEGIN
	-- Stock Actual declarada por defecto en 0
    DECLARE _stockProducto INT DEFAULT 0;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_personas_registrar` (IN `_apepaterno` VARCHAR(60), IN `_apematerno` VARCHAR(60), IN `_nombres` VARCHAR(40), IN `_nrodocumento` CHAR(12))   BEGIN
	INSERT INTO personas 
		(apepaterno, apematerno, nombres, nrodocumento) VALUES 
        (_apepaterno, _apematerno, _nombres, _nrodocumento);
	SELECT @@last_insert_id 'idpersona';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_productos` (IN `_producto` VARCHAR(60), IN `_descripcion` VARCHAR(60))   BEGIN
	INSERT INTO productos 
		(producto, descripcion) VALUES 
        (_producto, _descripcion);
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
(1, 'DanielBr', '$2y$10$86IWpKbDSQDGRJjoIt2EYuSZtesF2ShaFnKNzeZWABJnib5wCADKK', 1, '2024-10-11 18:17:45', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `iddistrito` int(11) NOT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexalmproducto`
--

CREATE TABLE `kardexalmproducto` (
  `idAlmacenProducto` int(11) NOT NULL,
  `tipomovimiento` char(1) NOT NULL,
  `stockProducto` varchar(100) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
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
(1, 'Rojas', 'Buleje', 'Daniel', '76363997', '2024-10-11 18:17:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `iddistrito` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `precioTotal` decimal(10,2) DEFAULT NULL,
  `cantidad_solicitada` int(11) NOT NULL,
  `idAlmacenHuevos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`iddistrito`),
  ADD KEY `fk_provincia` (`idprovincia`);

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
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`),
  ADD KEY `fk_departamento` (`iddepartamento`);

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
  ADD KEY `fk_idAlmacenHuevos_venta` (`idAlmacenHuevos`),
  ADD KEY `fk_iddistrito_venta` (`iddistrito`),
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
  MODIFY `idcolaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `iddistrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardexalmhuevo`
--
ALTER TABLE `kardexalmhuevo`
  MODIFY `idAlmacenHuevos` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `fk_provincia` FOREIGN KEY (`idprovincia`) REFERENCES `provincias` (`idprovincia`);

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
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`);

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
  ADD CONSTRAINT `fk_idAlmacenHuevos_venta` FOREIGN KEY (`idAlmacenHuevos`) REFERENCES `kardexalmhuevo` (`idAlmacenHuevos`),
  ADD CONSTRAINT `fk_idcliente_venta` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `fk_idcolaborador_venta` FOREIGN KEY (`idcolaborador`) REFERENCES `colaboradores` (`idcolaborador`),
  ADD CONSTRAINT `fk_iddistrito_venta` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
