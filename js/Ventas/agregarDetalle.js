document.addEventListener("DOMContentLoaded", () => {
  const buttonAgregar = document.querySelector("#agregar-item");
  const tablaDetalles = document.querySelector(".tabla-detalle tbody");

  if (!buttonAgregar || !tablaDetalles) {
      console.error("No se encontró el botón o la tabla en el DOM.");
      return;
  }



  function renderTabla(){
    const tabla = document.querySelector(".tabla-detalle tbody");
    const tr = document.createElement("tr");

    tr.innerHTML += `
        <td>
            <div>
                <select name="idhuevo" id="idhuevo" class="form-select" required>
                    <option value="">Seleccione...</option>
                    <option value="1">Comercial</option>
                    <option value="2">Pardo</option>
                    <option value="3">Sucio</option>
                    <option value="4">Doble Yema</option>
                    <option value="5">Merma</option>
                </select>
            </div>
        </td>
        <td>
            <input type="number" minlength="0" class="form-control" id="cantidad" required>
        </td>
        <td>
            <input type="number" placeholder="Precio Unitario" class="cajaTexto p-inputtext p-component p-element ng-pristine ng-valid p-filled ng-touched" style="width: 100%;">
        </td>
        <td>
            <input type="number" placeholder="Total" class="cajaTexto p-inputtext p-component p-element ng-pristine ng-valid p-filled ng-touched" style="width: 100%;" readonly>
        </td>

    `;
    tabla.appendChild(tr);
  }

    buttonAgregar.addEventListener("click", () => {
        renderTabla();
    });
});