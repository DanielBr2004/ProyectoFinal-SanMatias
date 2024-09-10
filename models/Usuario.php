<?php

  require_once 'conexion.php';

class Usuario extends Conexion{

  private $pdo;

  public function __construct()
  {
    $this->pdo = parent::getConexion();
  }



}