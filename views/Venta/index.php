<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>VENTAS</h1>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    Datos del Cliente
                </div>
                <div class="card-body">
                    <form action="" id="form-kardex-huevos" autocomplete="off">
                        <div class="row g-2 m-b2">
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="" >
                                    <label for="">Filtrar cliente</label>
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="" disabled>
                                    <label for="">Nro de Documento</label>
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="" disabled>
                                    <label for="">Stock Actual</label>
                                </div>
                            </div>

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
