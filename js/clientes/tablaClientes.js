document.addEventListener('DOMContentLoaded', async function() {
    let dataTable;
    let dataTableIsInitialized = false;

    const dataTableOptions = {
        // Configuración de DataTable (como ya la tienes)
    };

    const desplegarDatos = async () => {
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
            } else {
                console.error("El elemento con ID 'tbody-clientes' no se encontró en el DOM.");
            }
        } catch (error) {
            console.error('Error al cargar los datos de los clientes:', error);
        }
    };

    const initDataTable = async () => {
        if (dataTableIsInitialized) {
            dataTable.destroy();
        }

        await desplegarDatos();

        setTimeout(() => {
            dataTable = $('#tabla-client').DataTable(dataTableOptions);
            dataTableIsInitialized = true;
        }, 200); // Delay initialization
    };

    await initDataTable();
});
