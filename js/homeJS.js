document.addEventListener("DOMContentLoaded", () => {

  
  fetch('../controllers/producto.controller.php?operacion=getProductosPendientes')
      .then(response => response.json())
      .then(data => {
          const tbody = document.querySelector("#productos-tbody");
          data.forEach(producto => {
              const row = document.createElement("tr");
              row.innerHTML = `
                  <td>${producto.producto}</td>
                  <td>${producto.stockProducto}</td>
              `;
              tbody.appendChild(row);
          });
      })
      .catch(error => console.error('Error al obtener los productos:', error));
});