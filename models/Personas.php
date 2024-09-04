<?php

require_once 'Conexion.php';

class Personas extends Conexion{

  private $pdo; 

  //Constructor
  public function __CONSTRUCT(){
      $this->pdo = parent::getConexion();
  }

      //Función para registrar a la persona devolviendo su id 
      public function add($params = []):int{
        $idgenerado = null;
        try{
        $query = $this->pdo->prepare("call spu_personas_registrar(?,?,?,?)");
        $query->execute(
            array(
            $params['apepaterno'],
            $params['apematerno'],
            $params['nombres'],
            $params['nrodocumento']
            )
        );  
        $row = $query->fetch(PDO::FETCH_ASSOC);
        $idgenerado = $row['idpersona'];
        }
        catch(Exception $e){
        $idgenerado = -1;
        }
        return $idgenerado;
    }
}