<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
<div class="container">
    <div class="text-center mt-5">
        <h1>PRODUCTOS</h1>
    </div>
    <div class="card mb-4">
        <div class="card-header">
            Proceso de Registrar Productos
        </div>
        <div class="card-body">
            <form action="" id="form-registro-productos" autocomplete="off">
                <!-- Segunda Fila -->
                <div class="row g-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="Producto" required>
                            <label for="producto">Producto</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="descripcion">
                            <label for="descripcion">Descripcion del producto</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="stockminimo">
                            <label for="stockminimo">Stock Minimo del Producto</label>
                        </div>
                    </div>
                </div> <!-- ./segunda fila -->
                <!-- Botones -->
                <div class="text-end mt-2">
                    <button type="submit" id="registrar-producto" class="btn btn-primary btn-sm">Registrar Nuevo Producto</button>
                    <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
                </div>
            </form>
        </div>
    </div>
    <!-- Tabla de productos -->
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Productos
        </div>
        <div class="card-body">
            <div id="tabla-productos">
                <!-- Tabla de productos será insertada aquí -->
                <table class="table table-bordered table-striped" id="tabla-produc">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Producto</th>
                            <th class="text-center">Descripción</th>
                            <th class="text-center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody id="productos-body">
                        <!-- Los productos serán insertados dinámicamente desde JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- FIN LISTADO -->
<!--MODAL-->
<div class="modal fade" id="modalEditarProducto" tabindex="-1" aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarProductoLabel">Editar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-editar-producto" autocomplete="off">
                    <input type="hidden" id="idproducto-editar" />
                    <div class="mb-3">
                        <label for="Producto-editar" class="form-label">Producto</label>
                        <input type="text" class="form-control" id="Producto-editar" required>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion-editar" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripcion-editar" required>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--FIN MODAL-->

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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<?= $host ?>/js/Productos.js"></script>
<script src="<?= $host ?>/js/swalcustom.js"></script>
<script src="<?= $host ?>/js/listarProductos.js"></script>
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
