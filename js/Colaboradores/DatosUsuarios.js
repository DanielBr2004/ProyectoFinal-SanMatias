document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;

    // Configuración de DataTables
    const dataTableOptions = {
        dom: 'Bfrtilp',
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fas fa-file-excel"></i>',
                titleAttr: 'Exportar a Excel',
                className: 'btn btn-success',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5]
                }
            },
            {
                extend: 'pdfHtml5',
                text: '<i class="fas fa-file-pdf"></i>',
                titleAttr: 'Exportar a PDF',
                className: 'btn btn-danger',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5]
                }
            },
            {
                extend: 'print',
                text: '<i class="fa fa-print"></i>',
                titleAttr: 'Imprimir',
                className: 'btn btn-info',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5]
                }
            }
        ],
        lengthMenu: [5, 10, 15, 20, 100, 200, 500],
        columnDefs: [
            { className: 'text-center', targets: '_all' },
            { orderable: false, targets: [2] },
            { searchable: false, targets: [1] },
            { width: '20%', targets: [1] }
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
                previous: 'Anterior'
            },
            buttons: {
                excel: 'Excel',
                pdf: 'PDF',
                print: 'Imprimir'
            }
        }
    };

    // Función para cargar usuarios
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
                        <td class="text-center">
                            <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${item.idcolaborador}, '${item.apepaterno}', '${item.apematerno}', '${item.nombres}')">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="eliminarUsuario(${item.idcolaborador})">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        </td>
                    </tr>`;
            });

            const tbodyElement = document.getElementById('tbody-usuarios');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            }
        } catch (error) {
            console.error('Error al cargar los usuarios:', error);
        }
    };

    // Función para abrir modal de edición
    window.abrirModalEditar = function(idcolaborador, apepaterno, apematerno, nombres) {
        document.getElementById('editIdColaborador').value = idcolaborador;
        document.getElementById('editApePaterno').value = apepaterno;
        document.getElementById('editApeMaterno').value = apematerno;
        document.getElementById('editNombres').value = nombres;

        document.getElementById('editApePaterno').addEventListener('input', restrictToLetters);
        document.getElementById('editApeMaterno').addEventListener('input', restrictToLetters);
        document.getElementById('editNombres').addEventListener('input', restrictToLetters);

        $('#editarColaboradorModal').modal('show');
    };

    // Función para restringir entrada a letras
    function restrictToLetters(event) {
        event.target.value = event.target.value.replace(/[^a-zA-Z\s]/g, '');
    }

    // Manejar envío del formulario de edición
    document.getElementById('formEditarColaborador').addEventListener('submit', async function(event) {
        event.preventDefault();

        const idcolaborador = document.getElementById('editIdColaborador').value;
        const apepaterno = document.getElementById('editApePaterno').value;
        const apematerno = document.getElementById('editApeMaterno').value;
        const nombres = document.getElementById('editNombres').value;

        const confirmacion = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Estás a punto de editar los datos del colaborador!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        });

        if (confirmacion.isConfirmed) {
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

                if (result.success) {
                    showToast('Colaborador actualizado correctamente', 'SUCCESS', 1000);
                    $('#editarColaboradorModal').modal('hide');
                    await cargarUsuarios();
                } else {
                    showToast('Error al actualizar el colaborador', 'ERROR', 1000);
                }
            } catch (error) {
                console.error('Error al actualizar el colaborador:', error);
            }
        }
    });

    // Función para eliminar usuario
    window.eliminarUsuario = async function(idcolaborador) {
        const confirmacion = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Esta acción no se puede deshacer!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        });

        if (confirmacion.isConfirmed) {
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
                    showToast('Colaborador eliminado correctamente', 'SUCCESS', 1000);
                    await cargarUsuarios();
                } else {
                    showToast('Error al eliminar el colaborador', 'ERROR', 1000);
                }
            } catch (error) {
                console.error('Error al eliminar el colaborador:', error);
            }
        }
    };

    // Inicialización de DataTable
    const initDataTable = async () => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }
        await cargarUsuarios();
        dataTable = $('#table-usuarios').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    };

    // Hacer cargarUsuarios accesible globalmente
    window.cargarUsuarios = cargarUsuarios;

    // Inicializar
    await initDataTable();
});