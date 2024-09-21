USE granjasanmatias

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

