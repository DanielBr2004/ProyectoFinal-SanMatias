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
// Listar por idlote
public function list($idlote): array {
  try {
      $query = $this->pdo->prepare("CALL SPU_LISTAR_CONTROLLOTE(?)");
      $query->execute([$idlote]);
      return $query->fetchAll(PDO::FETCH_ASSOC);
  } catch (Exception $e) {
      die($e->getMessage());
  }
}

// Listar por idlote
public function ValidarLote($idlote): array {
  try {
      $query = $this->pdo->prepare("CALL spu_comparar_mortalidad(?)");
      $query->execute([$idlote]);
      return $query->fetchAll(PDO::FETCH_ASSOC);
  } catch (Exception $e) {
      die($e->getMessage());
  }
}


  public function ChartLotes($params = []):array{
    try{
    $query = $this->pdo->prepare("CALL spu_listar_produccionLote(?)");
    $query->execute(
        array($params['idlote'])
    );

    return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
    die($e->getMessage());
    }
  }

  public function ChartLotes2($params = []):array{
    try{
    $query = $this->pdo->prepare("CALL spu_mortalidad_acumulada(?)");
    $query->execute(
        array($params['idlote2'])
    );

    return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
    die($e->getMessage());
    }
  }



public function getAllLotes(): array {
  try {
      $query = $this->pdo->prepare("SELECT idlote, numLote FROM numLote"); // Ajusta según la estructura de tu tabla
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
  } catch (Exception $e) {
      die($e->getMessage());
  }
}
  // Editar
public function edit($params = []): bool {
  try {
      $query = $this->pdo->prepare("CALL SPU_EDITAR_CONTROLLOTE(?,?,?,?)");
      $status = $query->execute([
          $params['idlote'],
          $params['idcontrollote'], 
          $params['mortalidad'],
          $params['alimento']
      ]);
      return $status;
  }
  catch(Exception $e) {
      die($e->getMessage());
  }
}
  // Eliminar
public function delete($idlote, $idcontrollote): bool {
  try {
      $query = $this->pdo->prepare("CALL SPU_ELIMINAR_CONTROLLOTE(?,?)");
      $status = $query->execute([$idlote, $idcontrollote]);
      return $status;
  }
  catch(Exception $e) {
      die($e->getMessage());
  }
}

}