// Variables globales
let dataTable;
let dataTableIsInitialized = false;
let desplegarDatos;

// Función eliminar cliente
const eliminarCliente = async (idcliente) => {
    try {
        const confirmacion = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¿Deseas eliminar este cliente?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí',
            cancelButtonText: 'Cancelar'
        });

        if (confirmacion.isConfirmed) {
            const params = new FormData();
            params.append("operacion", "delete");
            params.append("idcliente", idcliente);

            const response = await fetch('../../controllers/Clientes.controller.php', {
                method: 'POST',
                body: params
            });
            
            const result = await response.json();
            
            if (result.mensaje) {
                showToast(result.mensaje, "SUCCESS", 1500);
                await desplegarDatos();
            }
        }
    } catch (error) {
        console.error('Error en la eliminación:', error);
        showToast("Error al eliminar el cliente", "ERROR", 1500);
    }
};

// Función editar cliente
const editarCliente = async (idcliente) => {
    try {
        const response = await fetch('../../controllers/Clientes.controller.php?operacion=getAllClient');
        const clientes = await response.json();
        const cliente = clientes.find((item) => item.idcliente === idcliente);

        if (cliente) {
            document.querySelector('#idcliente-edit').value = cliente.idcliente;
            document.querySelector('#nrodocumento-edit').value = cliente.nrodocumento;
            document.querySelector('#tipodoc-edit').value = cliente.tipodocumento;
            document.querySelector('#nomcliente-edit').value = cliente.clientes;

            const modal = new bootstrap.Modal(document.getElementById('editarClienteModal'));
            modal.show();
        } else {
            showToast("No se encontró el cliente", "ERROR", 1500);
        }
    } catch (error) {
        console.error('Error:', error);
        showToast("Error al cargar los datos del cliente", "ERROR", 1500);
    }
};
    // Event listener para el formulario de edición
    document.querySelector('#form-editar-cliente').addEventListener('submit', async (event) => {
        event.preventDefault();
        
        try {
            const params = new FormData();
            params.append('operacion', 'edit');
            params.append('idcliente', document.querySelector('#idcliente-edit').value);
            params.append('nrodocumento', document.querySelector('#nrodocumento-edit').value);
            params.append('tipodocumento', document.querySelector('#tipodoc-edit').value);
            params.append('cliente_nombre', document.querySelector('#nomcliente-edit').value);

            const response = await fetch('../../controllers/Clientes.controller.php', {
                method: 'POST',
                body: params
            });
            
            const result = await response.json();

            if (result.mensaje) {
                showToast(result.mensaje, 'SUCCESS', 1500);
                await initDataTable();
                const modalElement = document.getElementById('editarClienteModal');
                const modal = bootstrap.Modal.getInstance(modalElement);
                modal.hide();
            }
        } catch (error) {
            console.error('Error en la edición:', error);
            showToast('Error al editar el cliente', 'ERROR', 1500);
        }
    });

// Función para inicializar DataTable
const initDataTable = async () => {
    if (dataTableIsInitialized) {
        dataTable.destroy();
    }

    await desplegarDatos();

    setTimeout(() => {
        dataTable = $('#tabla-client').DataTable({
            // Tus opciones de DataTable aquí
            responsive: true,
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
        });
        dataTableIsInitialized = true;
    }, 200);
};

// Evento DOMContentLoaded
document.addEventListener('DOMContentLoaded', async function() {
    // Definición de desplegarDatos
    desplegarDatos = async () => {
        try {
            const response = await fetch('../../controllers/Clientes.controller.php?operacion=getAllClient');
            const data = await response.json();

            let content = '';
            data.forEach((item, index) => {
                content += `
                    <tr>
                        <td class="text-center">${index + 1}</td>
                        <td class="text-center">${item.nrodocumento}</td>
                        <td class="text-center">${item.tipodocumento}</td>
                        <td class="text-center">${item.clientes}</td>
                        <td class="text-center">${item.estado}</td>
                        <td class="text-center">
                            <button class="btn btn-primary btn-sm" onclick="editarCliente(${item.idcliente})">
                                <i class="fa-solid fa-pencil"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="eliminarCliente(${item.idcliente})">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        </td>
                    </tr>`;
            });

            const tbodyElement = document.getElementById('tbody-clientes');
            if (tbodyElement) {
                tbodyElement.innerHTML = content;
            }
        } catch (error) {
            console.error('Error al cargar los datos:', error);
        }
    };


    // Inicializar la tabla
    await initDataTable();
});