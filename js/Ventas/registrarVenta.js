document.addEventListener("DOMContentLoaded", () => {
  function $(object = null) {
    return document.querySelector(object);
  }

  let idcliente = -1;
  let idventas = -1;
  let datosNuevos = true;

  const labelTotalVenta = $("#total_venta");
  const labelIGV = $("#igv_venta");
  const labelSubTotal = $("#subtotal_venta");

  async function buscarDocumento() {
    const nrodocumento = $("#nrodocumento").value.trim();
    if (!nrodocumento) throw new Error('Número de documento requerido');

    const params = new URLSearchParams();
    params.append("operacion", "searchByDoc");
    params.append("nrodocumento", nrodocumento);

    const response = await fetch(`../../controllers/Clientes.controller.php?${params}`);
    const data = await response.json();
    if (!data || !data.length) throw new Error('Cliente no encontrado');
    return data;
  }

  async function registrarVenta(idcliente) {
    if (!idcliente || idcliente === -1) throw new Error('Cliente no válido');

    const idcolaborador = $("#idcolaborador").value;
    if (!idcolaborador) throw new Error('Colaborador requerido');

    const params = new FormData();
    params.append("operacion", "add");
    params.append("idcliente", idcliente);
    params.append("idcolaborador", idcolaborador);

    const response = await fetch(`../../controllers/venta.controller.php`, {
      method: "POST",
      body: params
    });

    const data = await response.json();
    if (!data || !data.idventa) throw new Error('Error al registrar venta');
    return data;
  }

  async function registrarDetalleVenta(idventas) {
    if (!idventas) throw new Error('ID venta requerido');
    
    const rows = document.querySelectorAll("#detalles tr");
    if (!rows.length) throw new Error('No hay detalles para registrar');

    const params = new FormData();
    params.append("operacion", "add");
    params.append("idventa", idventas);

    const huevos = [];
    
    // Collect data from rows
    rows.forEach((row) => {
        const idhuevo = row.querySelector(".huevo-venta").value;
        const unidadMedida = row.querySelector(".unidadMedida-venta").value;
        const cantidad = row.querySelector(".cantidad-venta").value;
        const precioKg = row.querySelector(".precioKg-venta").value;

        if (!idhuevo || !cantidad || !unidadMedida || !precioKg) {
            throw new Error('Todos los campos son requeridos');
        }

        const cantidadNum = parseFloat(cantidad);
        const precioKgNum = parseFloat(precioKg);

        if (isNaN(cantidadNum) || isNaN(precioKgNum)) {
            throw new Error('Cantidad y precio deben ser números válidos');
        }

        huevos.push({
            idhuevo: idhuevo,
            cantidad: cantidadNum * 180,
            unidadMedida: unidadMedida,
            precioVenta: precioKgNum
        });
    });

    // Add huevos array to FormData
    huevos.forEach((huevo, index) => {
        Object.entries(huevo).forEach(([key, value]) => {
            params.append(`huevos[${index}][${key}]`, value);
        });
    });

    console.log('Datos a enviar:', huevos);

    try {
        const response = await fetch('../../controllers/detalleVenta.controller.php', {
            method: 'POST',
            body: params
        });

        if (!response.ok) {
            throw new Error(`Error HTTP: ${response.status}`);
        }

        const data = await response.json();
        if (data.error) {
            throw new Error(data.error);
        }
        
        console.log('Respuesta:', data);
        return data;

    } catch (error) {
        console.error('Error al registrar detalle:', error);
        throw error;
    }
  }

  function limpiarFormulario() {
    $("#form-Venta").reset();
    const tablaDetalles = $(".tabla-detalle tbody");
    while (tablaDetalles?.firstChild) {
      tablaDetalles.removeChild(tablaDetalles.firstChild);
    }
    $("#agregar-item")?.setAttribute("disabled", true);
    $("#registrar-venta")?.setAttribute("disabled", true);
    $("#nrodocumento")?.focus();
    labelIGV.textContent = "S/0.00";
    labelSubTotal.textContent = "S/0.00";
    labelTotalVenta.textContent = "S/0.00";
  }

  $("#form-Venta")?.addEventListener("submit", async (e) => {
    e.preventDefault();
    
    try {
      if (!await ask("¿Seguro que quieres registrar la venta?")) return;

      const responseDatos = await buscarDocumento();
      console.log("responseDatos:", responseDatos);
      
      idcliente = responseDatos[0].idcliente;
      if (!datosNuevos) return;

      const responseVenta = await registrarVenta(idcliente);
      console.log("responseVenta:", responseVenta);
      
      idventas = responseVenta.idventa;
      if (idventas === -1) throw new Error('ID venta no válido');

      const data = await registrarDetalleVenta(idventas);
      console.log("Respuesta detalle venta:", data);

      showToast("Venta registrada exitosamente", "SUCCESS", 2000);
      limpiarFormulario();

    } catch (error) {
      console.error("Error:", error);
      showToast(error.message || "Error en el registro", "ERROR", 2000);
    }
  });
});