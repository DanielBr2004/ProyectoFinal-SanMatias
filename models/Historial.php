<?php

require_once 'Conexion.php';

class Historial extends Conexion{

    private $pdo;

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

      //Función historial huevo 
      public function getAllHistorialHuevos(): array {
        try {
            $consulta = $this->pdo->query("CALL spu_ver_historial()");
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
    public function getAllHistorialProductos(): array {
        try {
            $consulta = $this->pdo->query("call spu_ver_historial_producto()");
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }
}
