<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>VENTAS</h1>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    Datos del Cliente
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-clientes" autocomplete="off">
                        <div class="row g-2">
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="nrodocumento" autofocus required>
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
                                    <input type="number" id="telefono" maxlength="9" minlength="9" class="form-control">
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

        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>js/scripts.js"></script>
        <!-- Proceso En JS-->
         <script src="<?= $host ?>js/ventas/BuscarCliente.js"></script>
        <!-- Preceso Registrar Usuario-->
         <script src="<?= $host ?>js/Ventas/registrarCliente.js"></script>

         <!-- Sweet Alert -->
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
         
        <!-- Sweet Alert Simplificado-->
         <script src="<?= $host ?>js/swalcustom.js"></script>
    </body>
</html>
