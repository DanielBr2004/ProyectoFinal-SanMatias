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
          $query = $this->pdo->prepare("call spu_clientes_registrar(?,?,?,?,?,?)");
          $query->execute(
              array(
              $params['idpersona'],
              $params['telefono'],
              $params['tipodocumento'],
              $params['razonsocial'],
              $params['direccion'],
              $params['email']
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

        public function getAllClient():array{
          return parent::getData('spu_listar_cliente');
      }

        //Función para buscar a la persona por el numero de documento 
      public function searchByDoc($params = []):array{
        try{
        $query = $this->pdo->prepare("call spu_cliente_documento_dni(?)");
        $query->execute(
            array($params['nrodocumento'])
        );

        return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
        die($e->getMessage());
        }
      }
          // Función para editar un cliente
    public function edit($params = []): bool {
      try {
          $query = $this->pdo->prepare("CALL spu_cliente_editar(?, ?, ?, ?)");
          $query->execute(array(
              $params['idcliente'],
              $params['nrodocumento'],
              $params['tipodocumento'],
              $params['cliente_nombre']
          ));
          return true;
      } catch (Exception $e) {
          return false;
      }
  }

    // Función para eliminar un cliente
    public function delete($idcliente): bool {
      try {
          $query = $this->pdo->prepare("CALL spu_cliente_eliminar(?)");
          $query->execute(array($idcliente));
          return true;
      } catch (Exception $e) {
          return false;
      }
  }  
  }