
document.addEventListener("DOMContentLoaded", () => {

  const idhuevo = document.querySelector("#idhuevo");
  const StockActual = document.querySelector("#stockProducto");


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
})();

  function ValidarCantidadSalida(){
    if (tipomovimiento.value === 'S') {
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
    const params = new FormData()
    params.append("operacion", "add")
    params.append("idcolaborador", document.querySelector("#idcolaborador").value)
    params.append("idhuevo", document.querySelector("#idhuevo").value)
    params.append("tipomovimiento", document.querySelector("#tipomovimiento").value)
    params.append("motivomovimiento", document.querySelector("#Motivomovimiento").value)
    params.append("cantidad", document.querySelector("#cantidad").value)

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

    //Si la cantidad es mayor que el stock actual
    if(!ValidarCantidadSalida()){
        return;
    }

    if(confirm("¿Estás seguro de realizar esta Actualización?")){
        GuardarKardex();
    }
});



})