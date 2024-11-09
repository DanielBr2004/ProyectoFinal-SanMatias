<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>PRODUCCION</h1>
            </div>
            <div class="card mb-3"> 
                <div class="card-body text-end">
                <a href="<?= $host ?>/views/produccion/anadirlote/" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Registrar Nuevo Lote</a>
                </div>
            </div>

            <div class="accordion accordion" id="">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Registrar Produccion del dia 
                    </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">

                        <form action="">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="input-group">
                                    <div class="form-floating">
                                            <select name="idproducto" id="idproducto" class="form-select" required>
                                                <option value="">Seleccion</option>
                                            </select>
                                            <label for="idproducto"><i class="fa-solid fa-box-open"></i> Lote a Registrar</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="descripcion">
                                        <label for="descripcion">Mortalidad del dia</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating">
                                        <input type="number" class="form-control" id="stockminimo">
                                        <label for="stockminimo">Cantidad de Alimento</label>
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
        </div>

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
