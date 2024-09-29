<?php

class Conexion{

  //1. Almacenamos los datos de conexión
  private $servidor = "localhost";
  private $puerto = "3306";
  private $baseDatos = "GranjaSanMatias";
  private $usuario = "root";
  private $clave = "";

  public function getConexion(){

    try{
      $pdo = new PDO(
        "mysql:host={$this->servidor};
        port={$this->puerto};
        dbname={$this->baseDatos};
        charset=UTF8", 
        $this->usuario, 
        $this->clave
      );

      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      return $pdo;
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

    //Método para evitar la SQLinjection
    public static function limpiarCadena($cadena):string{
      $cadena = trim($cadena);
      $cadena = stripslashes($cadena);
      $cadena = htmlspecialchars($cadena);
      $cadena = str_ireplace("<script>","",$cadena);
      $cadena = str_ireplace("</script>","",$cadena);
      $cadena = str_ireplace("<script src>","",$cadena);
      $cadena = str_ireplace("script type","",$cadena);
      $cadena = str_ireplace("SELECT * FROM","",$cadena);
      $cadena = str_ireplace("DELETE FROM","",$cadena);
      $cadena = str_ireplace("INSERT INTO","",$cadena);
      $cadena = str_ireplace("DROP TABLE","",$cadena);
      $cadena = str_ireplace("DROP DATABASE","",$cadena);
      $cadena = str_ireplace("TRUNCATE TABLE","",$cadena);
      $cadena = str_ireplace("SHOW TABLES","",$cadena);
      $cadena = str_ireplace("SHOW DATABASES","",$cadena);
      $cadena = str_ireplace("<?php","",$cadena);
      $cadena = str_ireplace("?>","",$cadena);
      $cadena = str_ireplace("--","",$cadena);
      $cadena = str_ireplace(">","",$cadena);
      $cadena = str_ireplace("<","",$cadena);
      $cadena = str_ireplace("[","",$cadena);
      $cadena = str_ireplace("]","",$cadena);
      $cadena = str_ireplace("^","",$cadena); //alt + 94
      $cadena = str_ireplace("==","",$cadena);
      $cadena = str_ireplace("===","",$cadena);
      $cadena = str_ireplace(";","",$cadena);
      $cadena = str_ireplace("::","",$cadena);
      $cadena = str_ireplace("('","",$cadena);
      $cadena = str_ireplace("')","",$cadena);
      $cadena = trim($cadena);
      $cadena = stripslashes($cadena);
      return $cadena;
    }


    public function getData($spu_name = ""):array{
      try{
        $cmd = $this->getConexion()->prepare("call {$spu_name}()");
        $cmd->execute();
        return $cmd->fetchAll(PDO::FETCH_ASSOC);
      }catch(Exception $e){
  
      }
    }
}