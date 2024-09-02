<?php
session_start();


//Si el usuario ya inició sesión... ¡NO DEBERÍA ESTAR AQUÍ!
if(isset($_SESSION['login']) && $_SESSION['login']['permitido']){
    header('Location:home.php');
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="icon" href="img/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="background">
        <div class="menu p-5">
                <div class="row d-flex justify-content-center align-items-center">
                <div class=" presentacion col-md-6 ">
                        <h2>Bienvenidos!</h2 >
                            <h3>Granja San Matias SAC</h3>
                            <p>La Granja tiene como finalidad 
                                la produccion de huevos
                                ecoamigables con fines 
                                de sostenibilidad de gallinas</p>
                </div>
                <div class="login col-md-6">
                        <h2 class="inicio" style="color: white;">Iniciar Sesion</h2>    
                        <form autocomplete="off" id="form-login">
                        <br>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="inputEmail" type="text" autofocus placeholder="correo@gmail.com" required />
                            <label for="inputEmail">Usuario</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="inputPassword" type="password" placeholder="Password" required/>
                            <label for="inputPassword">Contraseña</label>
                        </div>
                        <div class="check">
                            <label> </label>
                        </div>
                        <div class=" text-center align-items-center justify-content-between mt-4 mb-0">
                            <button class="btn btn-danger" type="submit">Login</button>
                        </div>
                    </form>
                </div>
                </div>
            </div>
            </div>
        </div>

    <script>
            document.addEventListener("DOMContentLoaded", () => {
                document.querySelector("#form-login").addEventListener("submit", (event) => {
                    event.preventDefault();

                    //Datos a Enviar
                    const params = new URLSearchParams();
                    params.append("operacion", "login");
                    params.append("nomusuario", document.querySelector("#inputEmail").value);
                    params.append("passusuario", document.querySelector("#inputPassword").value);

                    fetch(`./controllers/login.controller.php?${params}`)
                        .then(response => response.json()) 
                        .then(acceso => {
                            console.log(acceso);
                            if(!acceso.permitido){
                                alert(acceso.status);
                            }else{
                                window.location.href = './home.php'; 
                            }
                        })
                });
            })

        </script>
</body>
</html>