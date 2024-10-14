document.addEventListener("DOMContentLoaded", () => {
    //Función de referencia GLOBAL
    function $(object = null) {
      return document.querySelector(object);
    }

    const nrodocumento = $("#nrodocumento");

  async function buscarDocumento(){
    const params = new URLSearchParams();
    params.append("operacion", "searchByDoc");
    params.append("nrodocumento", nrodocumento.value);

    const response = await fetch(`../../controllers/Clientes.controller.php?${params}`);
    return response.json();
  }
  
  async function llenarDatos(response){
    if(response.length == 0){
      $("#razonsocial").value = '';
      $("#direccion").value = '';
    }else{
      $("#tipodocumento").value = response[0].tipodocumento;
      $("#nombres").value = response[0].apepaterno + " " + response[0].apematerno + " " + response[0].nombres;
      $("#razonsocial").value = response[0].razonsocial;
      $("#direccion").value = response[0].direccion;
      $("#email").value = response[0].email;
      $("#telefono").value = response[0].telefono;
    }
  }

    nrodocumento.addEventListener("input", async (e) => {
      const response = await buscarDocumento();
      llenarDatos(response);

  });


});