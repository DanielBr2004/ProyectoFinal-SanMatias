<?php

require_once 'Conexion.php';

class Colaborador extends Conexion{

      private $pdo;

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

    

  }