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
            { orderable: false, targets: [4] }, 
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
            { title: "Numeros de Aves" },
            { title: "Mortalidad del Dia" },
            { title: "Alimento" },
            { title: "Alimento de Ave" },
            { title: "Produccion" },
            { title: "Cantidad de Huevos" }
        ]
    };
  
    async function listarControl() {
        try {
            const response = await fetch('../../controllers/controlProduccion.controller.php?operacion=list');
            const data = await response.json();
  
            let content = '';
            data.forEach((item, index) => {
                content += `
                    <tr>
                        <td class="text-center">${item.create_at}</td>
                        <td class="text-center">${item.idlote}</td>
                        <td class="text-center">${item.numaves}</td>
                        <td class="text-center">${item.mortalidad}</td>
                        <td class="text-center">${item.alimento}</td>
                        <td class="text-center">${item.alimentoAve}</td>
                        <td class="text-center">${item.produccion}</td>
                        <td class="text-center">${item.cantHuevos}</td>
                    </tr>`;
            });
  
            const tbodyElement = document.getElementById('taba-control');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            } else {
                console.error("El elemento con ID 'taba-control' no se encontró en el DOM.");
            }
        } catch (error) {
            console.error('Error al cargar los productos:', error);
        }
    }
  
    const initDataTable = async () => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }
  
        await listarControl();
  
        // Inicializar DataTables
        dataTable = $('#tabla-controllote').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    };
  
    await initDataTable();
  });