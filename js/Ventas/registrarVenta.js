document.addEventListener("DOMContentLoaded", () => {
  /**
   * Función para seleccionar cualquier elemento por su id
   */
  function $(object = null) {
    return document.querySelector(object);
  }

  let idcliente = -1;
  let idventas = -1;
  let datosNuevos = true;

  const labelTotalVenta = document.querySelector("#total_venta");
  const labelIGV = document.querySelector("#igv_venta");
  const labelSubTotal = document.querySelector("#subtotal_venta");

  async function buscarDocumento() {
    const params = new URLSearchParams();
    params.append("operacion", "searchByDoc");
    params.append("nrodocumento", $("#nrodocumento").value);

    const response = await fetch(`../../controllers/Clientes.controller.php?${params}`);
    return response.json();
  }

  async function registrarVenta(idcliente) {
    const params = new FormData();
    params.append(
    "operacion", "add");
    params.append("idcliente", idcliente);
    params.append("idcolaborador", $("#idcolaborador").value);
    params.append("direccion", $("#direccion").value);

    const options = {
      method: "POST",
      body: params
    };
    const response = await fetch(`../../controllers/venta.controller.php`, options);
    return response.json();
  }

  async function registrarDetalleVenta(idventa) {
    const rows = document.querySelectorAll("#detalles tr");
    const params = new FormData();
    params.append("operacion", "add");
    params.append("idventa", idventa);

    rows.forEach((row, index) => {
      const idhuevo = row.querySelector(".huevo-venta")?.value || '';
      let cantidad = row.querySelector(".cantidad-venta")?.value || '';
      const pesoTotal = row.querySelector(".pesoTotal-venta")?.value || '';
      const precioUnitario = row.querySelector(".precioUnitario-venta")?.value || '';
      const precioTotal = row.querySelector(".totalventa-venta")?.value || '';

      if (idhuevo && cantidad && pesoTotal && precioUnitario && precioTotal) {

        cantidadHuevos = parseInt(cantidad) * 180; 


        params.append(`huevos[${index}][idhuevo]`, idhuevo);
        params.append(`huevos[${index}][cantidad]`, cantidadHuevos);
        params.append(`huevos[${index}][PesoTotal]`, pesoTotal);
        params.append(`huevos[${index}][precioUnitario]`, precioUnitario);
        params.append(`huevos[${index}][precioTotal]`, precioTotal);
      } else {
        console.error(`Error en la fila ${index + 1}: Datos incompletos`);
      }
    });

    const options = {
      method: "POST",
      body: params
    };

    try {
      const response = await fetch(`../../controllers/detalleVenta.controller.php`, options);
      if (!response.ok) {
        throw new Error(`Error en la solicitud: ${response.statusText}`);
      }
      const data = await response.text();
      console.log("data", data);
      return data;
    } catch (error) {
      console.error("Error al registrar el detalle de la venta:", error);
      return { error: error.message };
    }
  }

  function limpiarFormulario() {
    $("#form-Venta").reset();
    const tablaDetalles = document.querySelector(".tabla-detalle tbody");
    while (tablaDetalles.firstChild) {
      tablaDetalles.removeChild(tablaDetalles.firstChild);
    }
    $("#agregar-item").setAttribute("disabled", true);
    $("#registrar-venta").setAttribute("disabled", true);
    $("#nrodocumento").focus();
    labelIGV.textContent = "S/0.00";
    labelSubTotal.textContent = "S/0.00";
    labelTotalVenta.textContent = "S/0.00";
  }

  $("#form-Venta").addEventListener("submit", async (e) => {
    e.preventDefault();
    if (await ask("¿Seguro que quieres registrar la venta?")) {
      let responseDatos;
      let responseVenta;

      try { 
        responseDatos = await buscarDocumento();
        console.log("responseDatos", responseDatos);
        idcliente = responseDatos[0].idcliente;

        if (datosNuevos) {
          responseVenta = await registrarVenta(idcliente);
          console.log("responseVenta", responseVenta);
          idventas = responseVenta.idventa;
          console.log("IDventa", idventas);
          if (idventas != -1) {
            const data = await registrarDetalleVenta(idventas);
            console.log("IDdetalleVenta 1", data);
            if (data.error) {
              showToast("Error al registrar el detalle de la venta 2 ", "ERROR", 2000);
            }else{
              showToast("Venta registrada", "SUCCESS", 2000);
              limpiarFormulario();
            }
          } else {
            showToast("Venta no registrada", "ERROR", 2000);
          }
        }
      } catch (error) {
        console.error("Error durante el registro de la venta:", error);
        showToast("Error en el registro de la venta", "ERROR", 2000);
      }
    }
  });
});