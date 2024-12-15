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
            { orderable: false, targets: [4, 8] },
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
    
            let content = '';
            data.forEach((item) => {
                content += `
                    <tr>
                        <td class="text-center">${item.create_at}</td>
                        <td class="text-center">${item.idlote}</td>
                        <td class="text-center">${item.numaves}</td>
                        <td class="text-center">${item.mortalidad}</td>
                        <td class="text-center">${item.alimento}</td>
                        <td class="text-center">${item.alimentoAve}</td>
                        <td class="text-center">${item.produccion || ''}</td>
                        <td class="text-center">${item.cantHuevos || ''}</td>
                        <td class="text-center">
                            <button class="btn btn-sm btn-warning" onclick="editarRegistro(${item.ID})">
                            <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-sm btn-danger" onclick="eliminarRegistro(${item.ID})">
                            <i class="fas fa-trash"></i>
                            </button>
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


    document.getElementById('numLote').addEventListener('change', function() {
        const selectedLote = this.value;
        if (selectedLote) {
            window.initDataTable(selectedLote);
        }
    });
  
});