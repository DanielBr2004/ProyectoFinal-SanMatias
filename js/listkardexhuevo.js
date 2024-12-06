window.generarPDF = async function(idAlmacenHuevos) {
    window.open('../../views/InventarioAlmacen/reporte.php?idAlmacenHuevos=' + idAlmacenHuevos, '_blank');
};

document.addEventListener('DOMContentLoaded', async function() {
  let dataTable;
  let dataTableIsInitialized = false;

  const dataTableOptions = {
    dom: 'Bfrtilp',
    buttons: [
        {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i>',
            titleAttr: 'Exportar a Excel',
            className: 'btn btn-success',
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6, 7] // Only include first 8 columns
            },
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i>',
            titleAttr: 'Exportar a PDF',
            download: 'open',
            className: 'btn btn-danger',
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6, 7] // Only include first 8 columns
            },
        },
        {
            extend: 'print',
            text: '<i class="fa fa-print"></i>',
            titleAttr: 'Imprimir',
            className: 'btn btn-info',
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6, 7] // Only include first 8 columns
            },
        },
    ],
    lengthMenu: [5, 10, 15, 20, 100, 200, 500],
    columnDefs: [
        { className: 'text-center', targets: '_all' },
        { orderable: false, targets: [2] },
        { searchable: false, targets: [1] },
        { width: '20%', targets: [1] },
        { orderable: true, targets: [8] } // Added configuration for the new date column
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
        buttons: {
            excel: 'Excel',
            pdf: 'PDF',
            print: 'Imprimir',
        },
    },
};

const cargarlist = async () => {
    try {
        const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php?operacion=getAlls');
        const data = await response.json();

        // Sort data by idAlmacenHuevos to find the latest record
        const sortedData = [...data].sort((a, b) => b.idAlmacenHuevos - a.idAlmacenHuevos);
        const latestId = sortedData[0]?.idAlmacenHuevos;

        let content = '';
        data.forEach(item => {
            // Only show edit/delete buttons for the latest record
            const showControls = item.idAlmacenHuevos === latestId;
            
            content += `
            <tr>
                <td class="text-center">${item.idAlmacenHuevos}</td>
                <td class="text-center">${item.nombre_colaborador}</td>
                <td class="text-center">${item.tipo_huevo}</td>
                <td class="text-center">${item.motivomovimiento}</td>
                <td class="text-center">${item.stockProducto}</td>
                <td class="text-center">${item.cantidad}</td>
                <td class="text-center">${item.descripcion}</td>
                <td class="text-center">${item.num_lote}</td>
                <td class="text-center">${item.fecha_creacion}</td>
                <td class="text-center">
                    <div style="display: inline-flex; gap: 5px;">
                        ${showControls ? `
                            <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${item.idAlmacenHuevos}, '${item.motivomovimiento}', ${item.cantidad}, '${item.descripcion}', '${item.num_lote}')">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="eliminarKardex(${item.idAlmacenHuevos})">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        ` : ''}
                    </div>
                </td>
                <td class="text-center">
                    <button class="btn btn-primary btn-sm" onclick="generarPDF(${item.idAlmacenHuevos})">
                        <i class="fa-solid fa-file-pdf"></i>
                    </button>
                </td>              
            </tr>`;
        });

        const tbodyElement = document.getElementById('tbody-listproductos');
        if (tbodyElement) {
            tbodyElement.innerHTML = content;
        } else {
            console.error("El elemento con ID 'tbody-listproductos' no se encontró en el DOM.");
        }
    } catch (error) {
        console.error('Error al cargar los productos:', error);
    }
};

  window.abrirModalEditar = function(idAlmacenHuevos, motivomovimiento, cantidad, descripcion, num_lote) {
    console.log("Abriendo modal con:", idAlmacenHuevos, motivomovimiento, cantidad, descripcion, num_lote);
    
    // Asignar valores a los campos del modal
    document.getElementById('editIdAlmacenHuevos').value = idAlmacenHuevos;
    document.getElementById('editMotivomovimiento').value = motivomovimiento;
    document.getElementById('editCantidad').value = cantidad;
    document.getElementById('editDescripcion').value = descripcion;
    document.getElementById('editNumLote').value = num_lote;

    $('#editarModal').modal('show');
};

document.getElementById('formEditarKardex').addEventListener('submit', async function(event) {
    event.preventDefault();

    const idAlmacenHuevos = document.getElementById('editIdAlmacenHuevos').value;
    const motivomovimiento = document.getElementById('editMotivomovimiento').value;
    const cantidad = document.getElementById('editCantidad').value;
    const descripcion = document.getElementById('editDescripcion').value;
    const num_lote = document.getElementById('editNumLote').value; // Obtener el Nº Lote

    // Confirmación con SweetAlert2
    Swal.fire({
        title: '¿Estás seguro?',
        text: "¿Deseas guardar los cambios realizados al Kardex?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then(async (result) => {
        if (result.isConfirmed) {
            try {
                const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams({
                        operacion: 'editarKardex',
                        idAlmacenHuevos,
                        motivomovimiento,
                        cantidad,
                        descripcion,
                        idlote: num_lote // Enviar el Nº Lote al backend
                    })
                });

                const result = await response.json();
                if (result.estado) {
                    showToast("Kardex actualizado correctamente", "SUCCESS", 1000);
                    $('#editarModal').modal('hide');
                    await cargarlist();
                } else {
                    showToast("Error al actualizar el Kardex", "ERROR", 1000);
                }
            } catch (error) {
                console.error('Error al actualizar el Kardex:', error);
                showToast("Error al actualizar el Kardex", "ERROR", 1000);
            }
        } else {
            showToast("Actualización del Kardex cancelada", "WARNING", 1000);
        }
    });
});

window.eliminarKardex = async function(idAlmacenHuevos) {
    // Usamos SweetAlert2 para la confirmación
    Swal.fire({
        title: '¿Estás seguro de que deseas eliminar este registro?',
        text: "¡Este proceso no puede deshacerse!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then(async (result) => {
        if (result.isConfirmed) {
            try {
                // Realizar la solicitud de eliminación al servidor
                const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams({
                        operacion: 'eliminarKardex',
                        idAlmacenHuevos
                    })
                });

                const result = await response.json();

                if (result.estado) {
                    showToast('Registro eliminado correctamente', 'SUCCESS', 1000);
                    await cargarlist(); // Recargar la lista después de la eliminación
                } else {
                    showToast('Error al eliminar el registro', 'ERROR', 1000);
                }
            } catch (error) {
                console.error('Error al eliminar el registro:', error);
                showToast('Error al eliminar el registro', 'ERROR', 1000);
            }
        } else {
            showToast('Eliminación cancelada', 'WARNING', 1000);
        }
    });
};

  const initDataTable = async () => {
      if (dataTableIsInitialized) {
          dataTable.destroy();
      }

      await cargarlist();

      dataTable = $('#tabla-listproductos').DataTable(dataTableOptions);
      dataTableIsInitialized = true;
  };

  await initDataTable();
});