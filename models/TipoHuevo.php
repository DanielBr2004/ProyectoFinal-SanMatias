<?php

require_once 'Conexion.php';

class TipoHuevo extends Conexion{

  private $pdo; 

  //Constructor
  public function __CONSTRUCT(){
      $this->pdo = parent::getConexion(); 
  }

  public function getAllHuevos():array{
    return parent::getData('spu_listar_tipohuevo');
}

}