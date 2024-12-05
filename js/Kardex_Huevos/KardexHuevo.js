document.addEventListener("DOMContentLoaded", () => {

  const idhuevo = document.querySelector("#idhuevo");
  const StockActual = document.querySelector("#stockProducto");
  const CantidadEntrada = document.querySelector("#cantidad");
  const Motivomovimiento = document.querySelector("#Motivomovimiento");
  const tablaKardexHuevos = document.querySelector("#tbody-productos");
  const numLote = document.querySelector("#numLote");

  let prodregistrada = false;

  idhuevo.addEventListener("change", () => {
    const huevo = idhuevo.value;
    if (huevo) {
      ShowStockActual(huevo);
    }
  });

  numLote.addEventListener("change", async () => {
    const idlote = numLote.value;
    const idhuevoValue = idhuevo.value;
    await ValidacionRegistro(idhuevoValue, idlote);
  });

  idhuevo.addEventListener("change", async () => {
    const idlote = numLote.value;
    const idhuevoValue = idhuevo.value;
    await ValidacionRegistro(idhuevoValue, idlote);
  });

  async function ShowStockActual(idhuevo) {
    try {
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=mostrarStockActual&idhuevo=${idhuevo}`);
      const Stock = await response.json();
      StockActual.value = Stock;
    } catch (error) {
      console.error(error);
    }
  }

  async function ExisteProduccionRegistrada(idlote) {
    try {
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=HasProduccion&idlote=${idlote}`);
      const data = await response.json();
      if (data.length === 0) {
        showToast("Falta Registrar producción", "INFO", 3000);
        document.querySelector("#registrar-colaborador").setAttribute("disabled", true);
        prodregistrada = false;
        return false;
      } else {
        prodregistrada = true;
        return true;
      }
    } catch (error) {
      console.error(error);
      return false;
    }
  }

  async function HuevoRegistrado(idhuevo, idlote) {
    try {
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=huevoRegistrado&idhuevo=${idhuevo}&idlote=${idlote}`);
      const data = await response.json();
      if (data.length > 0) {
        showToast("El tipo de Huevo ya se registró en la producción del día", "INFO", 3000);
        document.querySelector("#registrar-colaborador").setAttribute("disabled", true);
      } else {
        document.querySelector("#registrar-colaborador").removeAttribute("disabled");
      }
    } catch (error) {
      console.error(error);
    }
  }

  async function ValidacionRegistro(idhuevo, idlote) {
    if (idlote && idhuevo) {
      const produccionExiste = await ExisteProduccionRegistrada(idlote);
      if (produccionExiste) {
        await HuevoRegistrado(idhuevo, idlote);
      }
    }
  }

  if (idhuevo.value) {
    ShowStockActual(idhuevo.value);
  }

  if (numLote.value) {
    ExisteProduccionRegistrada(numLote.value);
  }

  if (idhuevo.value && numLote.value) {
    HuevoRegistrado(idhuevo.value, numLote.value);
  }

  (() => {
    fetch(`../../controllers/numlote.controller.php?operacion=getAll`)
      .then(response => response.json())
      .then(data => {
        const numlote = document.querySelector("#numLote");
        data.forEach(row => {
          const tagOption = document.createElement("option");
          tagOption.value = row.idlote;
          tagOption.innerHTML = `Lote N° ${row.numLote}`;
          numlote.appendChild(tagOption);
        });
      })
      .catch(e => { console.error(e) });
  })();

  function ValidarCantidadSalida() {
    if (Motivomovimiento.value === 'S') {
      if (parseInt(CantidadEntrada.value) > parseInt(StockActual.value)) {
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

  function GuardarKardex() {
    const itemselecionado = document.getElementById('Motivomovimiento');
    const valueitem = itemselecionado.selectedIndex;
    const motivoselecionado = itemselecionado.options[valueitem].text;

    // Get description based on movement type
    let descripcion = document.querySelector("#mermaInput").value;
    
    // Set default descriptions for specific movement types
    if (motivoselecionado === 'Entrada por Producción') {
        descripcion = 'Ingreso de producción del día';
    } else if (motivoselecionado === 'Entrada por Compra') {
        descripcion = 'Ingreso por compra de huevos';
    } else if (motivoselecionado === 'Salida por Merma') {
        descripcion = 'Salida por merma de huevos';
    }

    const params = new FormData();
    params.append("operacion", "add");
    params.append("idcolaborador", document.querySelector("#idcolaborador").value);
    params.append("idhuevo", document.querySelector("#idhuevo").value);
    params.append("tipomovimiento", document.querySelector("#Motivomovimiento").value);
    params.append("motivomovimiento", motivoselecionado);
    params.append("idlote", document.querySelector("#numLote").value);
    params.append("cantidad", document.querySelector("#cantidad").value);
    params.append("descripcion", descripcion);

    const options = {
        method: 'POST',
        body: params
    };

    fetch(`../../controllers/kardexAlmacenHuevo.controller.php`, options)
        .then(response => response.json())
        .then(data => {
            document.querySelector("#form-kardex-huevos").reset();
            showToast("Datos Guardados Correctamente", "SUCCESS", 3000);
            obtenerStocksProductos();
            actualizarTablaKardex();
        })
        .catch(e => { console.error(e) });
}

  document.querySelector("#form-kardex-huevos").addEventListener("submit", async (event) => {
    event.preventDefault();

    const ValorIngresado = parseInt(CantidadEntrada.value);

    if (ValorIngresado < 0) {
      showToast("La cantidad no puede ser negativa", "ERROR", 3000);
    } else {
      if (!ValidarCantidadSalida()) {
        return;
      }

      if (await ask("Estas Registrando aprox " + (Math.floor(CantidadEntrada.value / 180)) + " Paquetes, ¿Deseas Confirmar?")) {
        GuardarKardex();
        actualizarTablaKardex();
      }
    }
  });

  Motivomovimiento.addEventListener('change', function () {
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

  async function obtenerStocksProductos() {
    const productos = [
      { id: "1", inputId: "hcomercial" },
      { id: "2", inputId: "hpardo" },
      { id: "3", inputId: "hsucio" },
      { id: "4", inputId: "hdobleyema" },
      { id: "5", inputId: "hmargarito" }
    ];

    for (const producto of productos) {
      try {
        const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=mostrarStockActual&idhuevo=${producto.id}`);
        const stock = await response.json();
        let stockDividido;
        if (producto.inputId === "hdobleyema") {
          stockDividido = Math.floor(stock / 90);
        } else {
          stockDividido = Math.floor(stock / 180);
        }
        document.getElementById(producto.inputId).value = `${stockDividido} Paquetes`;
      } catch (error) {
        console.error(`Error al obtener el stock del producto ${producto.id}:`, error);
      }
    }
  }

  async function actualizarTablaKardex() {
    try {
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=listar`);
      const data = await response.json();
      const tbody = document.querySelector("#tbody-productos");
      tbody.innerHTML = ""; // Limpiar la tabla

      data.forEach(item => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td>${item.idhuevo}</td>
          <td>${item.descripcion}</td>
          <td>${item.cantidad}</td>
          <td>${item.fecha}</td>
        `;
        tbody.appendChild(tr);
      });
    } catch (error) {
      console.error("Error al actualizar la tabla de Kardex:", error);
    }
  }

  obtenerStocksProductos();
});
