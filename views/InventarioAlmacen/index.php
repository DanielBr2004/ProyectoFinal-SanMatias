<?php require_once '../../Header.php'; ?>
                <!-- Page content-->
                <div class="container">
                <br>
                    <div>
                        <h5 class="text-end"><strong>Encargado:</strong>  <?= $_SESSION['login']['apepaterno'] ?> <?= $_SESSION['login']['apematerno'] ?> <?= $_SESSION['login']['nombres'] ?></h5>
                    </div>   
            <div class="text-center mt-5">
                <h1>Control de Inventario del Almacen de Huevos</h1>
            </div>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                <form action="" id="form-kardex-huevos" autocomplete="off">
                <!-- primera fila -->
                <div class="row g-2 m-b2">

                    <div class="col-md">
                        <div class="input-group">
                            <div class="form-floating">
                                <select name="idhuevo" id="idhuevo" class="form-select" required>
                                    <option value="">Seleccione</option>
                                    <option value="1">Comercial</option>
                                    <option value="2">Pardo</option>
                                    <option value="3">Sucio</option>
                                    <option value="4">Doble Yema</option>
                                    <option value="5">Merma</option>
                                </select>
                                <label for="idhuevo">Producto</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="stockProducto" disabled>
                            <label for="stockProducto">Stock Actual</label>
                        </div>
                    </div>

                </div> <!-- ./primera fila -->

                <div class="row g-2 mt-2">
                    <div class="col-md">
                        <div class="form-floating">
                                <select name="Motivomovimiento" id="Motivomovimiento" class="form-select" required>
                                <option value="">Seleccione...</option>
                                    <option value="E">Entrada por Produccion</option>
                                    <option value="E">Entrada por compra</option>
                                    <option value="S">Salida por venta</option>
                                    <option value="S">Salida por merma</option>
                                    <option value="S">Salida por Contingencia</option>
                                </select>
                                <label for="Motivomovimiento">Motivo de movimiento</label>
                            </div>
                    </div>

                    <div class="col-md invisible">
                        <div class="form-floating">
                            <input type="text" name="idcolaborador" id="idcolaborador" class="form-control" value="<?= $_SESSION['login']['idcolaborador'] ?>" disabled>
                            <label for="idcolaborador">Colaborador</label>
                        </div>
                    </div>
                </div>

                <!-- segunda fila -->
                <div class="row g-2 mt-2">

                    <div class="col-md">
                        <div class="form-floating">
                            <input type="number" minlength="0" class="form-control" id="cantidad" required>
                            <label for="cantidad">Cantidad</label>
                        </div>
                    </div>

                </div> <!-- ./segunda fila -->
                <div class="row g-2 mt-2">
                    <div class="col-md" id="mermaInputContainer" style="display: none;">
                        <div class="form-floating">
                            <input type="text" id="mermaInput" class="form-control">
                            <label for="mermaInput">Detalles de la merma</label>
                        </div>
                    </div>
                </div>

                <!-- Botones -->
                <div class="text-end mt-2">
                    <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm">Actualizar Kardex</button>
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
        <script src="../../js/Kardex_Huevos/KardexHuevo.js"></script>
        <script src="../../js/Kardex_Huevos/Tabla_Registros.js"></script>
    </body>
    
</html>
