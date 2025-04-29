<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>PRODUCCIÓN</h1>
            </div>
            <br>
            <div class="card mb-3"> 
                <div class="card-body text-end">
                <a href="<?= $host ?>/views/produccion/anadirlote/" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Registrar Nuevo Lote</a>
                <a href="<?= $host ?>/views/produccion/TiposHuevos/" class="btn btn-primary btn-sm"><i class="fa-solid fa-square-plus"></i> Agregar Tipos Huevos</a>
            </div>
            </div>

            <div class="accordion accordion" id="" autocomplete="off">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Registrar Producción del día 
                    </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">

                        <form action="" id="form-produccion">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="input-group">
                                        <div class="form-floating">
                                            <select name="idlote" id="idlote" class="form-select" required>
                                                <option value="">Seleccion</option>
                                            </select>
                                            <label for="idlote"><i class="fa-solid fa-box-open"></i> Lote a Registrar</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="mortalidad" required>
                                        <label for="mortalidad">Mortalidad del dia</label>
                                    </div>
                                </div>
                                <div class="col-md">
                            <div class="form-floating">
                                <input type="number" class="form-control" id="alimento" step="any" min="0" required>
                                <label for="alimento">Cantidad de Alimento</label>
                            </div>
                        </div>
                            </div>
                            <hr>
                            <br>
                            <div class="text-end mt-2">
                                <button type="submit" id="registrar-producto" class="btn btn-primary btn-sm">Registrar Produccion</button>
                                <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar</button>
                        </form>

                    </div>

                    
                    </div>

                    
                </div>
            </div>
            <br>
            <br>

            <div class="card">
                        <div class="card-body">
                            <h3>Buscar Producción Del Lote</h3>
                            <br>
                            <div class="row" style="width: 75%;">
                                
                                <div class="col-md">
                                    <div class="input-group">
                                    <div class="form-floating">
                                            <select name="idlote" id="numLote" class="form-select" required>
                                                <option value="">Seleccion</option>
                                            </select>
                                            <label for="numLote"><i class="fa-solid fa-box-open"></i> Lote a Registrar</label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

</div>

                        <!-- Tabla de Listado de Producción -->
        <div class="container mt-5">
        <div class="card">
        <h2 class="text-center" style="color: #007bff;">Listado de Lotes</h2>
        <div class="card-body">
        <div class="table-responsive">
            <table id="tabla-controllote" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Creado</th>
                        <th>Lote</th>
                        <th>Número Aves</th>
                        <th>Mortalidad del Día</th>
                        <th>Alimento</th>
                        <th>Alimentación del Ave</th>
                        <th>Producción</th>
                        <th>Cantidad de Huevos</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody id="taba-control">

                </tbody>
            </table>
            </div>
        </div>
       </div>
     </div>

    <!--modal para editar-->
<!--modal para editar-->
<div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalEditarLabel">Editar Control de Lote</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formEditar">
          <input type="hidden" id="idlote" name="idlote">
          <input type="hidden" id="idcontrollote" name="idcontrollote">

          <div class="mb-3">
            <label for="mortalidad" class="form-label">Mortalidad</label>
            <input type="number" class="form-control" id="mortalidad" name="mortalidad" required>
          </div>

          <div class="mb-3">
            <label for="alimento" class="form-label">Alimento (kg)</label>
            <input type="number" step="0.01" class="form-control" id="alimento" name="alimento" required>
          </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnGuardarEdicion">Guardar Cambios</button>
      </div>
    </div>
  </div>
</div>
    


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


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>

        <script src="<?= $host ?>/js/controlProduccion/controlProduccion.js"></script>
        <script src="<?= $host ?>/js/controlProduccion/listcontrolProd.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
