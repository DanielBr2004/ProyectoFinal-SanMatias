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
        });

        document.getElementById('idloteSelect').addEventListener('change', function() {
            const idlote = this.value;
            if (idlote) {
                actualizarGrafico(idlote);
            } else {
                alert('Por favor, seleccione un ID de lote válido.');
            }
        });
        
        function actualizarGrafico(idlote) {
            // Realizar la solicitud fetch para obtener los datos
            fetch(`../controllers/controlProduccion.controller.php?operacion=ChartLotes&idlote=${idlote}`)
                .then(response => response.json())
                .then(data => {
                    // Crear el gráfico de líneas
                    const ctx = document.getElementById('myLineChart').getContext('2d');
                    const labels = data.map(producto => producto.fecha); // Asegúrate de que 'fecha' es el campo correcto
                    const stockData = data.map(producto => producto.produccion); // Asegúrate de que 'produccion' es el campo correcto
        
                    // Destruir el gráfico existente si ya existe
                    if (window.myLineChart && typeof window.myLineChart.destroy === 'function') {
                        window.myLineChart.destroy();
                    }
        
                    window.myLineChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Producción',
                                data: stockData,
                                borderColor: 'rgba(75, 192, 192, 1)',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                })
                .catch(error => console.error('Error al obtener los productos:', error));
        }


        (() => {
            fetch(`../controllers/numlote.controller.php?operacion=getAll`)
                .then(response => response.json())
                .then(data => {
                    const numlote = document.querySelector("#idloteSelect")
                    data.forEach(row => {
                        const tagOption = document.createElement("option")
                        tagOption.value = row.idlote
                        tagOption.innerHTML = `Lote N° ${row.numLote}`
                        numlote.appendChild(tagOption)
                    });
                })
                .catch(e => { console.error(e) })
        })();

        actualizarGrafico(9);
});