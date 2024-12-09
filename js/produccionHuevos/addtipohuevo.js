document.addEventListener('DOMContentLoaded', function() {

let tipoHuevo = -1;

async function registrarTipoHuevo() {
    const params = new FormData();
    params.append("operacion", "add");
    params.append("tiposHuevos", document.querySelector("#nombreHuevo").value);
    params.append("PrecioKg", document.querySelector("#precioHuevo").value);
    params.append("descripcion", document.querySelector("#descripcion").value);

    const options = {
        method: 'POST',
        body: params
    }

    const response = await fetch(`../../../controllers/tipohuevo.controller.php`, options);
    return response.json();
  }

  document.querySelector("#form-registro-huevos").addEventListener("submit", async (event) => {
    event.preventDefault();

    if(await ask("¿Estas seguro de registrar?")){
      
        let response2;
        response2 =  registrarTipoHuevo();
        if(response2.idtipohuevo == -1){
          showToast("Error al registrar el tipo de huevo", "ERROR");
          
        }else{
            showToast("Tipo de huevo registrado correctamente", "SUCCESS");
              await initDataTable();
            //producto creado se limpia el formulario
            document.querySelector("#form-registro-huevos").reset();
        }
      }
  });  


});