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
        $query = $this->pdo->prepare("call spu_registrar_ventas(?,?,?)"); 
        $query->execute(
            array(
                $params['idcliente'],
                $params['idcolaborador'],
                $params['direccion']
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

}