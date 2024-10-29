<?php

require_once 'Conexion.php';

class DetalleVenta extends Conexion{
  private $pdo;

  public function __CONSTRUCT(){
    $this->pdo = parent::getConexion();
  }

  public function add($params = []):bool{
    $status = false; 
    try{
        $query = $this->pdo->prepare("call spu_registrar_Detalleventas(?,?,?,?,?,?,?)"); 
        $status = $query->execute(
            array(
                $params['idcolaborador'],
                $params['idventa'],
                $params['idhuevo'],
                $params['cantidad'],
                $params['PesoTotal'],
                $params['precioUnitario'],
                $params['precioTotal']
            )
        );
        return $status; 
    }
    catch(Exception $e){
        die($e->getMessage());
    }
  }
}
