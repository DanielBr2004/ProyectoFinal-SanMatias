<?php require_once '../../Header.php'; ?>
                <!-- Page content-->
                <div class="container">
            <div class="text-center mt-5">
                <h1>Control de Inventario</h1>
            </div>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                <form action="" id="form-validaciones-kardex" autocomplete="off">
                <!-- primera fila -->
                <div class="row g-2 m-b2">

                    <div class="col-md">
                        <div class="input-group">
                            <div class="form-floating">
                                <select name="" id="" class="form-select" required>
                                    <option value="">Seleccione</option>
                                </select>
                                <label for="idproducto">Producto</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="" disabled>
                            <label for="stockactual">Stock Actual</label>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="" disabled>
                            <label for="stockactual">Colaborador</label>
                        </div>
                    </div>

                </div> <!-- ./primera fila -->

                <div class="row g-2 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" minlength="1" maxlength="200" class="form-control" id="" required>
                            <label for="cantidad">Motivo de Movimiento</label>
                        </div>
                    </div>
                </div>

                <!-- segunda fila -->
                <div class="row g-2 mt-2">

                    <div class="col-md">
                        <div class="form-floating">
                            <select name="" id="" class="form-select" required>
                                <option value="">Seleccione</option>
                                <option value="E">Entrada</option>
                                <option value="S">Salida</option>
                            </select>
                            <label for="tipomovimiento">Tipo de Movimiento</label>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" minlength="1" class="form-control" id="" required>
                            <label for="cantidad">Cantidad</label>
                        </div>
                    </div>

                </div> <!-- ./segunda fila -->

                <!-- Botones -->
                <div class="text-end mt-2">
                    <button type="submit" id="" class="btn btn-primary btn-sm">Actualizar Kardex</button>
                    <button type="reset" id="" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
                </div>
                
            </form>        
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>
        <script src="../../js/KardexHuevo.js"></script>
    </body>
</html>
