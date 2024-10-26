document.addEventListener("DOMContentLoaded", () => {

  const idhuevo = document.querySelector("#idhuevo");
  const StockActual = document.querySelector("#stockProducto");
  const CantidadEntrada = document.querySelector("#cantidad");
  const Motivomovimiento = document.querySelector("#Motivomovimiento");
  const tablaKardexHuevos = document.querySelector("#tbody-productos");

  idhuevo.addEventListener("change", () => {
    const huevo = idhuevo.value;
    if (huevo) {
      ShowStockActual(huevo);
    }
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

  if (idhuevo.value) {
    ShowStockActual(idhuevo.value);
  }

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

    const params = new FormData();
    params.append("operacion", "add");
    params.append("idcolaborador", document.querySelector("#idcolaborador").value);
    params.append("idhuevo", document.querySelector("#idhuevo").value);
    params.append("tipomovimiento", document.querySelector("#Motivomovimiento").value);
    params.append("motivomovimiento", motivoselecionado);
    params.append("cantidad", document.querySelector("#cantidad").value);
    params.append("descripcion", document.querySelector("#mermaInput").value);

    const options = {
      method: 'POST',
      body: params
    };

    fetch(`../../controllers/kardexAlmacenHuevo.controller.php`, options)
      .then(response => response.json())
      .then(data => {
        document.querySelector("#form-kardex-huevos").reset();
        showToast("Datos Guardados Correctamente", "SUCCESS", 3000);
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

      const result = await Swal.fire({
        title: "Deseas Guardar los cambios",
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: "Guardar",
        denyButtonText: `No guardar`
      });

      if (result.isConfirmed) {
        GuardarKardex();
        Swal.fire("Guardado", "", "success");
      } else if (result.isDenied) {
        Swal.fire("Cancelado", "", "error");
        document.querySelector("#form-kardex-huevos").reset();
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

  async function obtenerKardexHuevos() {
    try {
      const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=getAlls`);
      const kardexHuevos = await response.json();
      console.log("Datos recibidos:", kardexHuevos);
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
});
