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
                        <div class="container mt-5">
                            <div>
                            <button id="agregar-item" _ngcontent-ng-c943880071="" tooltipposition="top" ptooltip="Agregar item" pbutton="" type="button" icon="fa fa-plus" class="btn btn-success p-element p-button-success p-button p-component p-button-icon-only ng-star-inserted">
                                <span class="p-button-icon fa fa-plus" aria-hidden="true"> Agregar Producto a la Lista</span>
                            </button>
                            </div>
                            <table class="tabla-detalle table table-bordered table-striped table-hover mt-3">
                                <thead>
                                    <tr>
                                        <th class="text-center">Producto</th>
                                        <th class="text-center">Cantidad</th>
                                        <th class="text-center">Precio Unitario</th>
                                        <th class="text-center">Total</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Las filas se agregarán aquí -->
                                </tbody>
                            </table>
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

         <script src="<?= $host ?>js/ventas/agregarDetalle.js"></script>
         <script src="<?= $host ?>js/ventas/buscarClienteRegistrado.js"></script>
    </body>
</html>
