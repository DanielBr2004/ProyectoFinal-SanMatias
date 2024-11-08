<?php

require_once 'Conexion.php';

class Producto extends Conexion{

    private $pdo; 

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion(); 
    }


    public function add($params = []):int{
      $idproducto = null;
      try{
          $query = $this->pdo->prepare("CALL spu_registrar_productos(?,?,?)");
          $query->execute(
              array(
                  $params['Producto'],
                  $params['stockminimo'],
                  $params['descripcion']
              )
          );
          $row = $query->fetch(PDO::FETCH_ASSOC);
          $idproducto = $row['idproducto'];
      }
      catch(Exception $e){
          $idproducto = -1;
      }
      return $idproducto; 
  }
     

  public function getAll() {
    try {
        $consulta = $this->pdo->prepare("CALL spu_listar_productos()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } 
    catch(Exception $e) {
        die($e->getMessage());
    }
}


    public function searchProducto($params = []):array{
        try{
        $query = $this->pdo->prepare("call spu_existe_producto(?)");
        $query->execute(
            array($params['producto'])
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
        die($e->getMessage());
        }
      }

public function eliminarProducto($idproducto = 0){
    try {
      $consulta = $this->pdo->prepare("CALL spu_eliminar_productos(?)");
      $consulta->execute(array($idproducto));
    } 
    catch (Exception $e) {
      die($e->getMessage());
    }
   }
    

   public function editarProducto($params = []): bool {
    try {
        // Preparar la consulta con cuatro parámetros
        $consulta = $this->pdo->prepare("CALL spu_editar_productos(?, ?, ?, ?)");
        $consulta->execute(array(
            $params['idproducto'],  
            $params['Producto'],      
            $params['stockminimo'], 
            $params['descripcion']    
        ));
        return true; 
    } 
    catch (Exception $e) {
        die($e->getMessage()); 
    }
}

  }