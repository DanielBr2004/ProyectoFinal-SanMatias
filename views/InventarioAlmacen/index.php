<?php require_once '../../Header.php'; ?>
                <!-- Page content-->
                <div class="container">
    <br>
    <div>
        <h5 class="text-end"><strong>Encargado:</strong>  <?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['apematerno'] ?> <?= $_SESSION['login']['nombres'] ?></h5>
    </div>   
    <div class="text-center mt-5">
        <h1>Control de Inventario del Almacen de Huevos</h1>
    </div>
    <br>
    <br>
    <div class="card mb-4">
        <div class="card-header">
            Complete los datos
        </div>
        <div class="card-body">
            <form action="" id="form-kardex-huevos" autocomplete="off">
                <!-- primera fila -->
                <div class="row g-2 m-b2">
                    <div class="col-md">
                        <div class="input-group">
                            <div class="form-floating">
                                <select name="idhuevo" id="idhuevo" class="form-select" required>
                                    <option value="">Seleccione</option>
                                    <option value="1">Comercial</option>
                                    <option value="2">Pardo</option>
                                    <option value="3">Sucio</option>
                                    <option value="4">Doble Yema</option>
                                    <option value="5">Margarito</option>
                                    <option value="6">Merma</option>
                                </select>
                                <label for="idhuevo">Producto</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="stockProducto" disabled>
                            <label for="stockProducto">Stock Actual</label>
                        </div>
                    </div>
                </div> <!-- ./primera fila -->

                <div class="row g-2 mt-2">

                    <div class="col-md">
                        <div class="form-floating">
                            <select name="Lote" id="" class="form-select" >
                                <option value="">Selecione</option>
                                <option value="">Lote 9</option>
                            </select>
                            <label for="Lote">N° Lote</label>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <select name="Motivomovimiento" id="Motivomovimiento" class="form-select" required>
                                <option value="">Seleccione...</option>
                                <option value="E">Entrada por Producción</option>
                                <option value="E">Entrada por Compra</option>
                                <option value="S">Salida por Venta</option>
                                <option value="S">Salida por Merma</option>
                                <option value="S">Salida por Contingencia</option>
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
                            <input type="number" minlength="0" class="form-control" id="cantidad" required>
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
                    <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm">Actualizar Kardex</button>
                    <button type="reset" id="" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
                    <button type="button" id="filtrarBtn" class="btn btn-secondary btn-sm">Filtrar</button>
                </div>
            </form>        
        </div>
    </div>
    <div class="card mb-4">
                    <div class="card-header">
                        Vista de Stock Productos
                    </div>
                    <div class="card-body ">
                        <div class="row align-self-center">

                            <div class="col mb-1">
                                <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Paquetes de Huevos Comerciales</h5>
                                    <br>
                                    <div class="form-floating">
                                        <input type="text" name="" id="hcomercial" class="form-control" disabled>
                                        <label for="idcolaborador">Cantidad</label>
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="col mb-1">
                                <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Paquetes de Huevos pardos</h5>
                                        <br>
                                        <div class="form-floating">
                                            <input type="text" name="" id="hpardo" class="form-control" disabled>
                                            <label for="idcolaborador">Cantidad</label>
                                        </div>
                                </div>
                                </div>
                            </div>

                            <div class="col mb-1">
                                <div class="card">
                                <div class="card-body">
                                <h5 class="card-title text-center">Paquetes de Huevos Sucios</h5>
                                    <br>
                                    <div class="form-floating">
                                        <input type="text" name="" id="hsucio" class="form-control" disabled>
                                        <label for="idcolaborador">Cantidad</label>
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="col mb-1">
                                <div class="card">
                                    <div class="card-body">
                                    <h5 class="card-title text-center">Paquetes de Huevos Doble Yema</h5>
                                    <br>
                                    <div class="form-floating">
                                        <input type="text" name="" id="hdobleyema" class="form-control" disabled>
                                        <label for="idcolaborador">Cantidad</label>
                                    </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col mb-1">
                                <div class="card">
                                    <div class="card-body">
                                    <h5 class="card-title text-center">Paquetes de Huevos Margarito</h5>
                                    <br>
                                    <div class="form-floating">
                                        <input type="text" name="" id="hmargarito" class="form-control" disabled>
                                        <label for="idcolaborador">Cantidad</label>
                                    </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
    </div>

        <!-- Tabla de Listado -->
<div class="container mt-5">
    <div class="card">
    <br>
        <h2 class="text-center" style="color: #007bff;">Almacen Huevos</h2>
    <div class="card-body">
    <div class="table-responsive"> 
    <table class="table table-bordered table-striped table-hover" id="tabla-listproductos">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Colaborador</th>
                    <th>Tipo Huevo</th>
                    <th>Motivo Movimiento</th>
                    <th>Stock Producto</th>
                    <th>Cantidad</th>
                    <th>Descripción</th>
                    <th>Fecha de Creación</th>
                    <th>Operaciones</th>
                </tr>
            </thead>
            <tbody id="tbody-listproductos">
                <!-- Aquí se llenarán los datos dinámicamente con JavaScript -->
            </tbody>
        </table>
    </div>
</div>
</div>
</div>

<!-- Modal para Editar -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarModalLabel">Editar Movimiento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formEditarKardex">
                    <input type="hidden" id="editIdAlmacenHuevos">
                    
                    <!-- Select para Motivo de Movimiento -->
                    <div class="mb-3">
                        <label for="editMotivomovimiento" class="form-label">Motivo de Movimiento</label>
                        <select id="editMotivomovimiento" class="form-select" required>
                            <option value="">Seleccione...</option>
                            <option value="Entrada por Producción">Entrada por Producción</option>
                            <option value="Entrada por Compra">Entrada por Compra</option>
                            <option value="Salida por Venta">Salida por Venta</option>
                            <option value="Salida por Merma">Salida por Merma</option>
                            <option value="Salida por Contingencia">Salida por Contingencia</option>
                        </select>
                    </div>

                    <!-- Cantidad -->
                    <div class="mb-3">
                        <label for="editCantidad" class="form-label">Cantidad</label>
                        <input type="number" class="form-control" id="editCantidad" required>
                    </div>

                    <!-- Descripción -->
                    <div class="mb-3">
                        <label for="editDescripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="editDescripcion" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Incluye SweetAlert2 desde CDN -->
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
        <script src="../../js/Kardex_Huevos/KardexHuevo.js"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
        <script src="<?= $host ?>/js/listkardexhuevo.js"></script>

    </body>
    
</html>
