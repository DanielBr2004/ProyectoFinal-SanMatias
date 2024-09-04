<?php require_once '../../Header.php'; ?>
        <!-- Page content-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>USUARIOS</h1>
            </div>
            <br>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-header">
                    Complete los datos
                </div>
                <div class="card-body">
                    <form action="" id="form-registro-usuarios" autocomplete="off">
                <!-- Primera Fila -->
            <div class="row g-2 mb-2">
                <div class="col-md">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="tel" class="form-control" maxlength="8" minlength="8"  id="nrodocumento" autofocus required>
                            <label for="nrodocumento">Número Documento</label>
                        </div>
                        <button class="input-group-text btn btn-secondary" type="button" id="buscar-nrodocumento"><i class="bi bi-search"></i></button>
                    </div>
                </div> 

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="nombres" required>
                        <label for="nombres">Nombres</label>
                    </div>
                </div> 
            </div> <!-- ./primera fila -->

            <!-- Segunda Fila -->
            <div class="row g-2">

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="apepaterno" required>
                        <label for="apepaterno">Apellido Paterno</label>
                    </div>
                </div> 

                <div class="col-md">
                    <div class="form-floating">
                        <input type="text" class="form-control" maxlength="50" id="apematerno" required>
                        <label for="apematerno">Apellido Materno</label>
                    </div>
                </div>
            </div> <!-- ./segunda fila -->

            <hr>

            <!-- Tercera Fila -->
            <div class="row g-2">
                <div class="col-md mb-3">
                    <div class="form-floating">
                        <input type="text" id="nomusuario" maxlength="150" class="form-control">
                        <label for="nomusuario">Nombre de Usuario</label>
                    </div>
                </div>
                <div class="col-md mb-3">
                    <div class="form-floating">
                        <input type="password" id="passusuario" class="form-control" required>
                        <label for="passusuario">Contraseña</label>
                    </div>
                </div>
            </div> <!-- ./tercera fila -->
            
            <div class="text-end">
                <button type="submit" id="registrar-colaborador" class="btn btn-primary btn-sm">Registrar Nuevo Colaborador</button>
                <button type="reset" id="cancelar" class="btn btn-secondary btn-sm">Cancelar Proceso</button>
            </div>
                    </form>
                </div>
            </div>
        
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Core theme JS-->
        <script src="<?= $host ?>/js/scripts.js"></script>

        <script>
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
            async function registrarUsuario(idpersona){
                const params = new FormData();
                params.append("operacion", "add");
                params.append("idpersona", idpersona);
                params.append("nomusuario", document.querySelector("#nomusuario").value);
                params.append("passusuario", document.querySelector("#passusuario").value);


                const options = {
                    method: "POST",
                    body: params
                }

                const idcolaborador = await fetch(`../../controllers/colaborador.controller.php`, options);
                return idcolaborador.json();
            }

            //Función asíncrona de buscar el documento por DNI 
            async function buscarDocumento(){
                const params = new URLSearchParams();
                params.append("operacion", "searchByDoc");
                params.append("nrodocumento", nrodocumento.value);

                const response = await fetch(`../../controllers/colaborador.controller.php?${params}`);
                return response.json();
            }

            //Esta función será utilizada desde el evento click - keypress usando buscarDocumento()
            function validarDocumento(response){
                if(response.length == 0){
                    //No encontró a la persona
                    document.querySelector("#apepaterno").value = ``;
                    document.querySelector("#apematerno").value = ``;
                    document.querySelector("#nombres").value = ``;
                    //Activar el formulario para poder registrarse
                    adPersona(true);
                    adUsuario(true);
                    //El usuario debe completar los datos de persona y registrarse 
                    datosNuevos = true;
                    //idpersona obtiene el valor de "response1"
                    idpersona = -1;
                    document.querySelector("#apepaterno").focus();
                }else{
                    //Mostrar datos de la persona
                    datosNuevos = false;
                    idpersona = response[0].idpersona;
                    document.querySelector("#apepaterno").value = response[0].apepaterno;
                    document.querySelector("#apematerno").value = response[0].apematerno;
                    document.querySelector("#nombres").value = response[0].nombres;

                    //Se encontró a la persona
                    //Bloqueamos los controles porque ya está registrado
                    adPersona(false);

                    //Preguntar si podemos crear la cuenta
                    if(response[0].idcolaborador === null){
                        //Registrada como persona, NO como Usuario
                        adUsuario(true);
                    }else{
                        //Registrada como Persona y como Usuario (NO SE PUEDE HACER NADA MÁS)
                        adUsuario(false);
                        Swal.fire("Esta Persona ya cuenta con un Perfil de Usuario");
                    }
                }
            }

            //Buscador del documento al pulsar Enter #01
            nrodocumento.addEventListener("keypress", async (event) => {
                if(event.keyCode == 13){
                    event.preventDefault();
                    const response = await buscarDocumento();
                    validarDocumento(response);
                }
            });

            //Buscador del documento al hacer click #02
            document.querySelector("#buscar-nrodocumento").addEventListener("click", async () => {
                const response = await buscarDocumento();
                validarDocumento(response);
            });

            //Método para habilitar/deshabilitar el formulario de personas
            function adPersona(sw = false){
                if(!sw){
                    document.querySelector("#apepaterno").setAttribute("disabled", true);
                    document.querySelector("#apematerno").setAttribute("disabled", true);
                    document.querySelector("#nombres").setAttribute("disabled", true);
                }else{
                    document.querySelector("#apepaterno").removeAttribute("disabled");
                    document.querySelector("#apematerno").removeAttribute("disabled");
                    document.querySelector("#nombres").removeAttribute("disabled");
                }
            }

            //Método para habilitar/deshabilitar el formulario de usuarios
            function adUsuario(sw = false){
                if(!sw){
                    document.querySelector("#nomusuario").setAttribute("disabled", true);
                    document.querySelector("#passusuario").setAttribute("disabled", true);
                    document.querySelector("#registrar-colaborador").setAttribute("disabled", true);
                }else{
                    document.querySelector("#nomusuario").removeAttribute("disabled");
                    document.querySelector("#passusuario").removeAttribute("disabled");
                    document.querySelector("#registrar-colaborador").removeAttribute("disabled");
                }
            }

            document.querySelector("#form-registro-usuarios").addEventListener("submit", async (event) => {
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
                        response2 = await registrarUsuario(idpersona);
                        if(response2.idcolaborador == -1){
                            Swal.fire("No se pudo crear tu cuenta de Usuario, Verifique el Email");
                        }else{
                            Swal.fire({
                                position: "center",
                                icon: "success",
                                title: "Usuario creado Correctamente",
                                showConfirmButton: false,
                                timer: 1500
                            });
                            //Ambos procesos han finalizado correctamente
                            document.querySelector("#form-registro-usuarios").reset();
                        }
                    }
                }
            });

            //Cancelar 
            document.querySelector("#cancelar").addEventListener("click", async () => {
                adPersona(true);
                adUsuario(true);
            });

            //Método de Inicio
            adPersona();
        })
    </script>
    </body>
</html>
