document.addEventListener("DOMContentLoaded", () => {
    const buttonAgregar = document.querySelector("#agregar-item");
    const tablaDetalles = document.querySelector(".tabla-detalle tbody");
    const opciones = [
        { value: "1", text: "Comercial" },
        { value: "2", text: "Pardo" },
        { value: "3", text: "Sucio" },
        { value: "4", text: "Doble Yema" },
        { value: "5", text: "Merma" }
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
            <td class="text-center huevo-detalle">
                <div>
                    <select name="idhuevo" id="idhuevo" class="form-select huevo-venta" required>
                        <option value="">Seleccione...</option>
                        ${opciones.map(opcion => `<option value="${opcion.value}">${opcion.text}</option>`).join('')}
                    </select>
                </div>
            </td>
            <td class="text-center">
                <input type="number"  minlength="0" class="form-control cantidad-venta" required>
            </td>
            <td class="text-center">
                <input type="number"  minlength="0" class="form-control pesoTotal-venta" required>
            </td>
            <td class="text-center">
                <input type="number"  minlength="0" class="form-control precioUnitario-venta" required>        
            </td>
            <td class="text-center">
                <input type="number"  minlength="0" class="form-control totalventa-venta" >
            </td>
            <td class="text-center">
                <button class="btn btn-danger btn-eliminar"><i class="fa-solid fa-trash-can"></i></button>
            </td>
        `;

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
});