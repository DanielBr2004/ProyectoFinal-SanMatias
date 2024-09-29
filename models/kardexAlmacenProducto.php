<?php

require_once 'Conexion.php';

class KardexProducto extends Conexion{
    
    private $pdo; 

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

    public function mostrarStockActual($params = []){
      try {
          $query = $this->pdo->prepare("SELECT stockProducto  FROM KardexAlmProducto WHERE idproducto = ? ORDER BY creado DESC LIMIT 1");
          $query->execute(array($params['idproducto']));
          $stockactual = $query->fetchColumn();
          return $stockactual !== false ? $stockactual : 0; 
      } catch (Exception $e) {
          die($e->getMessage());
      }
    }  

    public function add($params = []):bool{
        $status = false; 
        try{
            $query = $this->pdo->prepare("call spu_insertar_KardexAlmProducto(?,?,?,?,?,?)"); 
            $status = $query->execute(
                array(
                    $params['idcolaborador'],
                    $params['idproducto'],
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