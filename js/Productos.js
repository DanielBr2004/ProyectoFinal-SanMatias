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
        tbody.innerHTML = ''; // Limpiar cualquier contenido previo
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
            tbody.innerHTML += row; // Agregar la fila a la tabla
        });
    } catch (error) {
        console.error('Error al listar los productos:', error);
    }
}
listarProductos();












})