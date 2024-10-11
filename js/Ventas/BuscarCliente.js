document.addEventListener("DOMContentLoaded", () => {
    //Función de referencia GLOBAL
    function $(object = null) {
      return document.querySelector(object);
    }




    async function buscarRUC(){
      const ruc = $("#nrodocumento").value;

      if (ruc.length == 11){
        const response = await fetch(`../../Api/api.buscarRUC.php?ruc=${ruc}`, { method: 'GET' });
        const data = await response.json();
        

        if (data.hasOwnProperty("message")){
          $("#razonsocial").value = '';
          $("#direccion").value = '';
        }else{
          $("#razonsocial").value = data['razonSocial'];
          $("#direccion").value = data['direccion'];
          $("#nombres").value = '';
          $("#apepaterno").value = '';
          $("#apematerno").value = '';
        }
        return data;
      }
    }

    async function buscarDNI(){
      const ruc = $("#nrodocumento").value;

      if(ruc.length == 8){
        const response = await fetch(`../../Api/api.buscarDNI.php?dni=${ruc}`, { method: 'GET' });
        const data = await response.json();
        

        if (data.hasOwnProperty("message")){
          $("#nombres").value = '';
          $("#apepaterno").value = '';
          $("#apematerno").value = '';
        }else{
          $("#nombres").value = data['nombres'];
          $("#apepaterno").value = data['apellidoPaterno'];
          $("#apematerno").value = data['apellidoMaterno'];
          $("#razonsocial").value = '';
          $("#direccion").value = '';
      }
      return data;
      }
    }

    //Funciones
    //Lógica comunicación con el API
    async function ValidaDocumento() {

      const ruc = $("#nrodocumento").value;
      let data = null;

      if (ruc.length == 11){
        data = await buscarRUC();
        return data;
      }else if(ruc.length == 8){
        data = await buscarDNI();
        return data;
      }

      
  }


    //EVENTOS DE EJECUCION
    $("#nrodocumento").addEventListener("keypress", async (event) => {
      if (event.keyCode == 13) {
         await ValidaDocumento();
      }
    });

    $("#nrodocumento").addEventListener("input", async () => {
        await ValidaDocumento();
    });
    

});