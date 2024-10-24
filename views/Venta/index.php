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
                    <form action="" id="form-kardex-huevos" autocomplete="off">
                        <div class="row g-2">
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="text" class="form-control" minlength="8" maxlength="11"  id="nrodocumento" autofocus required>
                                    <label for="nrodocumento">Numero de Documento</label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="tipodocumento" disabled>
                                    <label for="tipodocumento">Tipo de Documento</label>
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="nombres"  disabled>
                                    <label for="nombres">Nombre </label>
                                </div>
                            </div>


                        </div>

                        <div class="row g-2">

                            <div class="col-md-6 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="razonsocial" maxlength="150" class="form-control" disabled>
                                    <label for="razonsocial">Razon Social</label>
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="direccion" maxlength="150" class="form-control" disabled>
                                    <label for="direccion">Direccion Fiscal</label>
                                </div>
                            </div>

                        </div>

                        <div class="row g-2">
                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="text" id="email" maxlength="150" class="form-control" disabled>
                                    <label for="email">Email</label>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="form-floating">
                                    <input type="number" id="telefono" maxlength="150" class="form-control" disabled>
                                    <label for="telefono">Telefono</label>
                                </div>
                            </div>
                        </div>


                        <div class="card-header">
                            Detalle de Venta
                        </div>
                        <div class="card-body">
                        <div class="col-md">
                    <div class="input-group">
                    <button class="input-group-text btn btn-success" type="button" id="buscar-nrodocumento"><i class="bi bi-plus-lg"></i></button>
                        <div class="form-floating">
                        <input type="tel" class="form-control" maxlength="12" minlength="8"  id="nrodocumento" required>
                        <label for="nrodocumento">Buscar Producto</label>
                        </div>
                        <button class="input-group-text btn btn-secondary" type="button" id="buscar-nrodocumento"><i class="bi bi-search"></i></button>
                    </div>

                    <div class="card-body">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                            <th scope="col">Stock</th>
                            <th scope="col">ID</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio Unitario</th>
                            <th scope="col">Total</th>
                            <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                        </table>
                    </div>
                </div> 
                        </div>


                
                </div>

                <div class="card-footer">
                    <div class="text-end">
                        <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm" disabled>Registrar Venta</button>
                        <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Venta</button>
                    </div>
                </div>
                    </form>

                
            </div>

        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>


        <!-- Sweet Alert Simplificado-->
         <script src="<?= $host ?>js/swalcustom.js"></script>

         <script src="<?= $host ?>js/ventas/buscarClienteRegistrado.js"></script>
    </body>
</html>
