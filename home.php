<?php require_once 'Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1 style="font-size: 50px;">BIENVENIDO </h1>
            </div>
            <br>
            <hr>
            <br>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="card" >
                        <div class="card-header text">
                            <h4 class="text-center">Productos que necesita compra urgente</h4>
                        </div>
                        <div class="card-body" style="height: 382px; overflow-y: auto;">
                            <table class="table">
                                <thead>
                                    <tr>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Stock En Almacen</th>
                                    </tr>
                                </thead>
                                <tbody id="productos-tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ">
                <div class="card">
                        <div class="card-header">
                            <h4 class="text-center">grafico del mes de produccion</h4>
                        </div>
                        <div class="card-body">
                            <div class="card-body" style="height: 350px;">
                                <canvas id="myLineChart" width="400" height="200"></canvas>
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
