document.addEventListener("DOMContentLoaded", () => {

    /**
     * Funcion para selecionar cualquier elemento por su id
    */
    function $(object = null) {
        return document.querySelector(object);
      }

      const detallesContainer = $(".tabla-detalle tbody");


    const buttonAgregar = document.querySelector("#agregar-item");
    const tablaDetalles = document.querySelector(".tabla-detalle tbody");
    const opciones = [
        { value: "1", text: "Comercial" },
        { value: "2", text: "Pardo" },
        { value: "3", text: "Sucio" },
        { value: "4", text: "Doble Yema" },
        { value: "5", text: "Margarito" },
        { value: "6", text: "Merma" }
    ];
    let seleccionados = [];

    if (!buttonAgregar || !tablaDetalles) {
        console.error("No se encontró el botón o la tabla en el DOM.");
        return;
    }

    buttonAgregar.addEventListener("click", renderTabla);

    function renderTabla() {
        // Verificar si el número de filas generadas es menor que el número de opciones disponibles
        if (tablaDetalles.children.length >= opciones.length) {
            showToast("ah alcanzado el limite de opciones", "WARNING", 1500);
            return;
        }

        const tr = document.createElement("tr");

        tr.innerHTML = `
            <td class="text-center">
                <label id="stock-label" class="stock-label">0</label>
            </td>
            <td class="text-center huevo-detalle">
                <div>
                    <select name="idhuevo" id="idhuevo" class="form-select huevo-venta" required>
                        <option value="">Seleccione...</option>
                        ${opciones.map(opcion => `<option value="${opcion.value}">${opcion.text}</option>`).join('')}
                    </select>
                </div>
            </td>
            <td class="text-center">
                <input type="number" id="cantidadVenta"  minlength="0" class="form-control cantidad-venta" required>
            </td>
            <td class="text-center">
                <input type="number" id="pesoTotal" minlength="0" step="0.01" class="form-control pesoTotal-venta" required>
            </td>
            <td class="text-center">
                <input type="number" id="precioUnitario" minlength="0" step="0.01" class="form-control precioUnitario-venta" required>        
            </td>
            <td class="text-center">
                <input type="number" id="totalVenta" minlength="0" step="0.01" class="form-control totalventa-venta" disabled>
            </td>
            <td class="text-center">
                <button class="btn btn-danger btn-eliminar"><i class="fa-solid fa-trash-can"></i></button>
            </td>
        `;

        detallesContainer.appendChild(tr);

        // Añadir eventos a los nuevos inputs
        const stockLabel = tr.querySelector(".stock-label");
        const precioUnitario = tr.querySelector(".precioUnitario-venta");
        const pesoTotal = tr.querySelector(".pesoTotal-venta");
        const cantidadVenta = tr.querySelector(".cantidad-venta");
        const totalVenta = tr.querySelector(".totalventa-venta");
        const producto = tr.querySelector(".huevo-venta");

        producto.addEventListener("change", async () => {
            cantidadVenta.value = "";
            pesoTotal.value = "";
            precioUnitario.value = "";
            totalVenta.value = "";
            cantidadVenta.focus();

            const huevo = producto.value;
            if (huevo) {
                await ShowStockActual(huevo, stockLabel);
            }
        });


        pesoTotal.addEventListener("input", async () => {
        await calcularTotalVenta(tr); 
        });

        cantidadVenta.addEventListener("input", () => {
            validarCantidad(cantidadVenta, stockLabel);
          });

        precioUnitario.addEventListener("input", async () => {
        await calcularTotalVenta(tr);
        });


        // Añadir evento de eliminación al botón
        tr.querySelector(".btn-eliminar").addEventListener("click", () => {
            tablaDetalles.removeChild(tr);
            const value = tr.querySelector(".huevo-venta").value;
            seleccionados = seleccionados.filter(item => item !== value);
            actualizarOpciones();
        });

        // Añadir evento de cambio al select
        tr.querySelector(".huevo-venta").addEventListener("change", (event) => {
            const value = event.target.value;
            if (value) {
                seleccionados.push(value);
                actualizarOpciones();
            }
        });

        tablaDetalles.appendChild(tr);
        actualizarOpciones();
    }

    function actualizarOpciones() {
        const selects = document.querySelectorAll(".huevo-venta");
        selects.forEach(select => {
            const selectedValue = select.value;
            select.innerHTML = `<option value="">Seleccione...</option>`;
            opciones.forEach(opcion => {
                if (!seleccionados.includes(opcion.value) || opcion.value === selectedValue) {
                    const optionElement = document.createElement("option");
                    optionElement.value = opcion.value;
                    optionElement.text = opcion.text;
                    if (opcion.value === selectedValue) {
                        optionElement.selected = true;
                    }
                    select.appendChild(optionElement);
                }
            });
        });
    }

      // Define la función CalcularTotalVenta como asíncrona
    async function calcularTotalVenta(row) {
        const pesoTotalElement = row.querySelector(".pesoTotal-venta");
        const precioUnitarioElement = row.querySelector(".precioUnitario-venta");
        const totalVentaElement = row.querySelector(".totalventa-venta");

        if (!pesoTotalElement || !precioUnitarioElement || !totalVentaElement) {
        console.error("Uno o más elementos no existen en el DOM");
        return;
        }

        const pesoTotal = parseFloat(pesoTotalElement.value) || 0;
        const precioUnitario = parseFloat(precioUnitarioElement.value) || 0;

        console.log("pesoTotal:", pesoTotal);
        console.log("precioUnitario:", precioUnitario);

        if (pesoTotal > 0 && precioUnitario > 0) {
        const precioTotal = pesoTotal * precioUnitario;
        totalVentaElement.value = precioTotal.toFixed(2);
        console.log("precioTotal:", precioTotal);
        } else if( pesoTotal < 0 || precioUnitario < 0) {
        showToast("Los campos Peso Total o Precio Unitario deben ser mayores a 0", "WARNING", 1500);
        }
    }

    async function ShowStockActual(idhuevo, stockLabel) {
        try {
          const response = await fetch(`../../controllers/kardexAlmacenHuevo.controller.php?operacion=mostrarStockActual&idhuevo=${idhuevo}`);
          const stock = await response.json();
          const stockDividido = Math.floor(stock / 180); // División entera de 180
          stockLabel.textContent = stockDividido;
        } catch (error) {
          console.error(error);
        }
      }
      
      function validarCantidad(cantidadVenta, stockLabel) {
        const cantidad = parseInt(cantidadVenta.value) || 0;
        const stock = parseInt(stockLabel.textContent) || 0;
    
        if (cantidad > stock) {
          showToast("La cantidad ingresada no puede ser mayor al stock disponible", "WARNING", 1500);
          $("#registrar-venta").setAttribute("disabled", "disabled");
        }else{
            $("#registrar-venta").removeAttribute("disabled", "disabled");
        }
      }

});