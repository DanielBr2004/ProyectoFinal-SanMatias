<?php

require_once 'Conexion.php';

class KardexHuevo extends Conexion{
    
    private $pdo; 

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

    public function mostrarStockActual($params = []){
      try {
          $query = $this->pdo->prepare("SELECT stockProducto FROM KardexAlmHuevo WHERE idhuevo = ? ORDER BY creado DESC LIMIT 1");
          $query->execute(array($params['idhuevo']));
          //Devuelve el valor de la primera columna 
          $stockactual = $query->fetchColumn();
          //Si el stock actual no tiene valor mostrará 0
          return $stockactual !== false ? $stockactual : 0; 
      } catch (Exception $e) {
          die($e->getMessage());
      }
    }  

    public function add($params = []):bool{
        $status = false; 
        try{
            $query = $this->pdo->prepare("call spu_insertar_kardexhuevo(?,?,?,?,?,?)"); 
            $status = $query->execute(
                array(
                    $params['idcolaborador'],
                    $params['idhuevo'],
                    $params['tipomovimiento'],
                    $params['motivomovimiento'],
                    $params['cantidad'],
                    $params['descripcion']
                )
            );
            return $status; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }


  }