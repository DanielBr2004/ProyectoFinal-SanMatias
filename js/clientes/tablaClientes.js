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
                    <td class="text-center">${numFila}</td>
                    <td class="text-center">${item.nrodocumento}</td>
                    <td class="text-center">${item.tipodocumento}</td>
                    <td class="text-center">${item.clientes}</td>
                    <td class="text-center"></td>
                    <td class="text-center">
                        <a href="EditarUsuario.php?id=${item.idcolaborador}" class="btn btn-primary"><i class="fa-solid fa-pencil"></i></a>
                        <button class="btn btn-danger" onclick="eliminarUsuario(${item.idcolaborador})"><i class="fa-solid fa-trash-can"></i></button>
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