<?php require_once '../../Header.php'; ?>
                <!-- Page content-->
                <div class="container">
                    <br>
                    <div>
                        <h5 class="text-end"><strong>Encargado:</strong>  <?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['apematerno'] ?> <?= $_SESSION['login']['nombres'] ?></h5>
                    </div>     
            <div class="text-center mt-5">
                <h1>Control del Inventario del Area de Molino</h1>
            </div>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                <form action="" id="form-kardex-Productos" autocomplete="off">
                <!-- primera fila -->
                <div class="row g-2 m-b2">

                    <div class="col-md">
                        <div class="input-group">
                        <div class="form-floating">
                                <select name="idproducto" id="idproducto" class="form-select" required>
                                    <option value="">Seleccione</option>
                                </select>
                                <label for="idproducto">Producto</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="stockProducto" disabled>
                            <label for="stockactual">Stock Actual</label>
                        </div>
                    </div>

                </div> <!-- ./primera fila -->

                <div class="row g-2 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                                <select name="Motivomovimiento" id="Motivomovimiento" class="form-select" required>
                                <option value="">Seleccione...</option>
                                    <option value="E">Entrada por compra</option>
                                    <option value="S">Salida por uso</option>
                                    <option value="S">Salida por merma</option>
                                </select>
                                <label for="Motivomovimiento">Motivo de movimiento</label>
                            </div>
                    </div>

                    <div class="col-md invisible">
                        <div class="form-floating">
                            <input type="text" name="idcolaborador" id="idcolaborador" class="form-control" value="<?= $_SESSION['login']['idcolaborador'] ?>" disabled>
                            <label for="idcolaborador">Colaborador</label>
                        </div>
                    </div>
                </div>

                <!-- segunda fila -->
                <div class="row g-2 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number"  class="form-control" minlength="1" pattern="[0-9]" step="0.01" id="cantidad" required>
                            <label for="cantidad">Cantidad</label>
                        </div>
                    </div>

                </div> <!-- ./segunda fila -->
                <div class="row g-2 mt-2">
                    <div class="col-md" id="mermaInputContainer" style="display: none;">
                        <div class="form-floating">
                            <input type="text" id="mermaInput" class="form-control">
                            <label for="mermaInput">Detalles de la merma</label>
                        </div>
                    </div>
                </div>

                <!-- Botones -->
                <div class="text-end mt-2">
                    <button type="submit" id="" class="btn btn-primary btn-sm">Actualizar Kardex</button>
                    <button type="reset" id="" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
                </div>
                
            </form>        
                </div>
            </div>
        </div>

        <div class="container mt-5">
    <div class="card">
        <h2 class="text-center" style="color: #007bff;">Inventario</h2>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered" id="tabla-productos">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Colaborador</th>
                            <th class="text-center">Producto</th>
                            <th class="text-center">Stock Actual</th>
                            <th class="text-center">Motivo de Movimiento</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Creado</th>
                            <th class="text-center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbody-productos">
                        <!-- Los datos se llenarán aquí -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->

        <!-- DATATABLE -->

        <!-- JQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery -->
        <script src="https://cdn.datatables.net/2.0.5/js/jquery.dataTables.min.js"></script> <!-- DataTables core -->
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.min.js"></script> <!-- DataTables Bootstrap 5 integration -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap -->
        <!-- Extension BS5 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap -->
        <!-- Datatable core -->
        <script src="//cdn.datatables.net/2.0.5/js/dataTables.min.js"></script> <!-- DataTables core -->
        <!-- Datatable estilo BS5 -->
        <script src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script> <!-- DataTables Bootstrap 5 integration -->

        <!-- JS del Proyecto-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="../../js/KardexProducto.js"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
    </body>
</html>
