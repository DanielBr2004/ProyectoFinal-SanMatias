<?php

  require_once 'conexion.php';

  class NumLote extends Conexion{

    private $pdo;

    public function __CONSTRUCT(){
      $this->pdo = parent::getConexion();
    }


    public function getAll() {
      try {
          $consulta = $this->pdo->prepare("SELECT * FROM numLote WHERE estado = 'A'");
          $consulta->execute();
          return $consulta->fetchAll(PDO::FETCH_ASSOC);
      } 
      catch(Exception $e) {
          die($e->getMessage());
      }
  }

  }
