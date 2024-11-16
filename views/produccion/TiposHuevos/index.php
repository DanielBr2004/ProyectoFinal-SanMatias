<?php require_once '../../../Header.php'; ?>
<div class="container">
            <div class="text-center mt-5">  
                <div class="row">
                  <div class="col-md-1">
                  <h3 class="text-start"><i class="fa-solid fa-chevron-left" id="back-button" style="cursor: pointer;"></i></h3>
                  </div>
                  <div class="col-md-11">
                    <h1 class="text-center">Productos de Comercializacion</h1>
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





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<?= $host ?>/js/numlote/tiposHuevo.js"></script>
</body>
</html>