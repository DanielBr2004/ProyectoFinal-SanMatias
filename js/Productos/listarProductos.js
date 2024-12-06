// Variables globales
let dataTable;
let dataTableIsInitialized = false;

// Configuración de DataTable
const dataTableOptions = {
    dom: 'Bfrtilp',
    buttons: [
        {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            className: 'btn btn-success',
            exportOptions: { columns: [0, 1, 2, 3] }
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i> ',
            titleAttr: 'Exportar a PDF',
            className: 'btn btn-danger',
            exportOptions: { columns: [0, 1, 2, 3] }
        },
        {
            extend: 'print',
            text: '<i class="fa fa-print"></i> ',
            titleAttr: 'Imprimir',
            className: 'btn btn-info',
            exportOptions: { columns: [0, 1, 2, 3] }
        }
    ],
    lengthMenu: [5, 10, 15, 20, 100],
    columnDefs: [
        { className: 'text-center', targets: '_all' },
        { orderable: false, targets: [4] }
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
        }
    }
};

// Función global para listar productos
window.listarProductos = async function() {
    try {
        const response = await fetch('../../controllers/producto.controller.php?operacion=getAll');
        const data = await response.json();

        let content = '';
        data.forEach((item, index) => {
            content += `
                <tr data-id="${item.idproducto}">
                    <td class="text-center">${index + 1}</td>
                    <td class="text-center">${item.producto}</td>
                    <td class="text-center">${item.stockminimo}</td>
                    <td class="text-center">${item.descripcion}</td>
                    <td class="text-center">
                        <button class="btn btn-warning btn-sm" onclick="editarProducto(${item.idproducto})">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                        <button class="btn btn-danger btn-sm" onclick="eliminarProducto(${item.idproducto})">
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                    </td>
                </tr>`;
        });

        const tbodyElement = document.getElementById('productos-body');
        if (tbodyElement) {
            tbodyElement.innerHTML = content;
        }
    } catch (error) {
        console.error('Error al cargar los productos:', error);
        showToast("Error al cargar los productos", "ERROR", 1500);
    }
};

// Función global para eliminar producto
window.eliminarProducto = async function(idproducto) {
    try {
        const result = await Swal.fire({
            title: '¿Estás seguro?',
            text: "¡Este proceso no puede deshacerse!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        });

        if (result.isConfirmed) {
            const params = new FormData();
            params.append("operacion", "eliminar");
            params.append("idproducto", idproducto);

            const response = await fetch('../../controllers/producto.controller.php', {
                method: 'POST',
                body: params
            });
            const data = await response.json();

            if (data.status === "success") {
                showToast("Producto eliminado correctamente", "SUCCESS", 1500);
                await window.initDataTable();
            } else {
                showToast("Error al eliminar el producto", "ERROR", 1500);
            }
        }
    } catch (error) {
        console.error('Error:', error);
        showToast("Error al procesar la solicitud", "ERROR", 1500);
    }
};

// Función global para editar producto
window.editarProducto = async function(idproducto) {
    try {
        const response = await fetch(`../../controllers/producto.controller.php?operacion=getAll`);
        const productos = await response.json();
        const producto = productos.find(prod => prod.idproducto === idproducto);

        if (producto) {
            document.querySelector("#idproducto-editar").value = producto.idproducto;
            document.querySelector("#Producto-editar").value = producto.producto;
            document.querySelector("#descripcion-editar").value = producto.descripcion;
            document.querySelector("#stockminimo-editar").value = producto.stockminimo;

            const modal = new bootstrap.Modal(document.getElementById('modalEditarProducto'));
            modal.show();
        }
    } catch (error) {
        console.error('Error:', error);
        showToast("Error al cargar el producto", "ERROR", 1500);
    }
};

// Función global para inicializar DataTable
window.initDataTable = async function() {
    try {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }

        await listarProductos();

        dataTable = $('#tabla-produc').DataTable(dataTableOptions);
        dataTableIsInitialized = true;
    } catch (error) {
        console.error('Error al inicializar la tabla:', error);
        showToast("Error al inicializar la tabla", "ERROR", 1500);
    }
};

// Manejador del formulario de edición
document.addEventListener('DOMContentLoaded', () => {
    document.querySelector("#form-editar-producto")?.addEventListener("submit", async (event) => {
        event.preventDefault();

        try {
            const result = await Swal.fire({
                title: '¿Estás seguro?',
                text: "¿Deseas guardar los cambios?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            });

            if (result.isConfirmed) {
                const params = new FormData();
                params.append("operacion", "editar");
                params.append("idproducto", document.querySelector("#idproducto-editar").value);
                params.append("Producto", document.querySelector("#Producto-editar").value);
                params.append("descripcion", document.querySelector("#descripcion-editar").value);
                params.append("stockminimo", document.querySelector("#stockminimo-editar").value);

                const response = await fetch('../../controllers/producto.controller.php', {
                    method: 'POST',
                    body: params
                });
                const data = await response.json();

                if (data.status === "success") {
                    showToast("Producto actualizado correctamente", "SUCCESS", 1500);
                    await window.initDataTable();
                    bootstrap.Modal.getInstance(document.getElementById('modalEditarProducto')).hide();
                } else {
                    showToast("Error al actualizar el producto", "ERROR", 1500);
                }
            }
        } catch (error) {
            console.error('Error:', error);
            showToast("Error al procesar la solicitud", "ERROR", 1500);
        }
    });

    // Inicializar DataTable
    window.initDataTable();
});