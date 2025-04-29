<?php require_once '../../../Header.php'; ?>
<div class="container">
            <div class="text-center mt-5">  
                <div class="row">
                  <div class="col-md-1">
                  <h3 class="text-start"><i class="fa-solid fa-chevron-left" id="back-button" style="cursor: pointer;"></i></h3>
                  </div>
                  <div class="col-md-11">
                    <h1 class="text-center">Productos de Comercialización</h1>
                  </div>
                </div>
            </div>


            <br>
            <hr>
            <br>


              <div class="accordion accordion" id="" autocomplete="off">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Registrar Tipo de Huevo
                    </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">

                    <form action="" id="form-registro-huevos" autocomplete="off">
                      <div class="row g-2 mb-4">
                      <div class="col-md">
                            <div class="form-floating">
                            <input type="text" class="form-control" id="nombreHuevo" required>
                            <label for="nombreHuevo"><i class="fa-solid fa-arrow-up-right-dots"></i> Nombre Del Huevo</label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-floating">
                            <input type="number" class="form-control" id="precioHuevo" step="0.01" required>
                            <label for="precioHuevo"><i class="fa-solid fa-arrow-up-right-dots"></i> Precio</label>
                            </div>
                        </div>
                      </div>
                      <div class="row g-2 mb-4">
                          <div class="col-md">
                              <div class="form-floating">
                                  <textarea class="form-control" id="descripcion" style="height: 100px;" require></textarea>
                                  <label for="descripcion"><i class="fa-solid fa-comment-medical"></i> Descripcion del Huevo</label>
                              </div>
                          </div>
                      </div>


                          <hr>
                          <!-- Botones -->
                      <div class="text-end mt-2 mb-2">
                          <button type="submit" id="registrar-lote" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Registrar Nuevo Tipo</button>
                          <button type="reset" id="cancelar" class="btn btn-secondary btn-sm"><i class="fa-solid fa-xmark"></i> Cancelar Proceso</button>
                      </div>
                      </div>
                      
                  </form>
                  </div>

                    
              </div>
</div>

                        <!-- Tabla de Listado de Huevos Comerciales -->
    <div class="container mt-5">
        <div class="card">
        <h2 class="text-center" style="color: #007bff;">Listado de Huevos</h2>
        <div class="card-body">
        <div class="table-responsive">
            <table id="tabla-tiposHuevos" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Huevos</th>
                        <th>Precio KG</th>
                        <th>Descripcion</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody id="tabla-huevos">

                </tbody>
            </table>
            </div>
        </div>
       </div>
     </div>

<!--MODAL-->
<div class="modal fade" id="modalEditarHuevo" tabindex="-1" aria-labelledby="modalEditarHuevoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarHuevoLabel">Editar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-editar-huevo" autocomplete="off">
                    <input type="hidden" id="idhuevo-editar" />
                    <div class="mb-3">
                        <label for="huevo-editar" class="form-label">Producto</label>
                        <input type="text" class="form-control" id="huevo-editar" required>
                    </div>
                    <div class="mb-3">
                      <label for="precio-editar" class="form-label">Precio KG</label>
                      <input type="number" class="form-control" id="precio-editar" step="0.01" min="0" required>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion-editar" class="form-label">Descripcion</label>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<?= $host ?>/js/numlote/tiposHuevo.js"></script>
<script src="<?= $host ?>/js/produccionHuevos/produc.js"></script>
<script src="<?= $host ?>/js/produccionHuevos/addtipohuevo.js"></script>
<script src="<?= $host ?>/js/swalcustom.js"></script>
</body>
</html>