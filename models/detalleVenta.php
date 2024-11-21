<?php

require_once 'Conexion.php';

class DetalleVenta extends Conexion{
  private $pdo;

  public function __CONSTRUCT(){
    $this->pdo = parent::getConexion();
  }

  public function add($params = []):int{
    $idgenerado = null; 
    try{
        $query = $this->pdo->prepare("call spu_registrar_Detalleventas(?,?,?,?,?)"); 
        $query->execute(
            array(
                // $params['idcolaborador'],
                $params['idventa'],
                $params['idhuevo'],
                $params['cantidad'],
                $params['unidadMedida'],
                $params['precioVenta']
            )
        );
        $row = $query->fetch(PDO::FETCH_ASSOC);
        $idgenerado = $row['iddetalleventa'];
    }
    catch(Exception $e){
        $idgenerado = -1;
    }
    return $idgenerado;
  }
}
