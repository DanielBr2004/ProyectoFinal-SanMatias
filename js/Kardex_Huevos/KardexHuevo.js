

document.addEventListener("DOMContentLoaded", () => {

  const idhuevo = document.querySelector("#idhuevo");
  const StockActual = document.querySelector("#stockProducto");
  const CantidadEntrada = document.querySelector("#cantidad");

  const Motivomovimiento = document.querySelector("#Motivomovimiento");

  const tablaKardexHuevos = document.querySelector("#tbody-productos");


  idhuevo.addEventListener("change", () =>{
    const huevo = idhuevo.value;
    if(huevo){
      ShowStockActual(huevo);
    }
  })

  async function ShowStockActual(idhuevo) {
    try{
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=mostrarStockActual&idhuevo=${idhuevo}`);
      const Stock = await response.json();
      StockActual.value = Stock;
    }catch (error) {
                console.error(error);
            }
  }

  if(idhuevo.value){
    ShowStockActual(idhuevo.value);
  }

  // desactivado momentaneamente
/*
  (() => {
    fetch(`../../controllers/colaborador.controller.php?operacion=getAll`)
        .then(response => response.json())
        .then(data => {
            const NomUsuario = document.querySelector("#idcolaborador")
            data.forEach(row => {
                const tagOption = document.createElement("option")
                tagOption.value = row.idcolaborador
                tagOption.innerHTML = row.nomusuario
                NomUsuario.appendChild(tagOption)
            });
        })
        .catch(e => { console.error(e) })
})();*/


  function ValidarCantidadSalida(){
    if (Motivomovimiento.value === 'S') {
      if (parseInt(cantidad.value) > parseInt(StockActual.value)) {
          Swal.fire({
              icon: "error",
              title: "Error",
              text: "La Cantidad de Salida no puede ser mayor al stock Actual",
          });
          return false;
      }
  }
  return true;
  }

  function GuardarKardex(){

    const itemselecionado = document.getElementById('Motivomovimiento');
    const valueitem = itemselecionado.selectedIndex;
    const motivoselecionado = itemselecionado.options[valueitem].text;


    const params = new FormData()
    params.append("operacion", "add")
    params.append("idcolaborador", document.querySelector("#idcolaborador").value)
    params.append("idhuevo", document.querySelector("#idhuevo").value)
    params.append("tipomovimiento", document.querySelector("#Motivomovimiento").value)
    params.append("motivomovimiento", motivoselecionado)
    params.append("cantidad", document.querySelector("#cantidad").value)
    params.append("descripcion", document.querySelector("#mermaInput").value)

    //options > fetch
    const options = {
        'method' : 'POST',
        'body'   : params
    }

    //Ejecutamos el envío asíncrono
    fetch(`../../controllers/kardexAlmacenHuevo.controller.php`, options)
        .then(response => response.json())
        .then(data => {
            //Limpiar el formulario
            document.querySelector("#form-kardex-huevos").reset();
            Swal.fire({
                position: "center",
                icon: "success",
                title: "Kardex Actualizado Correctamente",
                showConfirmButton: false,
                timer: 1500
            });
        })
        .catch( e => { console.error(e) })
  }

    document.querySelector("#form-kardex-huevos").addEventListener("submit", (event) => {
      event.preventDefault();

      const ValorIngresado = parseInt(CantidadEntrada.value);

      if(ValorIngresado < 0){
          event.preventDefault();
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "La cantidad ingresada debe ser Mayor a 0",
          })
      }else{
                //Si la cantidad es mayor que el stock actual
          if(!ValidarCantidadSalida()){
            return;
        }

        if(Swal.fire({
          title: "Deseas Guardar los cambios",
          showDenyButton: true,
          showCancelButton: true,
          confirmButtonText: "Guardar",
          denyButtonText: `No guardar`
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
            Swal.fire(GuardarKardex());
          } else if (result.isDenied) {
            Swal.fire("Cancelado", "", "error", document.querySelector("#form-kardex-huevos").reset());
          }
        })){
        }
      }


  });

  Motivomovimiento.addEventListener('change', function() {
    var mermaInputContainer = document.getElementById('mermaInputContainer');

    const itemselecionado = document.getElementById('Motivomovimiento');
    const valueitem = itemselecionado.selectedIndex;
    const motivoselecionado = itemselecionado.options[valueitem].text;

    if (motivoselecionado === 'Salida por Contingencia') {
        mermaInputContainer.style.display = 'block';
    } else {
        mermaInputContainer.style.display = 'none';
    }
  });


//LISTADO
async function obtenerKardexHuevos() {
  try {
    const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=getAlls`);
    const kardexHuevos = await response.json();
    console.log("Datos recibidos:", kardexHuevos); // Verifica aquí
    tablaKardexHuevos.innerHTML = "";
    kardexHuevos.forEach(huevo => {
      const fila = document.createElement("tr");
      fila.innerHTML = `
        <td>${huevo.idAlmacenHuevos}</td>
        <td>${huevo.nombre_colaborador}</td>
        <td>${huevo.tipo_huevo}</td>
        <td>${huevo.motivomovimiento}</td>
        <td>${huevo.stockProducto}</td>
        <td>${huevo.cantidad}</td>
        <td>${huevo.descripcion}</td>
        <td>${huevo.creado}</td>
        <td>
          <button class="btn btn-warning btn-sm">Editar</button>
          <button class="btn btn-danger btn-sm">Eliminar</button>
        </td>
      `;
      tablaKardexHuevos.appendChild(fila);
    });
  } catch (error) {
    console.error("Error al obtener el kardex de huevos:", error);
  }
}
obtenerKardexHuevos();

})
