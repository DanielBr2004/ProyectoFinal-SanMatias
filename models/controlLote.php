<?php

require_once 'Conexion.php';

class ControlLote extends Conexion{

  private $pdo;

  public function __construct(){
    $this->pdo = parent::getConexion();
  }

  
  public function add($params = []):bool{
    $status = false; 
    try{
        $query = $this->pdo->prepare("call spu_registrar_controlLote(?,?,?)"); 
        $status = $query->execute(
            array(
                $params['idlote'],
                $params['mortalidad'],
                $params['alimento']
            )
            
        );
        return $status;
    }
    catch(Exception $e){
        die($e->getMessage());
    }
  }



}