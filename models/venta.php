<?php

require_once 'Conexion.php';

class Venta extends Conexion{
  private $pdo;

  public function __CONSTRUCT(){
    $this->pdo = parent::getConexion();
  }

  public function add($params = []):bool{
    $status = false; 
    try{
        $query = $this->pdo->prepare("call spu_registrar_ventas(?,?,?)"); 
        $status = $query->execute(
            array(
                $params['idcliente'],
                $params['idcolaborador'],
                $params['direccion']
            )
        );
        return $status; 
    }
    catch(Exception $e){
        die($e->getMessage());
    }
  }

}