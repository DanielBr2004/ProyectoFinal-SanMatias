<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>USUARIOS</h1>
            </div>
            <br>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-usuarios" >
                <!-- Primera Fila -->
            <div class="row g-2 mb-2">
                <div class="col-md">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="tel" class="form-control" maxlength="8" minlength="8"  id="nrodocumento" autofocus required>
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
                <div class="col-md mb-3">
                    <div class="form-floating">
                        <input type="text" id="nomusuario" maxlength="150" class="form-control" required autocomplete="given-name">
                        <label for="nomusuario">Nombre de Usuario</label>
                    </div>
                </div>
                <div class="col-md mb-3">
                    <div class="form-floating">
                        <input type="password" id="passusuario" class="form-control" required disabled="true" autocomplete="current-password" required>
                        <label for="passusuario">Contraseña</label>
                    </div>
                </div>
            </div> <!-- ./tercera fila -->
            
            <div class="text-end">
                <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm" disabled>Registrar Nuevo Colaborador</button>
                <button type="reset" id="cancelar" class="btn btn-secondary btn-sm" >Cancelar Proceso</button>
            </div>
                    </form>
                </div>
            </div>


            <div class="card mb-4">
                <div class="card-header">
                    Lista de Usuarios Registrados
                </div>
                <div class="card-body">
                    <table class="table table-responsive table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nro Documento</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Nombres</th>
                                <th>Nombre de Usuario</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tbody-usuarios">
                            <!--datos de la DB-->
                        </tbody>
                    </table>
                </div>
            </div>
        
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="<?= $host ?>/js/Colaboradores/Colaboradores.js"></script>
        <script src="<?= $host ?>/js/Colaboradores/DatosUsuarios.js"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
    </body>
</html>
