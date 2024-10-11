document.addEventListener("DOMContentLoaded", () => {
            
  //Referencia a la caja de texto DNI
  const nrodocumento = document.querySelector("#nrodocumento");
  //Variable de persona que indicará negativo (persona no identificada)
  let idpersona = -1;
  //Bandera
  let datosNuevos = true;

  //Función Asíncrona para registrar la persona
  async function registrarPersona(){
      //Datos a Enviar
      const params = new FormData();
      params.append("operacion", "add");
      params.append("apepaterno", document.querySelector("#apepaterno").value);
      params.append("apematerno", document.querySelector("#apematerno").value);
      params.append("nombres", document.querySelector("#nombres").value);
      params.append("nrodocumento", document.querySelector("#nrodocumento").value);
      //Objeto de Configuración
      const options = {
          method: "POST",
          body: params
      };

      //Enviamos la Petición
      const idpersona = await fetch(`../../controllers/persona.controller.php`, options)
      return idpersona.json();
  }

  //Función registrar Usuario (se obtiene le idpersona)
  async function registrarCliente(idpersona){
      const params = new FormData();
      params.append("operacion", "add");
      params.append("idpersona", idpersona);
      params.append("tipodocumento", document.querySelector("#tipodocumento").value);
      params.append("telefono", document.querySelector("#telefono").value);
      params.append("razonsocial", document.querySelector("#razonsocial").value);
      params.append("direccion", document.querySelector("#direccion").value);
      params.append("email", document.querySelector("#email").value);


      const options = {
          method: "POST",
          body: params
      }

      const idcolaborador = await fetch(`../../controllers/Clientes.controller.php`, options);
      return idcolaborador.json();
  }

  //Función asíncrona de buscar el documento por DNI 
  async function buscarDocumento(){
      const params = new URLSearchParams();
      params.append("operacion", "searchByDoc");
      params.append("nrodocumento", nrodocumento.value);

      const response = await fetch(`../../controllers/Clientes.controller.php?${params}`);
      return response.json();
  }




  //Buscador del documento al pulsar Enter #01
  nrodocumento.addEventListener("input", async (event) => {
        event.preventDefault();
        const response = await buscarDocumento();
        if (response && response.length > 0) {
            alert("El usuario ya existe.");
            adUsuario();
        } else {
            // Permitir registro
            // Aquí puedes agregar la lógica para permitir el registro
            console.log("Usuario no encontrado. Permitir registro.");
            adUsuario(true);
        }
});


  //Método para habilitar/deshabilitar el formulario de usuarios
  function adUsuario(sw = false){
      if(!sw){
          document.querySelector("#telefono").setAttribute("disabled", true);
          document.querySelector("#registrar-cliente").setAttribute("disabled", true);
          document.querySelector("#email").setAttribute("disabled", true);
      }else{
          document.querySelector("#telefono").removeAttribute("disabled");
          document.querySelector("#registrar-cliente").removeAttribute("disabled");
          document.querySelector("#email").removeAttribute("disabled");

      }
  }

  document.querySelector("#form-registro-clientes").addEventListener("submit", async (event) => {
      event.preventDefault();

      if(confirm("¿Estás seguro de proceder?")){

          //Control de Personas
          let response1;
          //Control de Usuarios 
          let response2;

          //¿Y si la persona ya fue creada?
          if(datosNuevos){
              response1 = await registrarPersona(); //Registramos nueva persona
              idpersona = response1.idpersona;      //Obtenemos el ID de la nueva persona
          }

          //¿El idpersona es correcto?
          if(idpersona == -1){
              Swal.fire("No se pudo registrar los datos del usuario, verifique DNI");
          }else{
              //Tenemos idpersona
              response2 = await registrarCliente(idpersona);
              if(response2.idcolaborador == -1){
                  Swal.fire("No se pudo crear tu cuenta de Usuario, Verifique el Email");
              }else{
                  Swal.fire({
                      position: "center",
                      icon: "success",
                      title: "Cliente creado Correctamente",
                      showConfirmButton: false,
                      timer: 1500
                  });
                  //Ambos procesos han finalizado correctamente
                  document.querySelector("#form-registro-clientes").reset();
                  adUsuario();
              }
          }
      }
  });


  //Método de Inicio
  adUsuario();
})