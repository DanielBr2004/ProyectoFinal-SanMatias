DROP DATABASE IF EXISTS GranjaSanMatias;
CREATE DATABASE GranjaSanMatias;

use GranjaSanMatias;
-- TABLA ROLES  --
 CREATE TABLE roles
   (
   idroles		INT AUTO_INCREMENT PRIMARY KEY,
   rol	 		VARCHAR(20) unique
   )ENGINE = INNODB;
   -- TABLA PERMISOS --
   CREATE TABLE permisos
   (
   idpermisos		INT AUTO_INCREMENT PRIMARY KEY,
   permisos	 		VARCHAR(100)
   )ENGINE = INNODB;
   -- TABLA PERMISOS ASIGNADOS --
   CREATE TABLE  PermisosAsignados
   (
   idpermisoAsignados	INT AUTO_INCREMENT PRIMARY KEY,
   idpermisos	INT NULL,
   idroles		INT NULL,
   CONSTRAINT fk_idpermisos FOREIGN KEY (idpermisos) REFERENCES permisos(idpermisos),
   CONSTRAINT fk_idroles FOREIGN KEY (idroles) REFERENCES roles(idroles)
   )ENGINE = INNODB;
   
   -- TABLA PERSONA -- 
   CREATE TABLE personas 
   (
   	idpersona		INT AUTO_INCREMENT PRIMARY KEY,
    apematerno		VARCHAR(50)			NULL,
    apepaterno		VARCHAR(50)			NULL,
    nombres			VARCHAR(50) 		NULL,
    nrodocumento	CHAR(12)			NOT NULL,
    create_at		DATETIME			NOT NULL DEFAULT NOW(),
    inactive_at		DATETIME			NULL,
    CONSTRAINT uk_nrodocumento_per UNIQUE (nrodocumento)
   )ENGINE = INNODB;
   
   -- TABLA COLABORADORES -- 
   CREATE TABLE colaboradores
(
	idcolaborador				INT AUTO_INCREMENT PRIMARY KEY,
    nomusuario					varchar(60)	NOT NULL,
    passusuario					varchar(120) not null,
	idpersona 					INT	NOT NULL,
    create_at					DATETIME			NOT NULL DEFAULT NOW(),
    inactive_at					DATETIME			NULL,
    CONSTRAINT fk_idpersona_usu FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
    CONSTRAINT uk_idpersona_usu UNIQUE (idpersona)
)ENGINE = INNODB;

   -- TABLA ROLES-USUARIOS
   
   CREATE TABLE roles_users
   (
   idroles_users 	INT AUTO_INCREMENT PRIMARY KEY,
   idcolaborador 	INT NOT NULL,
   idroles			INT NOT NULL,
	CONSTRAINT fk_roles_users FOREIGN KEY (idroles) REFERENCES roles(idroles),
	CONSTRAINT fk_roles_users_idcolaborador FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
   )ENGINE = INNODB;

-- TABLA PRODUCTO -- 
CREATE TABLE Productos 
(
idproducto 		INT AUTO_INCREMENT PRIMARY KEY,
producto		VARCHAR(100) NOT NULL UNIQUE,
stockminimo		INT NULL,
descripcion		VARCHAR(100) NULL
)ENGINE = INNODB;

-- TABLA KARDEX ALMACEN DE PRODUCTOS O INSUMOS --
CREATE TABLE KardexAlmProducto
(
idAlmacenProducto		INT AUTO_INCREMENT PRIMARY KEY,
tipomovimiento			CHAR(1) NOT NULL,
stockProducto			DECIMAL(6,2) NOT NULL,
cantidad				DECIMAL(6,2) NOT NULL,
motivomovimiento		VARCHAR(100)NOT NULL,
descripcion         	VARCHAR(100) NULL,
creado					DATETIME NULL,
idproducto				INT NULL,
idcolaborador			INT NULL,
CONSTRAINT fk_idproducto  FOREIGN KEY (idproducto) REFERENCES Productos(idproducto),
CONSTRAINT fk_idcolaborador FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
)ENGINE = INNODB;
-- TIPO DE HUEVO --
CREATE TABLE tipoHuevo 
(
idhuevo			INT AUTO_INCREMENT PRIMARY KEY,
tiposHuevos			VARCHAR(50),
PrecioKg          DECIMAL(6,2) NOT NULL,
descripcion			VARCHAR(250)
)ENGINE = INNODB;

-- NUMLOTE -- 
CREATE TABLE numLote
(
idlote INT AUTO_INCREMENT PRIMARY KEY,
numLote		INT NOT NULL UNIQUE,
CantInicio	INT NOT NULL,
edadAve		   INT  NULL,
estado 		CHAR(1) NOT NULL DEFAULT 'A',
descripcion VARCHAR(60) NULL,
create_at	DATE		NOT NULL
)ENGINE = INNODB;

-- KARDEX ALMACEN DE HUEVOS --
CREATE TABLE KardexAlmHuevo
(
idAlmacenHuevos		INT AUTO_INCREMENT PRIMARY KEY,
idcolaborador			INT NOT NULL,
idhuevo					INT NOT NULL,
tipomovimiento			CHAR(1) NOT NULL,
motivomovimiento		VARCHAR(100) NOT NULL,
idlote					INT,
stockProducto			INT NOT NULL,
cantidad				   INT NOT NULL,
descripcion          VARCHAR(100) NULL,
creado					DATETIME NULL,
CONSTRAINT fk_idhuevo  FOREIGN KEY (idhuevo) REFERENCES tipoHuevo(idhuevo),
CONSTRAINT FK_idlote  FOREIGN KEY (idlote) REFERENCES numLote(idlote),
CONSTRAINT fk_idcolaborador_huevo FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
)ENGINE = INNODB;

-- CLIENTE --
CREATE TABLE cliente
(
idcliente 			INT AUTO_INCREMENT PRIMARY KEY,
idpersona			INT NOT NULL,
telefono			CHAR(9) NULL,
tipodocumento		CHAR(3) NOT NULL,
razonsocial			VARCHAR(90) NULL,
direccion			VARCHAR(90) NULL,
estado            CHAR(1) DEFAULT 'A',
email             VARCHAR(90) NULL,  
CONSTRAINT fk_idpersona_cliente FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)engine = InnoDB;
-- VENTAS -- 
CREATE TABLE ventas
(
idventa				INT AUTO_INCREMENT primary key ,
idcliente			INT NOT NULL,
idcolaborador		INT NOT NULL,
fecha 				DATETIME DEFAULT NOW() NOT NULL,
estado				VARCHAR(30) DEFAULT 'Por entregar' NOT NULL,
CONSTRAINT fk_idcliente_venta FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
CONSTRAINT fk_idcolaborador_venta FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
)engine = InnoDB;

CREATE TABLE detalleventas
(
iddetalleventa		INT AUTO_INCREMENT PRIMARY KEY,
idventa				INT NOT NULL,
idhuevo				INT NOT NULL,
pesoTotal         DECIMAL(6,2) NOT NULL,
cantidad			   INT NOT NULL,
precioVenta 		DECIMAL(10, 2) NOT NULL,
UnidadMedida		VARCHAR(30) NULL,
CONSTRAINT fk_idhuevo_detalleventa FOREIGN KEY (idhuevo) REFERENCES tipoHuevo(idhuevo),
CONSTRAINT fk_idventa_detalleventa FOREIGN KEY (idventa) REFERENCES ventas(idventa)
)engine = innodb;



CREATE TABLE controlLote
(
idcontrollote 			INT AUTO_INCREMENT PRIMARY KEY,
idlote					INT NOT NULL,
numaves					INT NOT NULL,
mortalidad				int NOT NULL,
alimento				DECIMAL(6,2) NOT NULL,
alimentoAve				DECIMAL(6,2) NOT NULL,
produccion				DECIMAL(6,2)  NULL,
cantHuevos				INT NULL,
create_at				DATE NOT NULL,
CONSTRAINT FK_numLote_controllote FOREIGN KEY (idlote) REFERENCES numLote(idlote)
)ENGINE = INNODB;

CREATE TABLE HistorialKardexHuevo (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idAlmacenHuevos INT,
    idcolaborador INT,
    accion VARCHAR(20),
    datos_anteriores TEXT,
    datos_nuevos TEXT,
    fecha_accion DATETIME DEFAULT NOW()
);

CREATE TABLE HistorialKardexProducto (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idAlmacenProducto INT,
    idcolaborador INT,
    accion VARCHAR(20),
    datos_anteriores TEXT,
    datos_nuevos TEXT,
    fecha_accion DATETIME DEFAULT NOW()
);













   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   