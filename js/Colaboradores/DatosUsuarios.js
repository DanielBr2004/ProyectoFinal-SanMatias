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
                          <button class="btn btn-primary btn-sm" onclick="abrirModalEditar(${item.idcolaborador}, '${item.apepaterno}', '${item.apematerno}', '${item.nombres}')">Editar</button>
                           <button class="btn btn-danger btn-sm" onclick="eliminarUsuario(${item.idcolaborador})">Eliminar</button>
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

  window.abrirModalEditar = function(idcolaborador, apepaterno, apematerno, nombres) {
    console.log("Abriendo modal con:", idcolaborador, apepaterno, apematerno, nombres);

    // Asignar valores a los campos del modal
    document.getElementById('editIdColaborador').value = idcolaborador;
    document.getElementById('editApePaterno').value = apepaterno;
    document.getElementById('editApeMaterno').value = apematerno;
    document.getElementById('editNombres').value = nombres;

    // Agregar validación para permitir solo letras y espacios
    document.getElementById('editApePaterno').addEventListener('input', restrictToLetters);
    document.getElementById('editApeMaterno').addEventListener('input', restrictToLetters);
    document.getElementById('editNombres').addEventListener('input', restrictToLetters);

    // Mostrar el modal
    $('#editarColaboradorModal').modal('show');
  };

  // Función para restringir la entrada a solo letras y espacios
  function restrictToLetters(event) {
    event.target.value = event.target.value.replace(/[^a-zA-Z\s]/g, '');
  }

  document.getElementById('formEditarColaborador').addEventListener('submit', async function(event) {
    event.preventDefault();

    const idcolaborador = document.getElementById('editIdColaborador').value;
    const apepaterno = document.getElementById('editApePaterno').value;
    const apematerno = document.getElementById('editApeMaterno').value;
    const nombres = document.getElementById('editNombres').value;

    console.log("Enviando datos:", { idcolaborador, apepaterno, apematerno, nombres });

    try {
        const response = await fetch('../../controllers/colaborador.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                operacion: 'edit',
                idcolaborador,
                apepaterno,
                apematerno,
                nombres
            })
        });

        const result = await response.json();
        console.log("Respuesta del servidor:", result);

        if (result.success) {
            alert('Colaborador actualizado correctamente');
            $('#editarColaboradorModal').modal('hide');
            await cargarUsuarios();  // Recarga la lista de usuarios después de editar
        } else {
            alert('Error al actualizar el colaborador');
        }
    } catch (error) {
        console.error('Error al actualizar el colaborador:', error);
    }
  });

  window.eliminarUsuario = async function(idcolaborador) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este colaborador?");
    if (!confirmacion) return;

    try {
        const response = await fetch('../../controllers/colaborador.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                operacion: 'delete',
                idcolaborador
            })
        });

        const result = await response.json();
        if (result.success) {
            alert('Colaborador eliminado correctamente');
            await cargarUsuarios(); // Recargar la lista de colaboradores después de la eliminación
        } else {
            alert('Error al eliminar el colaborador');
        }
    } catch (error) {
        console.error('Error al eliminar el colaborador:', error);
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