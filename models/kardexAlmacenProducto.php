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

    public function getAll(){
        try {
            $query = $this->pdo->prepare("CALL spu_listar_KardexAlmProducto()");
            $query->execute();
            $resultados = $query->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function edit($params = []):bool {
        $status = false;
        try {
            $query = $this->pdo->prepare("CALL spu_editar_KardexAlmProducto(?, ?, ?)");
            $status = $query->execute(
                array(
                    $params['idAlmacenProducto'],          
                    $params['motivomovimiento'],           
                    $params['cantidad']                   
                )
            );
            return $status;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function delete($idAlmacenProducto):bool {
        $status = false;
        try {
            $query = $this->pdo->prepare("CALL spu_eliminar_KardexAlmProducto(?)");
            $status = $query->execute(array($idAlmacenProducto));
            return $status;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }


  }