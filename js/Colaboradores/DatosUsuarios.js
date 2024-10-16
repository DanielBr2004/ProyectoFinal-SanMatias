document.addEventListener('DOMContentLoaded', () => {

    $('#tabla-productos').DataTable({
        "language": {
            "url": "../views/js/Spanish.json"
        }
    });


    async function desplegarDatos() {
        try {
            const response = await fetch(`../../controllers/colaborador.controller.php?operacion=getAllUser`);
            const data = await response.json();

            const tbody = document.getElementById("tbody-usuarios")
            tbody.innerHTML = "";

            data.forEach(item =>{
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td></td>
                    <td>${item.nrodocumento}</td>
                    <td>${item.apepaterno}</td>
                    <td>${item.apematerno}</td>
                    <td>${item.nombres}</td>
                    <td>${item.nomusuario}</td>
                    <td></td>
                    <td>
                        <a href="EditarUsuario.php?id=${item.idcolaborador}" class="btn btn-primary">Editar</a>
                        <button class="btn btn-danger" onclick="eliminarUsuario(${item.idcolaborador})">Eliminar</button>
                    </td>
                `;
                tbody.appendChild(row);
            })

        } catch (error) {
            console.error(error);
        }
    }


    desplegarDatos();
});