<?php require_once '../../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>Lotes de la granja </h1>
            </div>
            <br>
            <hr>
            <br>
            <div class="card mb-4">
              <div class="card-body">
                <form action="" id="form-registro-lotes" autocomplete="off">
                    <div class="row g-2 mb-4">
                        <div class="col-md ">
                            <div class="form-floating">
                                <input type="number" class="form-control" id="numLote" required>
                                <label for="numLote"><i class="fa-solid fa-dolly"></i> N° Lote</label>
                            </div>
                        </div>
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
        
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="<?= $host ?>/js/swalcustom.js"></script>

        <script src="<?= $host ?>/js/numlote/numlote.js"></script>

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
