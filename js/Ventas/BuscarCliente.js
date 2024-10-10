document.addEventListener("DOMContentLoaded", () => {
    //Función de referencia GLOBAL
    function $(object = null) {
      return document.querySelector(object);
    }

    //Funciones
    //Lógica comunicación con el API
    async function buscarRUC() {
      const ruc = $("#ruc").value;

      if (ruc.length == 11){
        const response = await fetch(`../../Api/api.buscarRUC.php?ruc=${ruc}`, { method: 'GET' });
        const data = await response.json();
        

        if (data.hasOwnProperty("message")){
          $("#razonsocial").value = '';
          $("#direccion").value = '';
        }else{
          $("#razonsocial").value = data['razonSocial'];
          $("#direccion").value = data['direccion'];
        }
      }
    }


    $("#ruc").addEventListener("keypress", async (event) => {
      if (event.keyCode == 13) {
        buscarRUC();
      }
    });

    $("#ruc").addEventListener("input", async () => {
        buscarRUC();
    });

});