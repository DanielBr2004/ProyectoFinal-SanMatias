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
    const labelTotalVenta = document.querySelector("#total_venta");
    const labelIGV = document.querySelector("#igv_venta");
    const labelSubTotal = document.querySelector("#subtotal_venta");
    let opciones = [];
    let seleccionados = [];

    if (!buttonAgregar || !tablaDetalles) {
        console.error("No se encontró el botón o la tabla en el DOM.");
        return;
    }

    // First modify cargarOpciones to validate data
    async function cargarOpciones() {
        try {
            const response = await fetch('../../controllers/tipohuevo.controller.php?operacion=getTiposHuevos');
            const data = await response.json();
            
            // Validate data structure
            if (!Array.isArray(data)) {
                console.error('Los datos recibidos no son un array:', data);
                return [];
            }

            // Validate each item has required properties
            opciones = data.filter(item => {
                const isValid = item && typeof item === 'object' && 'idhuevo' in item && 'tiposhuevos' in item;
                if (!isValid) {
                    console.warn('Elemento inválido:', item);
                }
                return isValid;
            });

            console.log('Opciones cargadas:', opciones);
        } catch (error) {
            console.error('Error al cargar las opciones:', error);
        }
    }

    // Llamar a la función cargarOpciones al cargar la página
    cargarOpciones().then(() => {
        buttonAgregar.addEventListener("click", renderTabla);
    });

    function renderTabla() {
        // Verificar si el número de filas generadas es menor que el número de opciones disponibles
        if (tablaDetalles.children.length >= opciones.length) {
            showToast("Ha alcanzado el límite de opciones", "WARNING", 1500);
            return;
        }

        const tr = document.createElement("tr");

        tr.innerHTML = `
            <td class="text-center">
                <div>
                    <select name="unidadMedida" id="unidadMedida" class="form-select unidadMedida-venta" required>
                        <option value="">Seleccione...</option>
                        <option value="Kg">Kilogramos</option>
                        <option value="Pq">Paquetes</option>
                    </select>
                </div>
            </td>
            <td class="text-center">
                <label id="stock-label" class="stock-label">0</label>
            </td>
            <td class="text-center huevo-detalle">
                <div>
                    <select name="idhuevo" id="idhuevo" class="form-select huevo-venta" required>
                        <option value="">Seleccione...</option>
                    </select>
                </div>
            </td>
            <td class="text-center">
                <input type="number" id="cantidadVenta" minlength="0" class="form-control cantidad-venta" required>
            </td>
            <td class="text-center">
                <input type="number" id="pesoTotal" minlength="0" step="0.01" class="form-control pesoTotal-venta" required>
            </td>
            <td class="text-center">
                <input type="number" id="precioKg" minlength="0" step="0.01" class="form-control precioKg-venta" required>        
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
        const precioUnitario = tr.querySelector(".precioKg-venta");
        const pesoTotal = tr.querySelector(".pesoTotal-venta");
        const cantidadVenta = tr.querySelector(".cantidad-venta");
        const totalVenta = tr.querySelector(".totalventa-venta");
        const producto = tr.querySelector(".huevo-venta");
        console.log('producto:', producto);

        // First verify opciones has data
        console.log('opciones:', opciones);

        // Then modify the options creation
        opciones.forEach(opcion => {
            const optionElement = document.createElement("option");
            optionElement.value = opcion?.idhuevo || '';
            optionElement.text = opcion?.tiposhuevos || 'Sin nombre';
            producto.appendChild(optionElement);
            console.log('opcion:', optionElement);
        });
        
        producto.addEventListener("change", async () => {
            const huevo = producto.value;
            if (huevo) {
                await ShowStockActual(huevo, stockLabel);
                
                // Encontrar la opción seleccionada
                const opcionSeleccionada = opciones.find(op => op.idhuevo == huevo);
                
                // Establecer el precio unitario si existe
                if (opcionSeleccionada && opcionSeleccionada.PrecioKg) {
                    precioUnitario.value = opcionSeleccionada.PrecioKg;
                }
            }
            
            // Limpiar campos
            cantidadVenta.value = "";
            pesoTotal.value = "";
            totalVenta.value = "";
            cantidadVenta.focus();
        });

        pesoTotal.addEventListener("input", async () => {
            await calcularTotalVenta(tr); 
            actualizarTotalVenta();
        });

        cantidadVenta.addEventListener("input", () => {
            validarCantidad(cantidadVenta, stockLabel);
        });

        precioUnitario.addEventListener("input", async () => {
            await calcularTotalVenta(tr);
            actualizarTotalVenta();
        });

        // Añadir evento de eliminación al botón
        tr.querySelector(".btn-eliminar").addEventListener("click", () => {
            tablaDetalles.removeChild(tr);
            const value = tr.querySelector(".huevo-venta").value;
            seleccionados = seleccionados.filter(item => item !== value);
            actualizarOpciones();
            actualizarTotalVenta();
        });

        tablaDetalles.appendChild(tr);
        actualizarOpciones();
        actualizarTotalVenta();
    }

    function actualizarOpciones() {
        const selectores = document.querySelectorAll(".huevo-venta");
        
        // Obtener valores seleccionados actuales
        seleccionados = Array.from(selectores)
            .map(select => select.value)
            .filter(value => value !== "");

        selectores.forEach(selector => {
            const valorSeleccionado = selector.value;
            selector.innerHTML = `<option value="">Seleccione...</option>`;
            
            opciones.forEach(opcion => {
                // Debug para ver la estructura exacta de cada opción
                console.log('Opción:', opcion);
                
                const elementoOpcion = document.createElement("option");
                // Convertir a string para comparación segura
                elementoOpcion.value = String(opcion.idhuevo);
                elementoOpcion.textContent = opcion.tiposhuevos || opcion.tiposHuevos;
                
                // Deshabilitar solo si está seleccionado en otro select
                const estaSeleccionadoEnOtro = seleccionados.includes(String(opcion.idhuevo)) && 
                                             String(opcion.idhuevo) !== valorSeleccionado;
                
                elementoOpcion.disabled = estaSeleccionadoEnOtro;
                elementoOpcion.selected = String(opcion.idhuevo) === valorSeleccionado;
                
                selector.appendChild(elementoOpcion);
            });
        });
    }

    // Define la función calcularTotalVenta como asíncrona
    async function calcularTotalVenta(row) {
        const pesoTotalElement = row.querySelector(".pesoTotal-venta");
        const precioUnitarioElement = row.querySelector(".precioKg-venta");
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
        } else if (pesoTotal < 0 || precioUnitario < 0) {
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
        } else {
            $("#registrar-venta").removeAttribute("disabled", "disabled");
        }
    }

    function actualizarTotalVenta() {
        const totalVentas = document.querySelectorAll(".totalventa-venta");
        let total = 0;
        let subtotal = 0;
        let igv = 0;

        totalVentas.forEach((input) => {
            total += parseFloat(input.value) || 0;
        });

        igv = total * 0.18;
        subtotal = total - igv;

        labelIGV.textContent = `S/${(total * 0.18).toFixed(2)}`;
        labelSubTotal.textContent = `S/${(subtotal).toFixed(2)}`;
        labelTotalVenta.textContent = `S/${total.toFixed(2)}`;
    }

    // Llamar a la función para actualizar el total de ventas al cargar la página
    actualizarTotalVenta();

});