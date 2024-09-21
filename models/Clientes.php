<?php

require_once 'Conexion.php';

class Cliente extends Conexion{

      private $pdo;

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

        //Función para registrar al colaborador  
        public function add($params = []):int{
          $idcliente = null;
          try{
          $query = $this->pdo->prepare("call spu_clientes_registrar(?,?,?,?)");
          $query->execute(
              array(
              $params['idpersona'],
              $params['telefono'],
              $params['razonsocial'],
              $params['direccion']
              )
          );
          $row = $query->fetch(PDO::FETCH_ASSOC);
          $idcliente = $row['idcliente'];
          }
          catch(Exception $e){
          $idcliente = -1;
          }
          return $idcliente;
        }

  }