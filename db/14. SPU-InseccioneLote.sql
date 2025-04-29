USE granjasanmatias;

DROP PROCEDURE IF EXISTS `GenerateKardexAlmHuevolote1`;
CREATE PROCEDURE GenerateKardexAlmHuevolote1()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Ingreso de Produccion ', i),
            1,
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Ingreso',
            DATE_ADD('2017-03-01', INTERVAL FLOOR(RAND() * 471) DAY) -- Genera una fecha aleatoria entre 2017-03-01 y 2018-06-15
        );
        SET i = i + 1;
    END WHILE;
END;

CREATE PROCEDURE GenerateKardexAlmHuevolote2()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO KardexAlmHuevo (idcolaborador, idhuevo, tipomovimiento, motivomovimiento, idlote, stockProducto, cantidad, descripcion, creado)
        VALUES 
        (
            1,
            FLOOR(1 + RAND() * 6), -- Genera un idhuevo entre 1 y 6
            IF(RAND() > 0.5, 'S', 'E'), -- Genera tipomovimiento aleatorio entre 'S' o 'E'
            CONCAT('Ingreso de produccion ', i),
            2, -- idlote establecido en 2
            FLOOR(900 + RAND() * 100), -- Genera un stockProducto aleatorio entre 900 y 1000
            FLOOR(10 + RAND() * 50), -- Genera una cantidad aleatoria entre 10 y 50
            'Ingreso',
            DATE_ADD('2018-06-15', INTERVAL FLOOR(RAND() * 452) DAY) -- Genera una fecha aleatoria entre 2018-06-15 y 2019-09-10
        );
        SET i = i + 1;
    END WHILE;
END;

CREATE PROCEDURE GenerateKardexAlmHuevoUpdatedLote3()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote4()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote5()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote6()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote7()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote8()
BEGIN
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
END;

CREATE PROCEDURE GenerateKardexAlmHuevoLote9()
BEGIN
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
END;






