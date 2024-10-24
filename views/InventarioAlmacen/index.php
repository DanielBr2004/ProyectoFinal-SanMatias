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
                                    <option value="5">Merma</option>
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
        <!-- Tabla de registros -->
<div class="card mt-4">
    <div class="card-header">
        Listado
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped table-hover"id="tabla-productos">
            <thead class="table-dark">
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
            <tbody id="tbody-productos">
                <!-- Aquí se llenarán los datos dinámicamente con JavaScript -->
            </tbody>
        </table>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalEditarLabel">Editar Kardex de Huevo</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formEditarKardex">
          <input type="hidden" id="idAlmacenHuevos" name="idAlmacenHuevos">
          <div class="mb-3">
            <label for="motivoMovimiento" class="form-label">Motivo de Movimiento</label>
            <input type="text" class="form-control" id="motivoMovimiento" name="motivoMovimiento" required>
          </div>
          <div class="mb-3">
            <label for="cantidad" class="form-label">Cantidad</label>
            <input type="number" class="form-control" id="cantidad" name="cantidad" required>
          </div>
          <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
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
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="../../js/Kardex_Huevos/KardexHuevo.js"></script>
    </body>
    
</html>
