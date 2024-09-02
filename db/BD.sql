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
    apematerno		VARCHAR(50)			NOT NULL,
    apepaterno		VARCHAR(50)			NOT NULL,
    nombres			VARCHAR(50) 		NOT NULL,
    nrodocumento	CHAR(8)				NOT NULL,
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
producto		VARCHAR(100),
descripcion		VARCHAR(100)
)ENGINE = INNODB;

-- TABLA KARDEX ALMACEN DE PRODUCTOS O INSUMOS --
CREATE TABLE KardexAlmProducto
(
idAlmacenProducto		INT AUTO_INCREMENT PRIMARY KEY,
tipomovimiento			CHAR(1) NOT NULL,
stockProducto			VARCHAR(100) NOT NULL,
cantidad				VARCHAR(50) NOT NULL,
motivomovimiento		VARCHAR(100)NOT NULL,
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
descripcion			VARCHAR(100)
)ENGINE = INNODB;

-- KARDEX ALMACEN DE HUEVOS --
CREATE TABLE KardexAlmHuevo
(
idAlmacenHuevos		INT AUTO_INCREMENT PRIMARY KEY,
tipomovimiento			CHAR(1) NOT NULL,
stockProducto			VARCHAR(100),
cantidad				VARCHAR(50),
motivomovimiento		VARCHAR(100),
creado					DATETIME NULL,
idhuevo					INT NULL,
idcolaborador			INT NULL,
CONSTRAINT fk_idhuevo  FOREIGN KEY (idhuevo) REFERENCES tipoHuevo(idhuevo),
CONSTRAINT fk_idcolaborador_huevo FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
)ENGINE = INNODB;

-- DEPARTAMENTO --
create table departamentos(
iddepartamento 		int auto_increment primary key,
departamento		varchar(100)
)engine = InnoDB;

-- PORVINCIA -- 
create table provincias (
idprovincia	 int auto_increment primary key,
iddepartamento	int null,
provincia		varchar(100),
CONSTRAINT fk_departamento FOREIGN KEY (iddepartamento) REFERENCES departamentos (iddepartamento)
) engine = InnoDB;

-- DISTRITO -- 
create table distritos(
iddistrito	int auto_increment primary key,
idprovincia		int null,
distrito		varchar(100),
CONSTRAINT fk_provincia FOREIGN KEY (idprovincia) REFERENCES provincias (idprovincia)
)engine = InnoDB;

-- CLIENTE --
CREATE TABLE cliente
(
idcliente 			INT AUTO_INCREMENT PRIMARY KEY,
idpersona			INT NULL,
cliente				varchar(50),
CONSTRAINT fk_idpersona_cliente FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)engine = InnoDB;
-- VENTAS -- 
CREATE TABLE ventas
(
idventa				INT AUTO_INCREMENT primary key ,
iddistrito			INT NULL ,
idcliente			INT NULL,
idcolaborador		INT NULL,
fecha 				DATETIME NULL,
precioUnitario		DECIMAL(10, 2),
precioTotal			DECIMAL(10, 2),
cantidad_solicitada INT NOT NULL,
CONSTRAINT fk_iddistrito_venta FOREIGN KEY (iddistrito) REFERENCES distritos(iddistrito),
CONSTRAINT fk_idcliente_venta FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
CONSTRAINT fk_idcolaborador_venta FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idcolaborador)
)engine = InnoDB;

-- DETALLE VENTA -- // REVISAR
CREATE TABLE peso
(
idpeso				INT AUTO_INCREMENT PRIMARY KEY,
idhuevo				INT NULL,
idventa				INT NOT NULL,
peso				DECIMAL(10, 2),
CONSTRAINT fk_idhuevo_peso  FOREIGN KEY (idhuevo) REFERENCES tipoHuevo(idhuevo),
CONSTRAINT fk_idventa_peso FOREIGN KEY (idventa) REFERENCES ventas(idventa)
)ENGINE = INNODB;















   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   