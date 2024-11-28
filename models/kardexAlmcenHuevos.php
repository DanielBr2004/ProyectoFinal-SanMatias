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
            $query = $this->pdo->prepare("call spu_insertar_kardexhuevo(?,?,?,?,?,?,?)"); 
            $status = $query->execute(
                array(
                    $params['idcolaborador'],
                    $params['idhuevo'],
                    $params['tipomovimiento'],
                    $params['motivomovimiento'],
                    $params['idlote'],
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

    public function HasProduccion($params = []):array{
        try{
        $query = $this->pdo->prepare("call spu_validar_produccion(?)");
        $query->execute(
            array($params['idlote'])
        );
        return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
        die($e->getMessage());
        }
    }
    public function huevoRegistrado($params = []): array {
        try {
            $query = $this->pdo->prepare("CALL spu_validar_producc_registrado(?,?)");
            
            // Combine parameters into single array
            $parameters = [
                $params['idhuevo'],
                $params['idlote']
            ];
            
            $query->execute($parameters);
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e) {
            die($e->getMessage());
        }
    }

    public function getAll():array{
        return parent::getData('spu_vista_kardexhuevo');
    }

    public function getAlls(){
        try {
            $query = $this->pdo->prepare("CALL spu_listar_kardexhuevo();");
            $query->execute();
            $resultados = $query->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function editarKardexHuevo($params = []): bool {
        $status = false;
        try {
            $query = $this->pdo->prepare("CALL spu_editar_kardexhuevo(?, ?, ?, ?, ?)");
    
            // Ejecutar el procedimiento con los parámetros dados
            $status = $query->execute([
                $params['idAlmacenHuevos'],
                $params['motivomovimiento'],
                $params['cantidad'],
                $params['descripcion'],
                $params['idlote']
            ]);
    
            return $status; // Retorna verdadero si la actualización fue exitosa
        } catch (Exception $e) {
            die($e->getMessage()); // Manejo de errores
        }
    }


    public function eliminarKardexHuevo($idAlmacenHuevos): bool {
        $status = false;
        try {
            $query = $this->pdo->prepare("CALL spu_eliminar_kardexhuevo(?)");
            $status = $query->execute(array($idAlmacenHuevos));
            return $status; // Retorna verdadero si la eliminación fue exitosa
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

  }