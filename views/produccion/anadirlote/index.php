<?php require_once '../../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>Lotes de la granja </h1>
            </div>
            <br>
            <hr>
            <br>
            <div class="accordion accordion" id="" autocomplete="off">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Registrar Nuevo lote
                    </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">

                    <form action="" id="form-registro-lotes" autocomplete="off">
                      <div class="row g-2 mb-4">
                          <div class="col-md">
                              <div class="form-floating">
                                  <input type="number" class="form-control" id="CantInicio" require>
                                  <label for="CantInicio"><i class="fa-solid fa-arrow-up-right-dots"></i> Cantidad De Gallinas al Inicio del Lote</label>
                              </div>
                          </div>
                      </div>
                      <div class="row g-2 mb-4">
                          <div class="col-md">
                              <div class="form-floating">
                                  <textarea class="form-control" id="descripcion" style="height: 100px;" require></textarea>
                                  <label for="descripcion"><i class="fa-solid fa-comment-medical"></i> Descripcion del Lote</label>
                              </div>
                          </div>
                      </div>


                          <hr>
                          <!-- Botones -->
                      <div class="text-end mt-2 mb-2">
                          <button type="submit" id="registrar-lote" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Registrar Nuevo Lote</button>
                          <button type="reset" id="cancelar" class="btn btn-secondary btn-sm"><i class="fa-solid fa-xmark"></i> Cancelar Proceso</button>
                      </div>
                      </div>
                      
                  </form>

                    </div>

                    
                    </div>

                    
                </div>
            </div>


        </div>


                <!--LISTADO-->
                <div class="container mt-5">
    <div class="card">
        <br>
        <h2 class="text-center" style="color: #007bff;">Nº Lotes</h2>
        <div class="card-body">
            <div class="table-responsive">
            <table id="tabla-NumLote" class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Num Lote</th>
                    <th>Estado</th>
                    <th>Descripcion</th>
                    <th>Acción</th>
                </tr>
            </thead>
        <tbody id="tbody-numLote">
        </tbody>
        </table>
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

        
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>
        <script src="<?= $host ?>/js/numlote/numlote.js"></script>
        <script src="<?= $host ?>js/numlote/listnumLote.js"></script>

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
