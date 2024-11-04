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
            { orderable: false, targets: [2, 6] }, // Ajuste en los índices de columna
            { searchable: false, targets: [1, 6] }, // Ajuste en los índices de columna
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

    const cargarVentas = async () => {
        try {
            const response = await fetch('../../controllers/venta.controller.php?operacion=getAll');
            const data = await response.json();

            let content = '';
            data.forEach(item => {
                content += `
                    <tr>
                        <td class="text-center">${item.idventa}</td>
                        <td class="text-center">${item.clientes ?? 'No data'}</td>
                        <td class="text-center">${item.Colaborador}</td>
                        <td class="text-center">${item.fecha}</td>
                        <td class="text-center">${item.direccion}</td>
                        <td class="text-center">${item.estado}</td>
                        <td class="text-center">
                        <div style="display: inline-flex; gap: 5px;">
                            <button class="btn btn-warning btn-sm editar-btn" data-id="${item.ID}">Editar</button>
                            <button class="btn btn-danger btn-sm eliminar-btn" data-id="${item.ID}">Eliminar</button>
                        </td>
                    </tr>`;
            });

            const tbodyElement = document.getElementById('tbody-ReporVenta');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            } else {
                console.error("El elemento con ID 'tbody-ReporVenta' no se encontró en el DOM.");
            }
        } catch (error) {
            console.error('Error al cargar las ventas:', error);
        }
    };

    const initDataTable = async () => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }

        await cargarVentas();

        dataTable = $('#tabla-ReporVenta').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    };

    await initDataTable();
});