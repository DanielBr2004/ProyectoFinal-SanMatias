document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;

    const dataTableOptions = {
        dom: 'Bfrtilp',
        buttons: [
            { extend: 'excelHtml5', text: '<i class="fas fa-file-excel"></i> ', titleAttr: 'Exportar a Excel', className: 'btn btn-success' },
            { extend: 'pdfHtml5', text: '<i class="fas fa-file-pdf"></i> ', titleAttr: 'Exportar a PDF', className: 'btn btn-danger' },
            { extend: 'print', text: '<i class="fa fa-print"></i> ', titleAttr: 'Imprimir', className: 'btn btn-info' },
        ],
        lengthMenu: [5, 10, 15, 20, 100, 200, 500],
        columnDefs: [
            { className: 'text-center', targets: '_all' },
            { orderable: false, targets: [2] }, // Only the Description column
            { searchable: false, targets: [1] } // Only the Num Lote column
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
            paginate: { first: 'Primero', last: 'Último', next: 'Siguiente', previous: 'Anterior' },
            buttons: { excel: 'Excel', pdf: 'PDF', print: 'Imprimir' },
        },
    };

    const cargarLot = async () => {
        try {
            const response = await fetch('../../../controllers/numlote.controller.php?operacion=getAllLote');
            const data = await response.json();

            let content = '';
            data.forEach(item => {
                content += `
                    <tr>
                        <td class="text-center">${item.idlote}</td>
                        <td class="text-center">${item.numLote}</td>
                        <td class="text-center">${item.descripcion}</td>
                    </tr>`;
            });

            const tbodyElement = document.getElementById('tbody-numLote');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            } else {
                console.error("El elemento con ID 'tbody-numLote' no se encontró en el DOM.");
            }
        } catch (error) {
            console.error('Error al cargar los lotes:', error);
        }
    };

    const initDataTable = async () => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }

        await cargarLot();

        dataTable = $('#tabla-NumLote').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    };

    await initDataTable();
});