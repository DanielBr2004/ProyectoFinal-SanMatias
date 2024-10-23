document.addEventListener("DOMContentLoaded", () => {
  const buttonAgregar = document.querySelector("#agregar-item");
  const tablaDetalles = document.querySelector(".tabla-detalle tbody");

  if (!buttonAgregar || !tablaDetalles) {
      console.error("No se encontró el botón o la tabla en el DOM.");
      return;
  }

    buttonAgregar.addEventListener("click", () => {
        const nuevaFila = document.createElement("tr");

        // Definir las columnas y sus propiedades
        const columnas = [
            { placeholder: "Producto", type: "text", value: "" },
            { placeholder: "Cantidad", type: "number", value: "1" },
            { placeholder: "Precio Unitario", type: "number", value: "0.00" },
            { placeholder: "Total", type: "number", value: "0.00", readOnly: true }
        ];

        columnas.forEach(columna => {
            const nuevaCelda = document.createElement("td");
            const input = document.createElement("input");
            input.setAttribute("type", columna.type);
            input.setAttribute("placeholder", columna.placeholder);
            input.setAttribute("value", columna.value);
            input.classList.add("cajaTexto", "p-inputtext", "p-component", "p-element", "ng-pristine", "ng-valid", "p-filled", "ng-touched");
            input.style.width = "100%";

            // Si el input es de solo lectura, añadir el atributo correspondiente
            if (columna.readOnly) {
                input.setAttribute("readonly", true);
            }

            nuevaCelda.appendChild(input);
            nuevaFila.appendChild(nuevaCelda);
        });

        tablaDetalles.appendChild(nuevaFila);
    });
});