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
            columns: [0, 1, 2, 3, 4, 5, 6, 7]
          },
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          download: 'open',
          className: 'btn btn-danger',
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]
          },
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          className: 'btn btn-info',
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]
          },
        },
      ],
      lengthMenu: [5, 10, 15, 20, 100, 200, 500],
      columnDefs: [
        { className: 'text-center', targets: '_all' },
        { orderable: false, targets: [2] },
        { searchable: false, targets: [1] },
        { width: '20%', targets: [1] },
        { orderable: true, targets: [8] }
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
  
    // Make cargarlist accessible globally
    window.cargarlist = async () => {
      try {
        const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php?operacion=getAlls');
        const data = await response.json();
        
        // Group data by tipo_huevo
        const groupedData = data.reduce((acc, item) => {
          if (!acc[item.tipo_huevo]) {
            acc[item.tipo_huevo] = [];
          }
          acc[item.tipo_huevo].push(item);
          return acc;
        }, {});
    
        let content = '';
        Object.values(groupedData).forEach(huevoGroup => {
          // Sort records for each egg type by ID in descending order
          huevoGroup.sort((a, b) => b.idAlmacenHuevos - a.idAlmacenHuevos);
          
          huevoGroup.forEach((item, index) => {
            // Show controls only for the latest record of each egg type (index 0)
            const showControls = index === 0;
            
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
        });
    
        const tbodyElement = document.getElementById('tbody-listproductos');
        if (tbodyElement) {
          tbodyElement.innerHTML = content;
        }
      } catch (error) {
        console.error('Error al cargar los productos:', error);
        showToast("Error al cargar los datos", "ERROR", 3000);
      }
    };
  
    // Make initDataTable accessible globally
    window.initDataTable = async () => {
      try {
        if (dataTableIsInitialized) {
          dataTable.destroy();
        }
  
        await cargarlist();
  
        dataTable = $('#tabla-listproductos').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
      } catch (error) {
        console.error('Error al inicializar DataTable:', error);
        showToast("Error al inicializar la tabla", "ERROR", 3000);
      }
    };
  
    // Modal Edit Function
    window.abrirModalEditar = function(idAlmacenHuevos, motivomovimiento, cantidad, descripcion, num_lote) {
      document.getElementById('editIdAlmacenHuevos').value = idAlmacenHuevos;
      document.getElementById('editMotivomovimiento').value = motivomovimiento;
      document.getElementById('editCantidad').value = cantidad;
      document.getElementById('editDescripcion').value = descripcion;
      document.getElementById('editNumLote').value = num_lote;
      $('#editarModal').modal('show');
    };
  
    // Edit Form Submit Handler
    document.getElementById('formEditarKardex').addEventListener('submit', async function(event) {
      event.preventDefault();
  
      const formData = {
        idAlmacenHuevos: document.getElementById('editIdAlmacenHuevos').value,
        motivomovimiento: document.getElementById('editMotivomovimiento').value,
        cantidad: document.getElementById('editCantidad').value,
        descripcion: document.getElementById('editDescripcion').value,
        idlote: document.getElementById('editNumLote').value
      };
  
      const result = await Swal.fire({
        title: '¿Estás seguro?',
        text: "¿Deseas guardar los cambios realizados al Kardex?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
      });
  
      if (result.isConfirmed) {
        try {
          const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
              operacion: 'editarKardex',
              ...formData
            })
          });
  
          const data = await response.json();
          if (data.estado) {
            showToast("Kardex actualizado correctamente", "SUCCESS", 1000);
            $('#editarModal').modal('hide');
            await initDataTable();
          } else {
            showToast("Error al actualizar el Kardex", "ERROR", 1000);
          }
        } catch (error) {
          console.error('Error:', error);
          showToast("Error al actualizar el Kardex", "ERROR", 1000);
        }
      }
    });
  
    // Delete Function
    window.eliminarKardex = async function(idAlmacenHuevos) {
      const result = await Swal.fire({
        title: '¿Estás seguro de que deseas eliminar este registro?',
        text: "¡Este proceso no puede deshacerse!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
      });
  
      if (result.isConfirmed) {
        try {
          const response = await fetch('../../controllers/kardexAlmacenHuevo.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
              operacion: 'eliminarKardex',
              idAlmacenHuevos
            })
          });
  
          const data = await response.json();
          if (data.estado) {
            showToast('Registro eliminado correctamente', 'SUCCESS', 1000);
            await initDataTable();
          } else {
            showToast('Error al eliminar el registro', 'ERROR', 1000);
          }
        } catch (error) {
          console.error('Error:', error);
          showToast('Error al eliminar el registro', 'ERROR', 1000);
        }
      }
    };
  
    // PDF Generation Function
    window.generarPDF = async function(idAlmacenHuevos) {
      window.open('../../views/InventarioAlmacen/reporte.php?idAlmacenHuevos=' + idAlmacenHuevos, '_blank');
    };
  
    // Initialize DataTable on load
    await initDataTable();
  });