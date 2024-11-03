document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;
  
    const dataTableOptions = {
      dom: 'Bfrtilp',
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          className: 'btn btn-success',
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          className: 'btn btn-danger',
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
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
  
    const cargarUsuarios = async () => {
      try {
        const response = await fetch('../../controllers/colaborador.controller.php?operacion=getAllUser');
        const data = await response.json();
  
        let content = '';
        data.forEach((item, index) => {
          content += `
            <tr>
              <td class="text-center">${index + 1}</td>
              <td class="text-center">${item.nrodocumento}</td>
              <td class="text-center">${item.apepaterno}</td>
              <td class="text-center">${item.apematerno}</td>
              <td class="text-center">${item.nombres}</td>
              <td class="text-center">${item.nomusuario}</td>
              <td class="text-center">${item.estado}</td>
              <td class="text-center">
                <a href="EditarUsuario.php?id=${item.idcolaborador}" class="btn btn-primary">Editar</a>
                <button class="btn btn-danger" onclick="eliminarUsuario(${item.idcolaborador})">Eliminar</button>
              </td>
            </tr>`;
        });
  
        const tbodyElement = document.getElementById('tbody-usuarios');
        if (tbodyElement) {
          tbodyElement.innerHTML = content;
        } else {
          console.error("El elemento con ID 'tbody-usuarios' no se encontró en el DOM.");
        }
      } catch (error) {
        console.error('Error al cargar los usuarios:', error);
      }
    };
  
    const initDataTable = async () => {
      if (dataTableIsInitialized) {
        dataTable.destroy();
      }
  
      await cargarUsuarios();
  
      dataTable = $('#table-usuarios').DataTable(dataTableOptions);
      dataTableIsInitialized = true;
    };
  
    await initDataTable();
  });