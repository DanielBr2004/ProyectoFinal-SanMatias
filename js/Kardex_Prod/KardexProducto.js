document.addEventListener("DOMContentLoaded", () => {
  
  $('#tabla-productos').DataTable({
    "language": {
        "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
    }
});

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
        if (parseFloat(cantidad.value) > parseFloat(StockActual.value)) {
            showToast("La Cantidad de Salida no puede ser mayor al stock Actual", "ERROR", 3000);
            return false;
        }
    }
    return true;
    }
  
// En KardexProducto.js
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

  fetch(`../../controllers/kardexAlmacenProducto.controller.php`, {
      method: 'POST',
      body: params
  })
  .then(response => response.json())
  .then(async data => {
      document.querySelector("#form-kardex-Productos").reset();
      showToast("Kardex registrado correctamente", "SUCCESS", 3000);
      
      // Llamar a initDataTable para actualizar la tabla
      if (typeof window.initDataTable === 'function') {
          await window.initDataTable();
      }
  })
  .catch(e => {
      console.error(e);
      showToast("Error al registrar", "ERROR", 3000);
  });
}
  
document.querySelector("#form-kardex-Productos").addEventListener("submit", async (event) => {
  event.preventDefault();

  const ValorIngresado = parseFloat(CantidadEntrada.value);

  if(ValorIngresado < 0){
      showToast("La cantidad no puede ser negativa", "ERROR");
      return;
  }

  if(!ValidarCantidadSalida()){
      return;
  }

  if(await ask("¿Está seguro de registrar el Kardex?")){
      await GuardarKardex();
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
 
});

  