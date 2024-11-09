document.addEventListener("DOMContentLoaded", () => {

  const nuevolote = document.querySelector("#numLote");
  const registrarLoteButton = document.querySelector("#registrar-lote");

  let numlote = -1;

  async function  registrarLote() {
    const params = new FormData();
    params.append("operacion", "add");
    params.append("numLote", document.querySelector("#numLote").value);
    params.append("CantInicio", document.querySelector("#CantInicio").value);
    params.append("descripcion", document.querySelector("#descripcion").value);

    const options = {
        method: 'POST',
        body: params
    }

    const response = await fetch(`../../../controllers/numlote.controller.php`, options);
    return response.json();

  }


  async function  validarExistencia() {
    const numlote = document.querySelector("#numLote");

    const params = new URLSearchParams();
      params.append("operacion", "searchLote");
      params.append("numLote", numlote.value);

      const response = await fetch(`../../../controllers/numlote.controller.php?${params}`);
      return response.json();
  }


  document.querySelector("#form-registro-lotes").addEventListener("submit", async (event) => {
    event.preventDefault();

    let response = await validarExistencia();

    if(response.length > 0){
        showToast("El lote ya existe", "WARNING");
        nuevolote.select();
      }else{
          
          if(await ask("¿Estás seguro de que deseas registrar este lote?")){
  
              let response2;
              response2 =  registrarLote();
              if(response2.idnumlote == -1){
                showToast("Error al registrar el lote", "ERROR");
      
              }else{
                  showToast("Lote registrado correctamente", "SUCCESS");
                  //producto creado se limpia el formulario
                  document.querySelector("#form-registro-lotes").reset();
                  document.querySelector("#numLote").focus();
              }
            }
      }
  });

});