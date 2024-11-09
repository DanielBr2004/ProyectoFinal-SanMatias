document.addEventListener("DOMContentLoaded", () => {



  let idproduccion  = -1;



  async function  registrarProduccion() {
    const params = new FormData();
    params.append("operacion", "add");
    params.append("idlote", document.querySelector("#idlote").value);
    params.append("mortalidad", document.querySelector("#mortalidad").value);
    params.append("alimento", document.querySelector("#alimento").value);


    const options = {
        method: 'POST',
        body: params
    }

    const response = await fetch(`../../controllers/controlProduccion.controller.php`, options);
    return response.json();

  }

  (() => {
    fetch(`../../controllers/numlote.controller.php?operacion=getAll`)
        .then(response => response.json())
        .then(data => {
            const numlote = document.querySelector("#idlote")
            data.forEach(row => {
                const tagOption = document.createElement("option")
                tagOption.value = row.idlote
                tagOption.innerHTML = `Lote N° ${row.numLote}`
                numlote.appendChild(tagOption)
            });
        })
        .catch(e => { console.error(e) })
})();

(() => {
  fetch(`../../controllers/numlote.controller.php?operacion=getAll`)
      .then(response => response.json())
      .then(data => {
          const loteselectmain = document.querySelector("#numLote")
          data.forEach(row => {
              const tagOption = document.createElement("option")
              tagOption.value = row.idlote
              tagOption.innerHTML = `Lote N° ${row.numLote}`
              loteselectmain.appendChild(tagOption)
          });
      })
      .catch(e => { console.error(e) })
})();



  document.querySelector("#form-produccion").addEventListener("submit", async (event) => {
    event.preventDefault();

    if(await ask("¿Estás seguro de que deseas registrar esta producción?")){

        let response2;
        response2 =  registrarProduccion();
        if(response2.idproduccion == -1){
          showToast("Error al registrar la producción", "ERROR");

    
        }else{
            showToast("Producción registrada correctamente", "SUCCESS");
            
            document.querySelector("#form-produccion").reset();
            document.querySelector("#idlote").focus();
        }
    }
  });
});