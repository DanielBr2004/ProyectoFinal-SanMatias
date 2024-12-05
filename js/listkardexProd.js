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
                columns: [0, 1, 2, 3, 4, 5, 6] // Only include first 8 columns
            }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i>',
              titleAttr: 'Exportar a PDF',
              download: 'open',
                className: 'btn btn-danger',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6] // Only include first 8 columns
                },
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i>',
              titleAttr: 'Imprimir',
              className: 'btn btn-info',
              exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6] // Only include first 8 columns
            }
          },
      ],
      lengthMenu: [5, 10, 15, 20, 100, 200, 500],
      columnDefs: [
          { className: 'text-center', targets: '_all' },
          { orderable: false, targets: [2, 7] },
          { searchable: false, targets: [1, 7] },
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

  const cargarProductos = async () => {
    try {
        const response = await fetch('../../controllers/kardexAlmacenProducto.controller.php?operacion=getAll');
        const data = await response.json();
        
        // Sort data by ID to find the latest record
        const sortedData = [...data].sort((a, b) => b.ID - a.ID);
        const latestId = sortedData[0]?.ID;
        
        let content = '';
        data.forEach(item => {
            // Only show edit/delete buttons for the latest record
            const showControls = item.ID === latestId;
            
            content += `
                <tr>
                    <td class="text-center">${item.ID}</td>
                    <td class="text-center">${item.Colaborador}</td>
                    <td class="text-center">${item.Producto}</td>
                    <td class="text-center">${item['Stock Actual']}</td>
                    <td class="text-center">${item['Motivo de Movimiento']}</td>
                    <td class="text-center">${item.Cantidad}</td>
                    <td class="text-center">${item.Creado}</td>
                    <td class="text-center">
                    <div style="display: inline-flex; gap: 5px;">
                        ${showControls ? `
                            <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${item.ID}, '${item['Motivo de Movimiento']}', ${item.Cantidad})">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="eliminarProducto(${item.ID})">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        ` : ''}
                    </div>
                    </td>
                </tr>`;
        });
    
        const tbodyElement = document.getElementById('tbody-listarproductos');
        if (tbodyElement) {
            tbodyElement.innerHTML = content;
        } else {
            console.error("El elemento con ID 'tbody-listarproductos' no se encontró en el DOM.");
        }
    } catch (error) {
        console.error('Error al cargar los productos:', error);
    }
};

  window.abrirModalEditar = function(idAlmacenProducto, motivomovimiento, cantidad) {
      console.log("Abriendo modal con:", idAlmacenProducto, motivomovimiento, cantidad);
      
      // Asignar valores a los campos del modal
      document.getElementById('editIdAlmacenProducto').value = idAlmacenProducto;
      document.getElementById('editMotivomovimiento').value = motivomovimiento;
      document.getElementById('editCantidad').value = cantidad;

      $('#editarModal').modal('show');
  };

  document.getElementById('formEditarProducto').addEventListener('submit', async function(event) {
      event.preventDefault();

      const idAlmacenProducto = document.getElementById('editIdAlmacenProducto').value;
      const motivomovimiento = document.getElementById('editMotivomovimiento').value;
      const cantidad = document.getElementById('editCantidad').value;

      try {
          const response = await fetch('../../controllers/kardexAlmacenProducto.controller.php', {
              method: 'POST',
              headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
              body: new URLSearchParams({
                  operacion: 'edit',
                  idAlmacenProducto,
                  motivomovimiento,
                  cantidad
              })
          });

          const result = await response.json();
          if (result.estado) {
              alert('Registro actualizado correctamente');
              $('#editarModal').modal('hide');
              await cargarProductos();
          } else {
              alert('Error al actualizar el registro');
          }
      } catch (error) {
          console.error('Error al actualizar el registro:', error);
      }
  });

  window.eliminarProducto = async function(idAlmacenProducto) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este registro?");
    if (!confirmacion) return;

    try {
        const response = await fetch('../../controllers/kardexAlmacenProducto.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                operacion: 'delete',
                idAlmacenProducto
            })
        });

        const result = await response.json();
        if (result.estado) {
            alert('Registro eliminado correctamente');
            await cargarProductos(); // Recargar la lista después de eliminar
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
  
      await cargarProductos();
  
      dataTable = $('#tabla-listarproductos').DataTable(dataTableOptions);
      dataTableIsInitialized = true;
  };

  await initDataTable();

  window.validarCantidad = function(input) {
      const errorDiv = document.getElementById('errorCantidad');
      const valor = input.value;

      if (!/^\d+$/.test(valor)) {
          // se Mostrara el mensaje de error
          errorDiv.style.display = 'block';
          input.value = valor.replace(/\D/g, '');
      } else {
          errorDiv.style.display = 'none';
      }
  };
});