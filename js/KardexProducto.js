
document.addEventListener("DOMContentLoaded", () => {

    const idproducto = document.querySelector("#idproducto");
    const StockActual = document.querySelector("#stockProducto");
    const CantidadEntrada = document.querySelector("#cantidad");

    const Motivomovimiento = document.querySelector("#Motivomovimiento");
  
    idproducto.addEventListener("change", () =>{
      const producto = idproducto.value;
      if(producto){
        ShowStockActual(producto);
      }
    });
  
    async function ShowStockActual(idproducto) {
      try{
        const response = await fetch(`../../controllers/kardexAlmacenProducto.controller.php?operacion=mostrarStockActual&idproducto=${idproducto}`);
        const Stock = await response.json();
        StockActual.value = Stock;
      }catch (error) {
                  console.error(error);
              }
    }
  
    if(idproducto.value){
      ShowStockActual(idproducto.value);
    }

    (() => {
      fetch(`../../controllers/producto.controller.php?operacion=getAll`)
          .then(response => response.json())
          .then(data => {
              const productos = document.querySelector("#idproducto")
              data.forEach(row => {
                  const tagOption = document.createElement("option")
                  tagOption.value = row.idproducto
                  tagOption.innerHTML = row.producto
                  productos.appendChild(tagOption)
              });
          })
          .catch(e => { console.error(e) })
  })();
  
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
      params.append("idproducto", document.querySelector("#idproducto").value)
      params.append("tipomovimiento", document.querySelector("#Motivomovimiento").value)
      params.append("motivomovimiento", motivoselecionado)
      params.append("cantidad", document.querySelector("#cantidad").value)
      params.append("descripcion", document.querySelector("#mermaInput").value)
  
      const options = {
          'method' : 'POST',
          'body'   : params
      }
  
      //Ejecutamos el envío asíncrono
      fetch(`../../controllers/kardexAlmacenProducto.controller.php`, options)
          .then(response => response.json())
          .then(data => {
              //Limpiar el formulario
              document.querySelector("#form-kardex-Productos").reset();
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
  
    document.querySelector("#form-kardex-Productos").addEventListener("submit", (event) => {
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
            Swal.fire("Cancelado", "", "error", document.querySelector("#form-kardex-Productos").reset());
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

      if (motivoselecionado === 'Salida por merma') {
          mermaInputContainer.style.display = 'block';
      } else {
          mermaInputContainer.style.display = 'none';
      }
  });
  
  })

  