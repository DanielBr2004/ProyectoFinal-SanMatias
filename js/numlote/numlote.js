document.addEventListener("DOMContentLoaded", () => {

  let numlote = -1;

  async function  registrarLote(lastLote) {
    const params = new FormData();
    params.append("operacion", "add");
    params.append("numLote", lastLote + 1);
    params.append("CantInicio", document.querySelector("#CantInicio").value);
    params.append("descripcion", document.querySelector("#descripcion").value);

    const options = {
        method: 'POST',
        body: params
    }

    const response = await fetch(`../../../controllers/numlote.controller.php`, options);
    return response.json();

  }

  async function obtenerultimolote() {
    const params = new URLSearchParams();
    params.append("operacion", "getLastDate");

    try {
        const response = await fetch(`../../../controllers/numlote.controller.php?operacion=getLastDate`);
        const data = await response.json();
        console.log(data[0].numlote);
        
        return data[0].numlote;
    } catch (error) {
        console.error('Error al obtener el último lote:', error);
    }
}


  document.querySelector("#form-registro-lotes").addEventListener("submit", async (event) => {
    event.preventDefault();

          
          if(await ask("¿Seguro de registrar? <br> <b>Una vez registrado no se podrá modificar.</b>")){
            
              let response2;
              const lastLote = await obtenerultimolote();
              response2 =  registrarLote(lastLote);
              if(response2.idnumlote == -1){
                showToast("Error al registrar el lote", "ERROR");
      
              }else{
                  showToast("Lote registrado correctamente", "SUCCESS");
                  //producto creado se limpia el formulario
                  document.querySelector("#form-registro-lotes").reset();
              }
            }
      
  });


  obtenerultimolote();
});