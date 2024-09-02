<?php

  require_once 'conexion.php';

class Usuario extends Conexion{

  private $pdo;

  public function __construct()
  {
    $this->pdo = parent::getConexion();
  }

  public function add( $params = []):array{
    try{
        $cmd = $this->pdo->prepare("spu_personas_registrar(?,?,?,?);");
        $cmd->execute(
          array(
            $params[''],
          )
          );
    }
    catch(Exception $e){
      die($e->getMessage());
      }
  }


}