window.generarPDF = function (idVenta) {
    const url = `../../views/reportes-ventas/reporte.php?idventa=${idVenta}`;
    window.open(url, '_blank');
};

document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;

    const dataTableOptions = {
        dom: 'Bfrtilp',
        order: [[0, 'desc']],
        buttons: [
            { extend: 'excelHtml5', text: '<i class="fas fa-file-excel"></i> ', titleAttr: 'Exportar a Excel', className: 'btn btn-success', exportOptions: { columns: [0, 1, 2, 3, 4] } },
            { extend: 'pdfHtml5', text: '<i class="fas fa-file-pdf"></i> ', titleAttr: 'Exportar a PDF', className: 'btn btn-danger', exportOptions: { columns: [0, 1, 2, 3, 4] } },
            { extend: 'print', text: '<i class="fa fa-print"></i> ', titleAttr: 'Imprimir', className: 'btn btn-info', exportOptions: { columns: [0, 1, 2, 3, 4] } },
        ],
        lengthMenu: [5, 10, 15, 20, 100, 200, 500],
        columnDefs: [{ className: 'text-center', targets: '_all' }, { orderable: false, targets: [2, 6] }, { searchable: false, targets: [1, 6] }],
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
                        <td class="text-center">${item.estado}</td>
                        <td class="text-center">
                            <div style="display: inline-flex; gap: 5px;">
                                <button class="btn btn-warning btn-sm" 
                                        onclick="abrirModalEditar(${item.idventa}, '${item.estado}')"
                                        ${(item.estado === 'Entregado' || item.estado === 'Anulado') ? 'disabled style="opacity: 0.6; cursor: not-allowed;"' : ''}>
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <button class="btn btn-danger btn-sm eliminar-btn" 
                                        data-id="${item.idventa}"
                                        ${(item.estado === 'Entregado' || item.estado === 'Anulado') ? 'disabled style="opacity: 0.6; cursor: not-allowed;"' : ''}>
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </div>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-primary btn-sm" onclick="generarPDF(${item.idventa})">
                                <i class="fa-solid fa-file-pdf"></i>
                            </button>
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

    window.abrirModalEditar = function(idventa, estado) {
        document.getElementById('editIdVenta').value = idventa;
        document.getElementById('editEstado').value = estado;
        
        // Remove the input event listener since we're using a select now
        $('#editarVentaModal').modal('show');
    };

    // editar venta 
    document.getElementById('formEditarVenta').addEventListener('submit', async function(event) {
        event.preventDefault();
    
        const idventa = document.getElementById('editIdVenta').value;
        const estado = document.getElementById('editEstado').value;
    
        const result = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¿Deseas guardar los cambios realizados a la venta?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        });
    
        if (result.isConfirmed) {
            try {
                const response = await fetch('../../controllers/venta.controller.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams({
                        operacion: 'update',
                        idventa,
                        estado
                    })
                });
    
                const data = await response.json();
                if (data.success) {
                    showToast('Venta actualizada correctamente', 'SUCCESS', 1000);
                    $('#editarVentaModal').modal('hide');
                    await cargarVentas();
                } else {
                    showToast('Error al actualizar la venta', 'ERROR', 1000);
                }
            } catch (error) {
                console.error('Error:', error);
                showToast('Error al actualizar la venta', 'ERROR', 1000);
            }
        }
    });

    // eliminar venta

    document.getElementById('tbody-ReporVenta').addEventListener('click', async function(e) {
        if (e.target.closest('.eliminar-btn')) {
            const button = e.target.closest('.eliminar-btn');
            const idventa = button.dataset.id;
            
            const result = await Swal.fire({
                title: '¿Estás seguro?',
                text: "¿Deseas eliminar esta venta?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            });
    
            if (result.isConfirmed) {
                try {
                    const response = await fetch('../../controllers/venta.controller.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: new URLSearchParams({
                            'operacion': 'delete',
                            'idventa': idventa
                        })
                    });
    
                    const data = await response.json();
                    if (data.success) {
                        showToast('Venta eliminada correctamente', 'SUCCESS', 1000);
                        if (dataTableIsInitialized) {
                            dataTable.destroy();
                        }
                        await cargarVentas();
                        dataTable = $('#tabla-ReporVenta').DataTable(dataTableOptions);
                        dataTableIsInitialized = true;
                    } else {
                        showToast('Error al eliminar la venta', 'ERROR', 1000);
                    }
                } catch (error) {
                    console.error('Error:', error);
                    showToast('Error al eliminar la venta', 'ERROR', 1000);
                }
            }
        }
    });

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