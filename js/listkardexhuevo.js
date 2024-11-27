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
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i>',
            titleAttr: 'Exportar a PDF',
            className: 'btn btn-danger',
        },
        {
            extend: 'print',
            text: '<i class="fa fa-print"></i>',
            titleAttr: 'Imprimir',
            className: 'btn btn-info',
        },
    ],
    lengthMenu: [5, 10, 15, 20, 100, 200, 500],
    columnDefs: [
        { className: 'text-center', targets: '_all' },
        { orderable: false, targets: [2] }, 
        { searchable: false, targets: [1] },
        { width: '20%', targets: [1] },
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

          let content = '';
          data.forEach(item => {
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
                <td class="text-center">
                    <div style="display: inline-flex; gap: 5px;">
                        <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${item.idAlmacenHuevos}, '${item.motivomovimiento}', ${item.cantidad}, '${item.descripcion}', '${item.num_lote}')"><i class="fa-solid fa-pen-to-square"></i></button>
                        <button class="btn btn-danger btn-sm" onclick="eliminarKardex(${item.idAlmacenHuevos})"><i class="fa-solid fa-trash-can"></i></button>
                    </div>
                </td>
                <td class="text-center">
                    <button class="btn btn-primary btn-sm" onclick="generarPDF(${item.idAlmacenHuevos})"><i class="fa-solid fa-file-pdf"></i></button>
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
            alert('Registro actualizado correctamente');
            $('#editarModal').modal('hide');
            await cargarlist();
        } else {
            alert('Error al actualizar el registro');
        }
    } catch (error) {
        console.error('Error al actualizar el registro:', error);
    }
});

  window.eliminarKardex = async function(idAlmacenHuevos) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este registro?");
    if (!confirmacion) return;

    try {
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
            alert('Registro eliminado correctamente');
            await cargarlist(); // Recargar la lista
        } else {
            alert('Error al eliminar el registro');
        }
    } catch (error) {
        console.error('Error al eliminar el registro:', error);
    }
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