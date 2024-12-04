// Función para simplificar el uso de querySelector
function $$(selector = null) {
    return document.querySelector(selector);
  }
  
  // Función para mostrar mensajes de alerta con SweetAlert2
  function showToast(message, type, timer = 3000) {
    Swal.fire({
      toast: true,
      position: 'top-end',
      icon: type.toLowerCase(), // Tipo: 'success', 'error', 'warning', etc.
      title: message,
      showConfirmButton: false,
      timer: timer,
    });
  }
  
  // Inicialización del DataTable
  let dataTable;
  let dataTableIsInitialized = false;
  
  const dataTableOptions = {
    dom: 'Bfrtip',
    buttons: [
      {
        extend: 'excelHtml5',
        text: '<i class="fas fa-file-excel"></i>',
        titleAttr: 'Exportar a Excel',
        className: 'btn btn-success',
        exportOptions: {
          columns: [0, 1, 2, 3],
        }
      },
      {
        extend: 'pdfHtml5',
        text: '<i class="fas fa-file-pdf"></i>',
        titleAttr: 'Exportar a PDF',
        className: 'btn btn-danger',
        exportOptions: {
          columns: [0, 1, 2, 3],
        }
      },
      {
        extend: 'print',
        text: '<i class="fa fa-print"></i>',
        titleAttr: 'Imprimir',
        className: 'btn btn-info',
        exportOptions: {
          columns: [0, 1, 2, 3],
        }
      },
    ],
    lengthMenu: [5, 10, 15, 20],
    columnDefs: [
      { className: 'text-center', targets: '_all' },
      { orderable: false, targets: [4] },
    ],
    pageLength: 5,
    destroy: true,
    language: {
      processing: 'Procesando...',
      lengthMenu: 'Mostrar _MENU_ registros',
      zeroRecords: 'No se encontraron resultados',
      emptyTable: 'Ningún dato disponible en esta tabla',
      info: 'Mostrando _START_ a _END_ de _TOTAL_ registros',
      infoEmpty: 'Mostrando registros del 0 al 0 de un total de 0 registros',
      infoFiltered: '(filtrado de un total de _MAX_ registros)',
      search: 'Buscar:',
      paginate: {
        first: 'Primero',
        last: 'Último',
        next: 'Siguiente',
        previous: 'Anterior',
      },
    },
  };
  
  // Función para inicializar DataTable
  const initDataTable = async () => {
    if (dataTableIsInitialized) {
      dataTable.destroy(); // Destruye la tabla para inicializarla nuevamente
    }
  
    await listarTiposHuevos();
  
    dataTable = $('#tabla-tiposHuevos').DataTable(dataTableOptions);
    dataTableIsInitialized = true;
  };
  
  // Función global para listar tipos de huevos en la tabla
  window.listarTiposHuevos = async function () {
    try {
      const response = await fetch('../../../controllers/tipohuevo.controller.php?operacion=getAllTiposHuevos');
      const data = await response.json();
  
      let content = '';
      data.forEach((item, index) => {
        content += `
          <tr data-id="${item.idhuevo}">
            <td class="text-center">${index + 1}</td>
            <td class="text-center">${item.tiposHuevos}</td>
            <td class="text-center">${parseFloat(item.PrecioKg).toFixed(2)}</td>
            <td class="text-center">${item.descripcion}</td>
            <td class="text-center">
              <button class="btn btn-warning btn-sm" onclick="editarTipoHuevo(${item.idhuevo})">
                <i class="fa-solid fa-pen-to-square"></i>
              </button>
              <button class="btn btn-danger btn-sm" onclick="eliminarTipoHuevo(${item.idhuevo})">
                <i class="fa-solid fa-trash-can"></i>
              </button>
            </td>
          </tr>`;
      });
  
      const tbodyElement = document.getElementById('tabla-huevos');
      if (tbodyElement) {
        tbodyElement.innerHTML = content;
      } else {
        console.error("El elemento con ID 'tabla-huevos' no se encontró en el DOM.");
      }
    } catch (error) {
      console.error('Error al cargar los tipos de huevos:', error);
    }
  };
  
// Función para eliminar un tipo de huevo
window.eliminarTipoHuevo = async function (idhuevo) {
  // Primer paso: confirmación inicial
  Swal.fire({
    title: '¿Estás seguro de que deseas eliminar este tipo de huevo?',
    text: "¡Esta acción no se puede deshacer!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#d33',
    cancelButtonColor: '#3085d6',
    confirmButtonText: 'Eliminar',
    cancelButtonText: 'Cancelar'
  }).then(async (result) => {
    // Si el usuario acepta eliminar
    if (result.isConfirmed) {
      try {
        const params = new FormData();
        params.append('operacion', 'eliminar');
        params.append('idhuevo', idhuevo);

        const options = {
          method: 'POST',
          body: params,
        };

        const response = await fetch('../../../controllers/tipohuevo.controller.php', options);
        const result = await response.json();

        // Segundo paso: Confirmación de eliminación exitosa
        if (result.status === 'success') {
          showToast('Tipo de huevo eliminado correctamente.', 'SUCCESS');
          initDataTable(); // Refresca la tabla con DataTable
        } else {
          showToast('Error al eliminar el tipo de huevo.', 'ERROR');
        }
      } catch (error) {
        console.error('Error al eliminar el tipo de huevo:', error);
      }
    } else {
      // Tercer paso: Si el usuario cancela
      showToast('La eliminación ha sido cancelada.', 'INFO');
    }
  });
};
  
  // Función para mostrar el modal y cargar los datos en él
  window.editarTipoHuevo = async function (idhuevo) {
    try {
      const response = await fetch('../../../controllers/tipohuevo.controller.php?operacion=getAllTiposHuevos');
      const productos = await response.json();
      const producto = productos.find((prod) => prod.idhuevo === idhuevo);
  
      if (producto) {
        // Llenamos los campos del modal con los datos del producto
        $$('#idhuevo-editar').value = producto.idhuevo;
        $$('#huevo-editar').value = producto.tiposHuevos;
        $$('#precio-editar').value = producto.PrecioKg;
        $$('#descripcion-editar').value = producto.descripcion;
  
        // Mostrar el modal
        const modal = new bootstrap.Modal($$('#modalEditarHuevo'));
        modal.show();
      } else {
        showToast('Error al cargar los datos del producto.', 'ERROR');
      }
    } catch (error) {
      console.error('Error al cargar los datos para editar:', error);
    }
  };
  
  // Manejar el formulario de edición
// Manejar el formulario de edición
document.querySelector('#form-editar-huevo').addEventListener('submit', async (event) => {
    event.preventDefault();

    // Mostrar mensaje de confirmación
    Swal.fire({
        title: '¿Estás seguro?',
        text: '¿Deseas guardar los cambios realizados?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then(async (result) => {
        // Si el usuario confirma
        if (result.isConfirmed) {
            try {
                const idhuevo = $$('#idhuevo-editar').value;

                const params = new FormData();
                params.append('operacion', 'editar');
                params.append('idhuevo', idhuevo);
                params.append('tiposHuevos', $$('#huevo-editar').value);
                params.append('PrecioKg', $$('#precio-editar').value);
                params.append('descripcion', $$('#descripcion-editar').value);

                const options = {
                    method: 'POST',
                    body: params,
                };

                const response = await fetch('../../../controllers/tipohuevo.controller.php', options);
                const result = await response.json();

                if (result.status === 'success') {
                    showToast('Se ha Guardado Correctamente.', 'SUCCESS',1000);
                    await initDataTable(); // Refresca la tabla con DataTable
                    const modal = bootstrap.Modal.getInstance($$('#modalEditarHuevo'));
                    if (modal) modal.hide();
                } else {
                    showToast(result.message || 'Error al editar el tipo de huevo.', 'error');
                }
            } catch (error) {
                console.error('Error al editar el tipo de huevo:', error);
            }
        } else {
            showToast('Cambios cancelados.', 'info'); // Mensaje si cancela
        }
    });
});
  // Inicialización del DataTable y listado de datos al cargar la página
  document.addEventListener('DOMContentLoaded', async function () {
    await initDataTable();
  });
  