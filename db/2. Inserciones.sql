use GranjaSanMatias;
-- INSERTAR DATOS EN LA TABLA ROLES
INSERT INTO roles (rol) VALUES ('Administrador');
INSERT INTO roles (rol) VALUES ('Usuario');
Select * from roles;
-- INSERTAR DATOS EN LA TABLA PERMISOS
INSERT INTO permisos (permisos) VALUES ('Crear');
INSERT INTO permisos (permisos) VALUES ('Leer');
INSERT INTO permisos (permisos) VALUES ('Eliminar');
Select * from permisos;
-- INSERTAR DATOS EN LA TABLA PERMISOS ASIGNADOS
INSERT INTO PermisosAsignados (idpermisos, idroles) VALUES (1, 1);  -- crear
INSERT INTO PermisosAsignados (idpermisos, idroles) VALUES (2, 2);  -- leer
INSERT INTO PermisosAsignados (idpermisos, idroles) VALUES (3, 1);  -- eliminars
Select * from PermisosAsignados;
-------------------------------------- CULMINADO PERMISOS -------------------------------
-- INSERTAR DATOS EN LA TABLA PERSONAS
INSERT INTO personas (apematerno, apepaterno, nombres, nrodocumento) VALUES 
('Gómez', 'Pérez', 'Juan', '12345678'),
('Rodríguez', 'López', 'María', '87654321'),
('Martínez', 'Hernández', 'Carlos', '11223344');
Select * from personas;

-- INSERTAR DATOS EN LA TABLA COLABORADORES
INSERT INTO colaboradores (nomusuario, passusuario, idpersona) VALUES 
('gomez1', 'hola123', 1),
('rodrigyues1', 'lopex25', 2),
('martinez12', 'carl123', 3);
Select * from colaboradores;

-- INSERTAR DATOS EN LA TABLA ROLES_USUARIOS
INSERT INTO roles_users (idcolaborador, idroles) VALUES
(1,1),
(1,2),
(2,2);
select * from roles_users;

-- INSERTAR DATOS EN LA TABLA PRODUCTOS
INSERT INTO Productos (producto, descripcion) VALUES 
('Soya', 'Granos de soya ricos en proteínas'),
('Afrecho', 'Subproducto de la molienda de cereales'),
('Maíz', 'Granos de maíz secos y seleccionados'),
('Carbonato', 'Carbonato de calcio para suplemento mineral');
Select * from Productos;

-- INSERTAR DATOS PARA MOVIMIENTO DE "ENTRADA"
INSERT INTO KardexAlmProducto (tipomovimiento, stockProducto, cantidad, motivomovimiento, creado, idproducto, idcolaborador) VALUES 
('E', '100 unidades', '50', 'Recepción de mercancía', NOW(), 1, 1),
('S', '50 unidades', '20', 'Venta de productos', NOW(), 2, 2);
select * from KardexAlmProducto;

-- INSERTAR DATOS EN LA TABLA TIPOHUEVO
INSERT INTO tipoHuevo (tiposHuevos, descripcion) VALUES 
('Comerciales', 'Huevos aptos para comercialización estándar'),
('Pardo', 'Huevos de cáscara marrón'),
('Sucio', 'Huevos con cáscara sucia o manchada'),
('Doble Yema', 'Huevos con doble yema en su interior'),
('Merma', 'Huevos que no cumplen con los estándares de calidad');
select * from tipoHuevo;

-- INSERTAR DATOS PARA MOVIMIENTO DE "ENTRADA Y SALIDAS" EN KARDEXALMHUEVO
INSERT INTO KardexAlmHuevo (tipomovimiento, stockProducto, cantidad, motivomovimiento, creado, idhuevo, idcolaborador) VALUES 
('E', '200 unidades', '100', 'Recepción de huevos blancos', NOW(), 1, 1),
('S', '100 unidades', '50', 'Venta de huevos marrones', NOW(), 2, 2);
select * from KardexAlmHuevo;
-- insertar los datos clientes
INSERT INTO cliente (idpersona, cliente) VALUES
(1, 'Cliente1'),
(2, 'Cliente2'),
(3, 'Cliente3');
SELECT * FROM cliente;

-- INSETAR DATOS A LAS VENTAS
INSERT INTO ventas ( iddistrito, idcliente, idcolaborador, fecha, precioUnitario, precioTotal) VALUES
(1, 1, 1, NOW(), 100.00, 200.00),
(2, 2, 2, NOW(), 150.00, 300.00),
(3, 3, 3, NOW(), 200.00, 400.00);
select * from ventas;
-- insertar datos de pesos
INSERT INTO peso (idhuevo, idventa, peso) VALUES
(1, 1, 10.00),
(2, 2, 15.50),
(3, 3, 20.75),
(4, 1, 12.30),
(5, 2, 18.20);
select * from peso;
