<?php require_once '../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1 style="font-size: 50px;">BIENVENIDOS </h1>
            </div>
            <br>
            <hr>
            <br>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="card" >
                        <div class="card-header text">
                            <h4 class="text-center">Productos que Necesita Comprar Urgente</h4>
                        </div>
                        <div class="card-body" style="height: 382px; overflow-y: auto;">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Stock En Almacén</th>
                                    </tr>
                                </thead>
                                <tbody id="productos-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-center">Impacto de Mortalidad</h4>
                        </div>
                        <div class="card-body">
                            <div class="input-group">
                                <div class="form-floating">
                                    <select name="idloteSelectM" id="idloteSelectM" class="form-select" required>
                                        <!-- <option value="">Seleccion</option> -->
                                        <!--Datos traidos de la Base-->
                                    </select>
                                    <label for="idlote"><i class="fa-solid fa-chart-line"></i> Lote a Filtrar</label>
                                </div>
                            </div>
                                <div style="width: 300px; height: 300px; margin: 0 auto; display: flex; justify-content: center; align-items: center;">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                        </div>
                    </div>
                </div>
                    
            </div>
            <div class="row">
                <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-center">Grafico del Mes de Producción</h4>
                            </div>
                            <div class="card-body">
                                <div class="card-body">
                                    <div class="input-group">
                                        <div class="form-floating">
                                            <select name="idloteSelect" id="idloteSelect" class="form-select" required>
                                                <!-- <option value="">Seleccion</option> -->
                                                <!--Datos traidos de la Base-->
                                            </select>
                                            <label for="idlote"><i class="fa-solid fa-chart-line"></i> Lote a Filtrar</label>
                                        </div>
                                    </div>
                                    <canvas id="myLineChart"></canvas>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="<?= $host ?>js/homeJS.js"></script>

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
