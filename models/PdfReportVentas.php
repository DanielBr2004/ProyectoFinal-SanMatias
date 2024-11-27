<?php

require_once 'Conexion.php';

class ReportVentas extends Conexion{

  private $pdo; 

  //Constructor
  public function __CONSTRUCT(){
      $this->pdo = parent::getConexion();
  }

    //reporte de Detalle de Ventas
    public function getDetalleVentas() {
        try {
            $query = $this->pdo->prepare("CALL spu_detalleventas_pdf()");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC); 
        } catch (Exception $e) {
            die($e->getMessage()); 
        }
    }

    //reporte de Ventas
    public function getVentas() {
        try {
            $query = $this->pdo->prepare("CALL spu_ventas_pdf()");
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
    
            if (!$result) {
                throw new Exception('No se encontraron datos de ventas.');
            }
            return $result;
        } catch (Exception $e) {
            die('Error en getVentas: ' . $e->getMessage());
        }
    }
    

    //reporte de Clientes
    public function getClientes() {
        try {
            $query = $this->pdo->prepare("CALL spu_clientes_pdf()");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC); 
        } catch (Exception $e) {
            die($e->getMessage()); 
        }
    }
}