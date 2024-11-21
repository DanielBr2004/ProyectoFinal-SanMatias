<?php

require_once 'Conexion.php';

class Venta extends Conexion{
  private $pdo;

  public function __CONSTRUCT(){
    $this->pdo = parent::getConexion();
  }

  public function add($params = []):int{
    $idgenerado = null; 
    try{
        $query = $this->pdo->prepare("call spu_registrar_ventas(?,?)"); 
        $query->execute(
            array(
                $params['idcliente'],
                $params['idcolaborador']
            )
        );
        $row = $query->fetch(PDO::FETCH_ASSOC);
        $idgenerado = $row['idventa'];
    }
    catch(Exception $e){
        $idgenerado = -1;
    }
    return $idgenerado;
  }

  public function getAll() {
    try {
        $consulta = $this->pdo->prepare("CALL spu_listar_ventas();");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        error_log("Error en getAll: " . $e->getMessage());
        throw new Exception("Error al obtener las ventas. Por favor, inténtelo nuevamente.");
    }
}

public function update($params = []): bool {
    try {
        $query = $this->pdo->prepare("CALL sp_editar_venta(?, ?, ?)");
        $query->execute([
            $params['idventa'],
            $params['estado'],
            $params['direccion']
        ]);
        return true;
    } catch (Exception $e) {
        error_log("Error en update: " . $e->getMessage());
        return false;
    }
}



}
