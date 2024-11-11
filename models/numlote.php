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
    public function getLastDate() {
        try {
            $consulta = $this->pdo->prepare("SELECT numlote  FROM numLote ORDER BY idlote DESC LIMIT 1");
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
          $query = $this->pdo->prepare("CALL spu_registrar_numLote(?,?,?)");
          $query->execute(
              array(
                  $params['numLote'],
                  $params['CantInicio'],
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


  public function getAllLote() {
    try {
        $consulta = $this->pdo->prepare("CALL spu_listar_numLote()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } 
    catch(Exception $e) {
        die($e->getMessage());
    }
}

/*
public function deactivateLote($idlote): bool {
    try {
        $consulta = $this->pdo->prepare("UPDATE numLote SET estado = 'I' WHERE idlote = ?");
        $consulta->execute([$idlote]);
        return true;
    } 
    catch(Exception $e) {
        return false;
    }
}*/
public function deactivateLote($idlote): bool {
    try {
        $consulta = $this->pdo->prepare("CALL spu_desactivar_numLote(?)");
        $consulta->execute([$idlote]);
        return true;
    } 
    catch(Exception $e) {
        // Imprimir el mensaje de error para depuración
        error_log("Error en deactivateLote: " . $e->getMessage());
        return false;
    }
}
public function activateLote($idlote): bool {
    try {
        $consulta = $this->pdo->prepare("CALL spu_activar_numLote(?)");
        $consulta->execute([$idlote]);
        return true;
    } 
    catch(Exception $e) {
        error_log("Error en activateLote: " . $e->getMessage());
        return false;
    }
}

}