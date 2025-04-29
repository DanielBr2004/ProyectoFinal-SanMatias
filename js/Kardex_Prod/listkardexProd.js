document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;
  
    const dataTableOptions = {
        dom: 'Bfrtilp',
        order: [[0, 'desc']],
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fas fa-file-excel"></i>',
                titleAttr: 'Exportar a Excel',
                className: 'btn btn-success',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]
              }
            },
            {
                extend: 'pdfHtml5',
                text: '<i class="fas fa-file-pdf"></i>',
                titleAttr: 'Exportar a PDF',
                download: 'open',
                className: 'btn btn-danger',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6]
                },
            },
            {
                extend: 'print',
                text: '<i class="fa fa-print"></i>',
                titleAttr: 'Imprimir',
                className: 'btn btn-info',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]
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
            
            // Group data by Producto (product)
            const groupedData = data.reduce((acc, item) => {
                if (!acc[item.Producto]) {
                    acc[item.Producto] = [];
                }
                acc[item.Producto].push(item);
                return acc;
            }, {});
      
            let content = '';
            Object.values(groupedData).forEach(productGroup => {
                // Sort records for each product by ID in descending order
                productGroup.sort((a, b) => b.ID - a.ID);
                
                productGroup.forEach((item, index) => {
                    // Show controls only for the latest record of each product (index 0)
                    const showControls = index === 0;
                    
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
            });
        
            document.getElementById('tbody-listarproductos').innerHTML = content;
        } catch (error) {
            console.error('Error al cargar los productos:', error);
            showToast("Error al cargar los productos", "ERROR", 3000);
        }
      };
      
    window.abrirModalEditar = function(idAlmacenProducto, motivomovimiento, cantidad) {
        document.getElementById('editIdAlmacenProducto').value = idAlmacenProducto;
        document.getElementById('editMotivomovimiento').value = motivomovimiento;
        document.getElementById('editCantidad').value = cantidad;
        $('#editarModal').modal('show');
    };
  
    document.getElementById('formEditarProducto').addEventListener('submit', async function(event) {
      event.preventDefault();
  
      const confirmResult = await Swal.fire({
          title: '¿Estás seguro?',
          text: "¿Deseas guardar los cambios realizados al kardex?",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Aceptar',
          cancelButtonText: 'Cancelar'
      });
  
      if (confirmResult.isConfirmed) {
          try {
              const formData = new URLSearchParams({
                  operacion: 'edit',
                  idAlmacenProducto: document.getElementById('editIdAlmacenProducto').value,
                  motivomovimiento: document.getElementById('editMotivomovimiento').value,
                  cantidad: document.getElementById('editCantidad').value
              });
  
              const response = await fetch('../../controllers/kardexAlmacenProducto.controller.php', {
                  method: 'POST',
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                  body: formData
              });
  
              const result = await response.json();
              if (result.estado) {
                  showToast("Registro actualizado correctamente", "SUCCESS", 1000);
                  $('#editarModal').modal('hide');
                  await initDataTable();
              } else {
                  showToast("Error al actualizar el registro", "ERROR", 1000);
              }
          } catch (error) {
              console.error('Error al actualizar el registro:', error);
              showToast("Error al actualizar el registro", "ERROR", 1000);
          }
      } else {
          showToast("Actualización del kardex cancelada", "WARNING", 1000);
      }
    });
  
    window.eliminarProducto = async function(idAlmacenProducto) {
      const confirmResult = await Swal.fire({
          title: '¿Estás seguro de que deseas eliminar este registro?',
          text: "¡Este proceso no puede deshacerse!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Aceptar',
          cancelButtonText: 'Cancelar'
      });
  
      if (confirmResult.isConfirmed) {
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
                  showToast("Registro eliminado correctamente", "SUCCESS", 1000);
                  await initDataTable();
              } else {
                  showToast("Error al eliminar el registro", "ERROR", 1000);
              }
          } catch (error) {
              console.error('Error al eliminar el registro:', error);
              showToast("Error en la operación", "ERROR", 1000);
          }
      } else {
          showToast("Eliminación cancelada", "WARNING", 1000);
      }
    };
  
    window.initDataTable = async () => {
      if (dataTableIsInitialized) {
          dataTable.destroy();
      }
  
      await cargarProductos();
  
      dataTable = $('#tabla-listarproductos').DataTable(dataTableOptions);
      dataTableIsInitialized = true;
    };
  
    window.validarCantidad = function(input) {
      const errorDiv = document.getElementById('errorCantidad');
      const valor = input.value;
  
      if (!/^\d+$/.test(valor)) {
          errorDiv.style.display = 'block';
          input.value = valor.replace(/\D/g, '');
      } else {
          errorDiv.style.display = 'none';
      }
    };
  
    // Inicializar DataTable al cargar la página
    await initDataTable();
  });