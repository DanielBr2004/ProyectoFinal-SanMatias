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

    public function add($params = []):int{
      $idlote = null;
      try{
          $query = $this->pdo->prepare("CALL spu_registrar_numLote(?,?)");
          $query->execute(
              array(
                  $params['numLote'],
                  $params['descripcion']
              )
          );
          $row = $query->fetch(PDO::FETCH_ASSOC);
          $idlote = $row['idlote'];
      }
      catch(Exception $e){
          $idlote = -1;
      }
      return $idlote; 
  }

  public function searchLote($params = []):array{
    try{
    $query = $this->pdo->prepare("call spu_existe_lote(?)");
    $query->execute(
        array($params['numLote'])
    );

    return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
    die($e->getMessage());
    }
  }
}
