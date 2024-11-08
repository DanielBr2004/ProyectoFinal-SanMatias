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
                    <div class="row g-2">
                        <div class="col-md ">
                            <div class="form-floating">
                                <input type="number" class="form-control" id="numLote" required>
                                <label for="numLote">N° Lote</label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="descripcion">
                                <label for="descripcion">Descripcion del Lote</label>
                            </div>
                        </div>
                        </div>


                        <hr>
                        <!-- Botones -->
                    <div class="text-end mt-2 mb-2">
                        <button type="submit" id="registrar-lote" class="btn btn-primary btn-sm">Registrar Nuevo Lote</button>
                        <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
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
