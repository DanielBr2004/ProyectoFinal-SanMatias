//Función de referencia GLOBAL
function $(object = null) {
    return document.querySelector(object);
  }


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
            showToast("Producto eliminado correctamente", "SUCCESS", 1000);
            listarProductos(); 
        } else {
            showToast("Error al eliminar el producto", "ERROR", 1000);
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
        showToast("Producto actualizado correctamente","SUCCESS", 1000);
        listarProductos(); // Refrescamos la lista
        // Cerramos el modal
        const modal = bootstrap.Modal.getInstance(document.getElementById('modalEditarProducto'));
        modal.hide();
    } else {
        showToast("Error al actualizar el producto: ", "ERROR", 1000);
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
  async function  validarExistencia() {
    const producto = document.querySelector("#Producto");

    const params = new URLSearchParams();
      params.append("operacion", "searchProducto");
      params.append("producto", producto.value);

      const response = await fetch(`../../controllers/producto.controller.php?${params}`);
      return response.json();
    
  }
  
  document.querySelector("#form-registro-productos").addEventListener("submit", async (event) => {
      event.preventDefault();

            let response = await validarExistencia();
           

        if(response.length > 0){
            showToast("El producto ya existe", "ERROR");
        }else{

            if(await ask("¿Estás seguro de que deseas registrar este producto?")){

                let response2;
                //Tenemos el idtipoproducto
                response2 =  registrarProducto(Producto);
                if(response2.idproducto == -1){
                  showToast("Error al registrar el producto", "ERROR");
      
                }else{
                    showToast("Producto registrado correctamente", "SUCCESS");
                    //producto creado se limpia el formulario
                    document.querySelector("#form-registro-productos").reset();
                    $("#Producto").focus();

                    
                }
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