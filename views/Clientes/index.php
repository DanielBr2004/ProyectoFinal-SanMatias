<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>CLIENTES</h1>
            </div>
            <br>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-clientes" autocomplete="off">
                <!-- Primera Fila -->
            <div class="row g-2 mb-2">
                <div class="col-md">
                    <div class="input-group">
                        <div class="form-floating">
                        <input type="tel" class="form-control" maxlength="12" minlength="8"  id="nrodocumento" autofocus required>
                        <label for="nrodocumento">Número Documento</label>
                        </div>
                        <button class="input-group-text btn btn-secondary" type="button" id="buscar-nrodocumento"><i class="bi bi-search"></i></button>
                    </div>
                </div> 

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="nombres" required>
                        <label for="nombres">Nombres</label>
                    </div>
                </div> 
            </div> <!-- ./primera fila -->

            <!-- Segunda Fila -->
            <div class="row g-2">

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="apepaterno" required>
                        <label for="apepaterno">Apellido Paterno</label>
                    </div>
                </div> 

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="apematerno" required>
                        <label for="apematerno">Apellido Materno</label>
                    </div>
                </div>
            </div> <!-- ./segunda fila -->

            <hr>

            <!-- Tercera Fila -->
            <div class="row g-2">
                <div class="col-md-3 mb-3">
                    <div class="form-floating">
                        <input type="number" id="telefono" maxlength="150" class="form-control">
                        <label for="telefono">Telefono</label>
                    </div>
                </div>
                <div class="col-md-9 mb-3">
                    <div class="form-floating">
                        <input type="text" id="razonsocial" maxlength="150" class="form-control">
                        <label for="razonsocial">Rozan Social</label>
                    </div>
                </div>
                
            </div> <!-- ./tercera fila -->
            <!-- cuarta Fila -->
            <div class="row g-2">
                <div class="col-md mb-3">
                    <div class="form-floating">
                        <input type="text" id="direccion" maxlength="150" class="form-control">
                        <label for="direccion">Direccion</label>
                    </div>
                </div>
            </div> <!-- ./cuarta fila -->
            
            <div class="text-end">
                <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm">Registrar Nuevo Colaborador</button>
                <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
            </div>
                    </form>
                </div>
            </div>
        
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="../../js/clientes/clientes.js"></script>
    </body>
</html>
