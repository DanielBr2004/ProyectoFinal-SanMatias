
<?php

require_once '../models/Colaboradores.php';

 $colaborador = new Colaborador();

 $cola = $colaborador->getAll();
 echo json_encode($cola);