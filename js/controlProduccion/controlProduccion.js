document.addEventListener("DOMContentLoaded", () => {
  let idproduccion = -1;



  const idlote = document.querySelector("#idlote");

  async function registrarProduccion() {
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

  async function ValidarCantidadLote($idlote) {
      const params = new FormData();
      params.append("operacion", "ValidarLote");
      params.append("idlote", $idlote);

      const options = {
          method: 'POST',
          body: params
      }

      const response = await fetch(`../../controllers/controlProduccion.controller.php`, options);
      return response.json();
  }

  idlote.addEventListener("change", async () => {
    if(idlote){
        const response = await ValidarCantidadLote(idlote.value);
        console.log(response[0].resultado);

        if(response[0].resultado == 1){
            showToast("Lote Con 0 Gallinas", "ERROR", 3000);
            document.querySelector("#registrar-producto").disabled = true;
        }else{
            document.querySelector("#registrar-producto").disabled = false;
        }
    }
  });

  async function actualizarSelects() {
      try {
          const response = await fetch(`../../controllers/numlote.controller.php?operacion=getAll`);
          const data = await response.json();
          
          ["#idlote", "#numLote"].forEach(selectId => {
              const select = document.querySelector(selectId);
              select.innerHTML = '<option value="">Selección</option>';
              data.forEach(row => {
                  const option = document.createElement("option");
                  option.value = row.idlote;
                  option.textContent = `Lote N° ${row.numLote}`;
                  select.appendChild(option);
              });
          });
      } catch (e) {
          console.error(e);
      }
  }

  // Cargar lotes inicialmente
  (() => {
      actualizarSelects();
  })();

  document.querySelector("#form-produccion").addEventListener("submit", async (event) => {
      event.preventDefault();

      if(await ask("¿Estás seguro de que deseas registrar esta producción?")) {
          try {
              const response = await registrarProduccion();
              
              
              if(response.idproduccion == -1) {
                  showToast("Error al registrar la producción", "ERROR");
              } else {
                  showToast("Producción registrada correctamente", "SUCCESS");
                  document.querySelector("#form-produccion").reset();
                  
                  // Actualizar selects
                  await actualizarSelects();
                  
                  // Actualizar tabla si hay un lote seleccionado
                  const selectedLote = document.querySelector("#numLote").value;
                  if (selectedLote && window.initDataTable) {
                      await window.initDataTable(selectedLote);
                  }
                  
                  document.querySelector("#idlote").focus();
              }
          } catch (error) {
              console.error('Error:', error);
              showToast("Error al registrar la producción", "ERROR");
          }
      }
  });
});