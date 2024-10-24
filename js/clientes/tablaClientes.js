document.addEventListener('DOMContentLoaded', () => {


    async function desplegarDatos() {
        try {
            const response = await fetch(`../../controllers/Clientes.controller.php?operacion=getAllClient`);
            const data = await response.json();

            const tbody = document.getElementById("tbody-clientes")
            tbody.innerHTML = "";

            let numFila = 1;

            data.forEach(item =>{
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${numFila}</td>
                    <td>${item.nombres}</td>
                    <td>${item.apepaterno}</td>
                    <td>${item.apematerno}</td>
                    <td>${item.telefono}</td>
                    <td>${item.razonsocial}</td>
                    <td>${item.direccion}</td>
                    <td>${item.email}</td>
                    <td>
                        <a href="EditarUsuario.php?id=${item.idcolaborador}" class="btn btn-primary">Editar</a>
                        <button class="btn btn-danger" onclick="eliminarUsuario(${item.idcolaborador})">Eliminar</button>
                    </td>
                    
                `;
                tbody.appendChild(row);
                numFila++;
            })

        } catch (error) {
            console.error(error);
        }
    }


    desplegarDatos();
});