document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;
  
    const dataTableOptions = {
        dom: 'Bfrtilp',
        order: [[0, 'desc']],
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
            { orderable: false, targets: [4, 9] },
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
        columns: [
            { title: "ID" },
            { title: "Creado" },
            { title: "Lote" },
            { title: "Número de Aves" },
            { title: "Mortalidad del Día" },
            { title: "Alimento" },
            { title: "Alimentación del Ave" },
            { title: "Producción" },
            { title: "Cantidad de Huevos" },
            { title: "Operaciones" } 
        ]
    };

    window.listarControl = async function(idlote) {
        try {
            const response = await fetch(`../../controllers/controlProduccion.controller.php`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    'operacion': 'list',
                    'idlote': idlote
                })
            });
            const data = await response.json();
    
            // Get the latest date for the current lote
            const latestDate = Math.max(...data.map(item => new Date(item.create_at).getTime()));
    
            let content = '';
            data.forEach((item) => {
                // Check if current record is the latest
                const isLatestRecord = new Date(item.create_at).getTime() === latestDate;
                
                content += `
                    <tr>
                        <td class="text-center">${item.idcontrollote}</td>                    
                        <td class="text-center">${item.create_at}</td>
                        <td class="text-center">${item.idlote}</td>
                        <td class="text-center">${item.numaves}</td>
                        <td class="text-center">${item.mortalidad}</td>
                        <td class="text-center">${item.alimento}</td>
                        <td class="text-center">${item.alimentoAve}</td>
                        <td class="text-center">${item.produccion || ''}</td>
                        <td class="text-center">${item.cantHuevos || ''}</td>
                        <td class="text-center">
                            ${isLatestRecord ? `
                                <button class="btn btn-sm btn-warning" onclick="editarRegistro(${item.idcontrollote})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-sm btn-danger" onclick="eliminarRegistro(${item.idcontrollote})">
                                    <i class="fas fa-trash"></i>
                                </button>
                            ` : ''}
                        </td>
                    </tr>`;
            });
    
            const tbodyElement = document.getElementById('taba-control');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            }
        } catch (error) {
            console.error('Error al cargar los productos:', error);
        }
    }

    window.initDataTable = async (idlote) => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }

        await window.listarControl(idlote);
        dataTable = $('#tabla-controllote').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    };

    // editar registro
    window.editarRegistro = async function(idcontrollote) {
        try {
            const selectedLote = document.getElementById('numLote').value;
            
            // Get current row data
            const row = document.querySelector(`button[onclick="editarRegistro(${idcontrollote})"]`).closest('tr');
            const mortalidad = row.cells[4].textContent;
            const alimento = row.cells[5].textContent;
    
            // Populate modal
            document.querySelector('#formEditar #idlote').value = selectedLote;
            document.querySelector('#formEditar #idcontrollote').value = idcontrollote;
            document.querySelector('#formEditar #mortalidad').value = mortalidad;
            document.querySelector('#formEditar #alimento').value = alimento;
    
            // Show modal
            const modal = new bootstrap.Modal(document.getElementById('modalEditar'));
            modal.show();
        } catch (error) {
            console.error('Error al cargar datos:', error);
            Swal.fire('Error', 'Error al cargar datos para editar', 'error');
        }
    }
    
    // Handle edit form submission
    document.getElementById('btnGuardarEdicion').addEventListener('click', async function() {
        try {
            const form = document.getElementById('formEditar');
            const formData = new FormData();
            
            formData.append('operacion', 'edit');
            formData.append('idlote', form.idlote.value);
            formData.append('idcontrollote', form.idcontrollote.value);
            formData.append('mortalidad', form.mortalidad.value);
            formData.append('alimento', form.alimento.value);
    
            const response = await fetch('../../controllers/controlProduccion.controller.php', {
                method: 'POST',
                body: formData
            });
    
            const data = await response.json();
    
            if (data.status) {
                await Swal.fire('¡Éxito!', 'Registro actualizado correctamente', 'success');
                bootstrap.Modal.getInstance(document.getElementById('modalEditar')).hide();
                await window.initDataTable(document.getElementById('numLote').value);
            } else {
                throw new Error(data.message || 'Error al actualizar el registro');
            }
        } catch (error) {
            console.error('Error completo:', error);
            Swal.fire('Error', 'No se pudo actualizar el registro: ' + error.message, 'error');
        }
    });

    // eliminar registro
    window.eliminarRegistro = async function(idcontrollote) {
        try {
            const result = await Swal.fire({
                title: '¿Estás seguro?',
                text: "Esta acción no se puede revertir",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            });
    
            if (result.isConfirmed) {
                const selectedLote = document.getElementById('numLote').value;
                const formData = new FormData();
                formData.append('operacion', 'delete');
                formData.append('idlote', selectedLote);
                formData.append('idcontrollote', idcontrollote);
    
                const response = await fetch('../../controllers/controlProduccion.controller.php', {
                    method: 'POST',
                    body: formData
                });
    
                // Debug log raw response
                const rawResponse = await response.text();
                console.log('Raw server response:', rawResponse);
    
                try {
                    const data = JSON.parse(rawResponse);
                    if (data.status) {
                        await Swal.fire('¡Eliminado!', 'El registro ha sido eliminado.', 'success');
                        await window.initDataTable(selectedLote);
                    } else {
                        throw new Error(data.message || 'Error al eliminar el registro');
                    }
                } catch (jsonError) {
                    console.error('Error parsing JSON:', jsonError);
                    console.log('Invalid JSON response:', rawResponse);
                    throw new Error('Respuesta inválida del servidor');
                }
            }
        } catch (error) {
            console.error('Error completo:', error);
            Swal.fire('Error', 'No se pudo eliminar el registro: ' + error.message, 'error');
        }
    }

    document.getElementById('numLote').addEventListener('change', function() {
        const selectedLote = this.value;
        if (selectedLote) {
            window.initDataTable(selectedLote);
        }
    });
  
});