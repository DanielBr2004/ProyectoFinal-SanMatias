<?php require_once '../../Header.php'; ?>
                <!-- Page content-->
                <div class="container">
                    <br>
                    <div>
                        <h5 class="text-end"><strong>Encargado:</strong>  <?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['apematerno'] ?> <?= $_SESSION['login']['nombres'] ?></h5>
                    </div>     
            <div class="text-center mt-5">
                <h1>Control del Inventario del Área de Molino</h1>
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
                                <label for="idproducto"><i class="fa-solid fa-box-open"></i> Producto</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="stockProducto" disabled>
                            <label for="stockactual"><i class="fa-solid fa-cubes-stacked"></i> Stock Actual</label>
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
                                <label for="Motivomovimiento"><i class="fa-solid fa-cash-register"></i> Motivo de movimiento</label>
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
                            <label for="cantidad"><i class="fa-solid fa-list-ol"></i> Cantidad</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type=""  class="form-control" minlength="1" value="Kg" id="" disabled>
                            <label for="cantidad"><i class="fa-solid fa-scale-balanced"></i> Unidad De Medida</label>
                        </div>
                    </div>

                </div> <!-- ./segunda fila -->
                <div class="row g-2 mt-2">
                    <div class="col-md" id="mermaInputContainer" style="display: none;">
                        <div class="form-floating">
                            <input type="text" id="mermaInput" class="form-control">
                            <label for="mermaInput"><i class="fa-solid fa-pencil"></i> Detalles de la merma</label>
                        </div>
                    </div>
                </div>

                <!-- Botones -->
                <div class="text-end mt-2">
                    <button type="submit" id="" class="btn btn-primary btn-sm"><i class="fa-regular fa-bookmark"></i> Actualizar Kardex</button>
                    <button type="reset" id="" class="btn btn-secondary btn-sm"><i class="fa-regular fa-rectangle-xmark"></i> Cancelar Proceso</button>
                </div>
                
            </form>        
                </div>
            </div>
        </div>

        <!--LISTADO-->
        <div class="container mt-5">
    <div class="card">
        <br>
        <h2 class="text-center" style="color: #007bff;">Almacén de Molino</h2>
        <div class="card-body">
            <div class="table-responsive">
            <table id="tabla-listarproductos" class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Colaborador</th>
                    <th>Producto</th>
                    <th>Stock Actual</th>
                    <th>Motivo de Movimiento</th>
                    <th>Cantidad</th>
                    <th>Creado</th>
                    <th>Operaciones</th>
                </tr>
            </thead>
        <tbody id="tbody-listarproductos">
            <!-- Contenido generado dinámicamente -->
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
                <form id="formEditarProducto">
                    <input type="hidden" id="editIdAlmacenProducto">
                    
                    <!-- Select para Motivo de Movimiento -->
                    <div class="mb-3">
                        <label for="editMotivomovimiento" class="form-label">Motivo de Movimiento</label>
                        <select id="editMotivomovimiento" class="form-select" required>
                            <option value="">Seleccione...</option>
                            <option value="Entrada por compra">Entrada por compra</option>
                            <option value="Salida por uso">Salida por uso</option>
                            <option value="Salida por merma">Salida por merma</option>
                        </select>
                    </div>

                    <!-- Cantidad -->
                    <div class="mb-3">
                            <label for="editCantidad" class="form-label">Cantidad</label>
                            <input type="number" class="form-control" id="editCantidad" required oninput="validarCantidad(this)">
                        <div id="errorCantidad" style="color: red; font-size: 0.9em; display: none;">Por favor, ingrese solo números enteros.</div>
                    </div>

                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>
</div>

       
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
<script>
    $(document).ready(function() {
        $('#tabla-productos').DataTable();
    });
</script>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


        <!-- JS del Proyecto-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="../../js/KardexProducto.js"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
        <script src="<?= $host ?>/js/listkardexProd.js"></script>
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
