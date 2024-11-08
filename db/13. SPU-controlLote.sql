USE granjasanmatias;

 -- ------------------------------------------- Registrar Control Lote ----------------------------------------------------- 
 drop procedure if exists `spu_registrar_controlLote`;
DELIMITER $$
CREATE PROCEDURE spu_registrar_controlLote(
	IN _idlote INT,
	IN _mortalidad INT,
    IN _Alimento DECIMAL(6,2)
)
BEGIN
	DECLARE _numaves INT DEFAULT 6120;
    DECLARE _avesActuales INT;
    DECLARE _alimentoAve DECIMAL(6,2);
    DECLARE _produccion DECIMAL(6,2);
    
    SELECT numaves INTO _numaves FROM controlLote WHERE idlote = _idlote ORDER BY create_at DESC LIMIT 1;
    
    SET _avesActuales = _numaves - _mortalidad;
    SET _alimentoAve = (_Alimento * 1000) / _numaves;

    
    INSERT INTO controlLote(idlote, numaves, mortalidad, alimento, alimentoAve, produccion, cantHuevos)VALUES
							(_idlote, _avesActuales, _mortalidad, _Alimento, _alimentoAve, NULL, NULL );
    
END $$