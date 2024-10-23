document.addEventListener("DOMContentLoaded", () => {
  const buttonAgregar = document.querySelector("#agregar-item");
  const tablaDetalles = document.querySelector(".tabla-detalle tbody");

  if (!buttonAgregar || !tablaDetalles) {
      console.error("No se encontró el botón o la tabla en el DOM.");
      return;
  }

  buttonAgregar.addEventListener("click", () => {
      const nuevaFila = document.createElement("tr");

      const columnas = ["Producto", "Cantidad", "Precio Unitario", "Total"];
      columnas.forEach(columna => {
          const nuevaCelda = document.createElement("td");
          const input = document.createElement("input");
          input.setAttribute("type", "text");
          input.setAttribute("placeholder", columna);
          input.classList.add("p-inputtext", "p-component", "p-element", "ng-pristine", "ng-valid", "p-filled", "ng-touched");
          input.style.width = "100%";
          nuevaCelda.appendChild(input);
          nuevaFila.appendChild(nuevaCelda);
      });

      tablaDetalles.appendChild(nuevaFila);
  });
});