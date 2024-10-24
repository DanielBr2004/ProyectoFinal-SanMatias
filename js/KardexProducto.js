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
              showToast("Kardex registrado correctamente", "SUCCESS")
          })
          .catch( e => { console.error(e) })
    }
  
    document.querySelector("#form-kardex-Productos").addEventListener("submit", async (event) => {
      event.preventDefault();
  
      const ValorIngresado = parseFloat(CantidadEntrada.value);
  
      if(ValorIngresado < 0){
          event.preventDefault();
          showToast("La cantidad no puede ser negativa", "ERROR");
      }else{
                //Si la cantidad es mayor que el stock actual
          if(!ValidarCantidadSalida()){
            return;
          }
  
          if(await ask("¿Está seguro de registrar el Kardex?")){
            GuardarKardex();
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


  const dataTableOptions = {
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
    }
  };
  
 //listado
  /*
  async function cargarProductos() {
    try {
        const response = await fetch('../../controllers/kardexAlmacenProducto.controller.php?operacion=getAll');
        const data = await response.json();

        const tbody = document.getElementById("tbody-productos");
        tbody.innerHTML = ""; // Limpiamos el contenido previo

        data.forEach(item => {
          const tr = document.createElement("tr");
          tr.innerHTML = `
              <td class="text-center">${item.ID}</td>
              <td class="text-center">${item.Colaborador}</td>
              <td class="text-center">${item.Producto}</td>
              <td class="text-center">${item['Stock Actual']}</td>
              <td class="text-center">${item['Motivo de Movimiento']}</td>
              <td class="text-center">${item.Cantidad}</td>
              <td class="text-center">${item.Creado}</td>
              <td class="text-center">
              <button class="btn btn-warning btn-sm btn-editar" data-id="<?= $row['id'] ?>">Editar</button>
              </td>
          `;
          tbody.appendChild(tr);
        });
    } catch (error) {
        console.error("Error al cargar productos:", error);
    }
}

 cargarProductos();
  */
});

  