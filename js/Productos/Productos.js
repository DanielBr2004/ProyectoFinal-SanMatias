document.addEventListener("DOMContentLoaded", () => {
    //Bandera
    let datosNuevos = true; 
    let Producto = -1;
    
    //Función para registrar el Producto
    async function registrarProducto(producto){
        const params = new FormData();
        params.append("operacion", "add");
        params.append("Producto", document.querySelector("#Producto").value);
        params.append("stockminimo", document.querySelector("#stockminimo").value);
        params.append("descripcion", document.querySelector("#descripcion").value);
  
        const options = {
            method: 'POST',
            body: params
        }
  
        const idproducto = await fetch(`../../controllers/producto.controller.php`, options);
        return idproducto.json();
    }
  
    async function validarExistencia() {
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
      } else {
          if(await ask("¿Estás seguro de que deseas registrar este producto?")){
              let response2;
              response2 = registrarProducto(Producto);
              if(response2.idproducto == -1){
                  showToast("Error al registrar el producto", "ERROR");
              } else {
                  showToast("Producto registrado correctamente", "SUCCESS");
                  document.querySelector("#form-registro-productos").reset();
                  $("#Producto").focus();
                  
                  // Actualizar la tabla después de registrar
                  if (typeof window.initDataTable === 'function') {
                      await window.initDataTable();
                  }
              }
          }
      }
    });
  });