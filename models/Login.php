<?php

require_once 'Conexion.php';

class Login extends Conexion{

    private $pdo;

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

      //Función para el login 
    public function login($params = []):array{
        try{
        $query = $this->pdo->prepare("call spu_colaboradores_login(?)");
        $query->execute(array($params['nomusuario']));
        return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
        die($e->getMessage());
        }
    }
}
