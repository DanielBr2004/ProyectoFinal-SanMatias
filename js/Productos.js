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