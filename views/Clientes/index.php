<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>REGISTRO DE CLIENTES</h1>
            </div>

            <br>
            <br>
            <br>
            

            <div class="card mb-4">
                <div class="card-header">
                    Datos del Cliente
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-clientes" autocomplete="off">
                        <div class="row g-2">
                            <div class="col-md">
                                <div class="form-floating">
                                <input type="text" class="form-control" minlength="8" maxlength="11" id="nrodocumento" pattern="\d{8,11}" autofocus required>                                    
                                <label for="nrodoumento">Numero de Documento</label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="nombres" required disabled>
                                    <label for="nombres">Nombre </label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="apepaterno" required disabled>
                                    <label for="nombres">Apellido Paterno </label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="apematerno" required disabled>
                                    <label for="nombres">Apellido Materno </label>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2">

                            <div class="col-md-2 mb-3">
                                    <div class="form-floating">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="tipodocumento"  disabled/>
                                            <label for="tipodocumento">Tipo de Documento</label>
                                        </div>
                                    </div>
                                </div>

                            <div class="col-md-5 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="razonsocial" maxlength="150" class="form-control" required disabled>
                                    <label for="razonsocial">Razon Social</label>
                                </div>
                            </div>

                            <div class="col-md-5 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="direccion" maxlength="150" class="form-control" required disabled>
                                    <label for="direccion">Direccion Fiscal</label>
                                </div>
                            </div>

                        </div>

                        <div class="row g-2">
                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="email" maxlength="150" class="form-control">
                                    <label for="email">Email</label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                <input type="text" id="telefono" minlength="9" maxlength="9" pattern="\d{9}" class="form-control">                               
                                 <label for="telefono">Telefono</label>
                                </div>
                            </div>
                        </div>

                </div>

                <div class="card-footer">
                    <div class="text-end">
                        <button type="submit" id="registrar-cliente" class="btn btn-primary btn-sm" disabled>Registrar Cliente</button>
                        <a href="../Venta/" class="btn btn-sm btn-secondary">Volver</a>

                    </div>
                </div>
                    </form>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    Lista de Clientes Registrados
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-responsive table-hover" id="tabla-client">
                        <colgroup>
                            
                        </colgroup>
                        
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">N° Documento</th>
                                <th class="text-center">Tipo Documento</th>
                                <th class="text-center">Cliente</th>
                                <th class="text-center">Estado</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tbody-clientes">
                            <!--datos de la DB-->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        

        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


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

        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <!-- Proceso En JS-->
         <script src="<?= $host ?>/js/clientes/BuscarCliente.js"></script>
        <!-- Preceso Registrar Usuario-->
         <script src="<?= $host ?>/js/clientes/registrarCliente.js"></script>

        <script src="../../js/clientes/tablaClientes.js"></script>

         <!-- Sweet Alert -->
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
         
        <!-- Sweet Alert Simplificado-->
         <script src="../../js/swalcustom.js"></script>
    </body>
</html>
