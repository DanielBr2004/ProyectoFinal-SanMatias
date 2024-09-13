<?php

require_once 'Conexion.php';

class Producto extends Conexion{

  private $pdo; 

  //Constructor
  public function __CONSTRUCT(){
      $this->pdo = parent::getConexion(); 
  }


}