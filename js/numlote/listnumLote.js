const desactivarLote = async (idlote) => {
    try {
        const formData = new URLSearchParams();
        formData.append('operacion', 'deactivateLote');
        formData.append('idlote', idlote);

        const response = await fetch('../../../controllers/numlote.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: formData
        });

        if (!response.ok) {
            throw new Error('La solicitud falló con el estado ' + response.status);
        }

        const resultText = await response.text();
        const result = resultText ? JSON.parse(resultText) : null;

        if (result && result.success) {
            Swal.fire('Lote desactivado', 'El lote ha sido desactivado correctamente.', 'success');
            await initDataTable(); // Recarga la tabla después de desactivar
        } else {
            Swal.fire('Error', 'No se pudo desactivar el lote.', 'error');
        }
    } catch (error) {
        console.error('Error al desactivar el lote:', error);
        Swal.fire('Error', 'Ocurrió un error al desactivar el lote.', 'error');
    }
};

let dataTable;
let dataTableIsInitialized = false;

const initDataTable = async () => {
    if (dataTableIsInitialized) {
        dataTable.destroy();
    }

    await cargarLot();

    dataTable = $('#tabla-NumLote').DataTable(dataTableOptions);
    dataTableIsInitialized = true;
};

const activarLote = async (idlote) => {
    try {
        const formData = new URLSearchParams();
        formData.append('operacion', 'activateLote');
        formData.append('idlote', idlote);

        const response = await fetch('../../../controllers/numlote.controller.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: formData
        });

        if (!response.ok) {
            throw new Error('La solicitud falló con el estado ' + response.status);
        }

        const resultText = await response.text();
        const result = resultText ? JSON.parse(resultText) : null;

        if (result && result.success) {
            Swal.fire('Lote activado', 'El lote ha sido activado correctamente.', 'success');
            await initDataTable(); // Recarga la tabla después de activar
        } else {
            Swal.fire('Error', 'No se pudo activar el lote.', 'error');
        }
    } catch (error) {
        console.error('Error al activar el lote:', error);
        Swal.fire('Error', 'Ocurrió un error al activar el lote.', 'error');
    }
};

const cargarLot = async () => {
    try {
        const response = await fetch('../../../controllers/numlote.controller.php?operacion=getAllLote');
        const data = await response.json();

        let content = '';
        data.forEach(item => {
            const estadoIcon = item.estado === 'A'
                ? '<i class="fas fa-check-circle" style="color: green;"></i>'
                : '<i class="fas fa-minus-circle" style="color: gray;"></i>';

            const accionButton = item.estado === 'A'
                ? `<button class="btn btn-danger btn-sm" onclick="desactivarLote(${item.idlote})">Desactivar</button>`
                : `<button class="btn btn-success btn-sm" onclick="activarLote(${item.idlote})">Activar</button>`;

            content += `
                <tr>
                    <td class="text-center">${item.idlote}</td>
                    <td class="text-center">${item.numLote}</td>
                    <td class="text-center">${estadoIcon}</td>
                    <td class="text-center">${item.descripcion}</td>
                    <td class="text-center">${accionButton}</td>
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

document.addEventListener('DOMContentLoaded', async function () {
    await initDataTable();
});

const dataTableOptions = {
    dom: 'Bfrtilp',
    buttons: [
        { extend: 'excelHtml5', text: '<i class="fas fa-file-excel"></i>', titleAttr: 'Exportar a Excel', className: 'btn btn-success' },
        { extend: 'pdfHtml5', text: '<i class="fas fa-file-pdf"></i>', titleAttr: 'Exportar a PDF', className: 'btn btn-danger' },
        { extend: 'print', text: '<i class="fa fa-print"></i>', titleAttr: 'Imprimir', className: 'btn btn-info' },
    ],
    lengthMenu: [5, 10, 15, 20, 100, 200, 500],
    columnDefs: [
        { className: 'text-center', targets: '_all' },
        { orderable: false, targets: [2, 4] },
        { searchable: false, targets: [1, 4] }
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