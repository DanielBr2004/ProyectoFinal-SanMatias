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
                    <table class="table table-responsive table-hover" id="table-usuarios">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nro Documento</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Nombres</th>
                                <th>Nombre de Usuario</th>
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

<!-- Modal para Editar Colaborador -->
<div class="modal fade" id="editarColaboradorModal" tabindex="-1" aria-labelledby="editarColaboradorLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarColaboradorLabel">Editar Colaborador</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formEditarColaborador">
                    <!-- Campo oculto para el ID del colaborador -->
                    <input type="hidden" id="editIdColaborador">
                    
                    <!-- Apellido Paterno -->
                    <div class="mb-3">
                        <label for="editApePaterno" class="form-label">Apellido Paterno</label>
                        <input type="text" class="form-control" id="editApePaterno" required>
                    </div>

                    <!-- Apellido Materno -->
                    <div class="mb-3">
                        <label for="editApeMaterno" class="form-label">Apellido Materno</label>
                        <input type="text" class="form-control" id="editApeMaterno" required>
                    </div>

                    <!-- Nombres -->
                    <div class="mb-3">
                        <label for="editNombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" id="editNombres" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>
</div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

         <!-- JQuery NUEVO -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
      integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <!-- DataTable -->
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/buttons/2.3.3/js/dataTables.buttons.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.bootstrap5.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.html5.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.print.min.js"
    ></script>
    <!-- Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Initialize DataTables -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
        <script src="<?= $host ?>/js/Colaboradores/DatosUsuarios.js"></script>
        <script src="<?= $host ?>/js/Colaboradores/Colaboradores.js"></script>
        <footer>
            <div class="container">
                <div class="text-center mt-5">
                    <p>&copy; 2024 Granja Avícola "San Matias" S.A.C.</p>
                    <p>VERSION 1.0.0</p>
                </div>
            </div>
         </footer>
    </body>
</html>
