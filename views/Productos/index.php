<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>PRODUCTOS</h1>
            </div>
            <br>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Completar los datos
                </div>
                <div class="card-body">
                    <form action="form_registro-productos" autocomplete="off">
                        <div class="row g-2 mb-2">
                            <div class="col md">
                                <div class="form-floating">
                                    <input type="tel" class="form-control" maxlength="50" minlength="1"   id="" autofocus required>
                                    <label for="nrodocumento">Producto</label>
                                </div>
                            </div>

                            <div class="col-md"> 
                                <div class="form-floating">
                                    <input type="text" class="form-control" maxlength="50" minlength="1" id="" required>
                                    <label for="nombres">Descripcion</label>
                                </div>
                            </div>
                        </div>

                        <div class="text-end">
                            <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm">Registrar Producto</button>
                            <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
    </body>
</html>
