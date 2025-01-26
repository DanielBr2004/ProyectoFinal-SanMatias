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
}
