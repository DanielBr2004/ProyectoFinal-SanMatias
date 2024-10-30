
document.addEventListener("DOMContentLoaded", () => {
  /**
   * Función para seleccionar cualquier elemento por su id
   */

  function $(object = null) {
    return document.querySelector(object);
  }

  function eliminarOpcionesGeneradas() {
    const filas = document.querySelectorAll("#detalles");
    filas.forEach(fila => fila.remove());
  }

  let idcliente = -1;
  let idventas = -1;
  let datosNuevos = true;

  async function buscarDocumento() {
    const params = new URLSearchParams();
    params.append("operacion", "searchByDoc");
    params.append("nrodocumento", $("#nrodocumento").value);

    const response = await fetch(`../../controllers/Clientes.controller.php?${params}`);
    return response.json();
  }

  async function registrarVenta(idcliente) {
    const params = new FormData();
    params.append("operacion", "add");
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
      const cantidad = row.querySelector(".cantidad-venta")?.value || '';
      const pesoTotal = row.querySelector(".pesoTotal-venta")?.value || '';
      const precioUnitario = row.querySelector(".precioUnitario-venta")?.value || '';
      const precioTotal = row.querySelector(".totalventa-venta")?.value || '';

      if (idhuevo && cantidad && pesoTotal && precioUnitario && precioTotal) {
        params.append(`huevos[${index}][idhuevo]`, idhuevo);
        params.append(`huevos[${index}][cantidad]`, cantidad);
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
            if(data.length > 0){
              showToast("Venta registrada", "SUCCESS", 2000);
              $("#form-Venta").reset();
              eliminarOpcionesGeneradas();
              $("#agregar-item").setAttribute("disabled", "disabled");
              $("#registrar-venta").setAttribute("disabled", "disabled");
            }else{
              showToast("Venta no registrada", "ERROR", 2000);
              
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