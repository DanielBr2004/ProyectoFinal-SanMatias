<?php

require_once 'Conexion.php';

class Colaborador extends Conexion{

      private $pdo;

    //Constructor
    public function __CONSTRUCT(){
        $this->pdo = parent::getConexion();
    }

    public function getAllUser():array{
        return parent::getData('spu_listar_Colaboradores');
    }

    //Función para registrar al colaborador  
    public function add($params = []):int{
      $idcolaborador = null;
      try{
      $query = $this->pdo->prepare("call spu_colaboradores_registrar(?,?,?)");
      $query->execute(
          array(
          $params['idpersona'],
          $params['nomusuario'],
          password_hash($params['passusuario'], PASSWORD_BCRYPT)
          )
      );
      $row = $query->fetch(PDO::FETCH_ASSOC);
      $idcolaborador = $row['idcolaborador'];
      }
      catch(Exception $e){
      $idcolaborador = -1;
      }
      return $idcolaborador;
    }
      //Función para mostrar los nombres de Usuarios
      public function getAll(){
        try{
        $tSQL = "SELECT idcolaborador, nomusuario FROM colaboradores ORDER BY nomusuario";
        $consulta = $this->pdo->prepare($tSQL);
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
        } 
        catch(Exception $e){
        die($e->getMessage());
        }
      }
      //Función para buscar a la persona por el numero de documento 
      public function searchByDoc($params = []):array{
        try{
        $query = $this->pdo->prepare("call spu_colaborador_buscar_dni(?)");
        $query->execute(
            array($params['nrodocumento'])
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
        die($e->getMessage());
        }
      }

      
// Function to edit a collaborator
public function edit($params = []): bool {
  try {
      error_log("Datos en edit: " . print_r($params, true)); 
      $query = $this->pdo->prepare("CALL spu_editar_colaborador(?, ?, ?, ?)");
      $query->execute([
          $params['idcolaborador'],
          $params['apepaterno'],
          $params['apematerno'],
          $params['nombres']
      ]);
      return true;
  } catch (Exception $e) {
      error_log("Error al editar colaborador: " . $e->getMessage());
      return false;
  }
}
    
  }