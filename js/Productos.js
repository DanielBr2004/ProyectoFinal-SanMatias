async function eliminarProducto(idproducto) {
    if (confirm("¿Estás seguro de que deseas eliminar este producto?")) {
        const params = new FormData();
        params.append("operacion", "eliminar");
        params.append("idproducto", idproducto);

        const options = {
            method: 'POST',
            body: params
        };

        const response = await fetch('../../controllers/producto.controller.php', options);
        const result = await response.json();

        if (result.status === "success") {
            Swal.fire("Producto eliminado correctamente");
            listarProductos(); 
        } else {
            Swal.fire("Error al eliminar el producto: " + result.message);
        }
    }
}

async function editarProducto(idproducto) {
    const response = await fetch(`../../controllers/producto.controller.php?operacion=getAll`);
    const productos = await response.json();
    const producto = productos.find(prod => prod.idproducto === idproducto);

    if (producto) {
        // Llenamos el modal con los datos del producto
        document.querySelector("#idproducto-editar").value = producto.idproducto;
        document.querySelector("#Producto-editar").value = producto.producto;
        document.querySelector("#descripcion-editar").value = producto.descripcion;

        // Mostramos el modal
        const modal = new bootstrap.Modal(document.getElementById('modalEditarProducto'));
        modal.show();
    }
}

// Manejador del formulario de edición
document.querySelector("#form-editar-producto").addEventListener("submit", async (event) => {
    event.preventDefault();
    const idproducto = document.querySelector("#idproducto-editar").value;
    const params = new FormData();
    params.append("operacion", "editar");
    params.append("idproducto", idproducto);
    params.append("Producto", document.querySelector("#Producto-editar").value);
    params.append("descripcion", document.querySelector("#descripcion-editar").value);

    const options = {
        method: 'POST',
        body: params
    };

    const response = await fetch('../../controllers/producto.controller.php', options);
    const result = await response.json();

    if (result.status === "success") {
        Swal.fire("Producto actualizado correctamente");
        listarProductos(); // Refrescamos la lista
        // Cerramos el modal
        const modal = bootstrap.Modal.getInstance(document.getElementById('modalEditarProducto'));
        modal.hide();
    } else {
        Swal.fire("Error al actualizar el producto: " + result.message);
    }
});


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


  async function listarProductos() {
    try {
        const response = await fetch('../../controllers/producto.controller.php?operacion=getAll');
        const productos = await response.json();
        console.log(productos); 
        let tbody = document.querySelector("#productos-body");
        tbody.innerHTML = ''; 
        productos.forEach(producto => {
            let row = `
                <tr>
                    <td>${producto.idproducto}</td>
                    <td>${producto.producto}</td>
                    <td>${producto.descripcion}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editarProducto(${producto.idproducto})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="eliminarProducto(${producto.idproducto})">Eliminar</button>
                    </td>
                </tr>
            `;
            tbody.innerHTML += row; 
        });
    } catch (error) {
        console.error('Error al listar los productos:', error);
    }
}
listarProductos();




})