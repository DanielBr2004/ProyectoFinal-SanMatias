<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>PRODUCTOS</h1>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    Proceso de Registrar Productos
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-productos" autocomplete="off">
                        <!-- Segunda Fila -->
                        <div class="row g-2">

                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="Producto" required>
                                    <label for="Producto">Producto</label>
                                </div>
                            </div>

                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="descripcion" required>
                                    <label for="descripcion">Descripcion del producto</label>
                                </div>
                            </div> 

                        </div> <!-- ./segunda fila -->

                                    
                        <!-- Botones -->
                        <div class="text-end mt-2">
                            <button type="submit" id="registrar-producto" class="btn btn-primary btn-sm">Registrar Nuevo Producto</button>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
    document.addEventListener("DOMContentLoaded", () => {

        //Bandera
        let datosNuevos = true; 

        let Producto = -1;


        //Función para registrar el Producto
        async function registrarProducto(producto){
            const params = new FormData();
            params.append("operacion", "add");
            params.append("Producto", document.querySelector("#Producto").value);
            params.append("descripcion", document.querySelector("#descripcion").value);

            const options = {
                method: 'POST',
                body: params
            }

            const idproducto = await fetch(`../../controllers/producto.controller.php`, options);
            return idproducto.json();
        }
        
        document.querySelector("#form-registro-productos").addEventListener("submit", async (event) => {
            event.preventDefault();

            if(confirm("¿Estás seguro de Proceder?")){

                let response2;


                //Tenemos el idtipoproducto
                response2 =  registrarProducto(Producto);
                if(response2.idproducto == -1){
                    Swal.fire("No se pudo Registrar el producto");
                }else{
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Producto creado Correctamente",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    //producto creado se limpia el formulario
                    document.querySelector("#form-registro-productos").reset();
                }
            }
        })
    })

</script>
    </body>
</html>
