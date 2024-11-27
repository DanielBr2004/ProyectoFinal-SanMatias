<?php

require_once 'Conexion.php';

class ReportHuevos extends Conexion{

  private $pdo; 

  //Constructor
  public function __CONSTRUCT(){
      $this->pdo = parent::getConexion();
  }

    //reporte ventas
    public function getDetallesHuevos() {
        try {
            $query = $this->pdo->prepare("CALL spu_kardexHuevos_pdf()");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC); 
        } catch (Exception $e) {
            die($e->getMessage()); 
        }
    }

}