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

        document.getElementById('idloteSelectM').addEventListener('change', function() {
            const idlote = this.value;
            if (idlote) {
                crearGraficoPie(idlote);
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

                    actualizarGrafico(data[0].idlote);
                })
                .catch(e => { console.error(e) })
        })();
        
        (() => {
            fetch(`../controllers/numlote.controller.php?operacion=getAll`)
                .then(response => response.json())
                .then(data => {
                    const numlote = document.querySelector("#idloteSelectM")
                    
                    data.forEach(row => {
                        const tagOption = document.createElement("option")
                        tagOption.value = row.idlote
                        tagOption.innerHTML = `Lote N° ${row.numLote}`
                        numlote.appendChild(tagOption)
                    });

                    crearGraficoPie(data[0].idlote);
                })
                .catch(e => { console.error(e) })
        })();


        function crearGraficoPie(idlote) {
            fetch(`../controllers/controlProduccion.controller.php?operacion=ChartLotes2&idlote2=${idlote}`)
                .then(response => response.json())
                .then(data => {
                    const ctx = document.getElementById('myPieChart').getContext('2d');
                    
                    // Get first record since response is an array
                    const record = data[0];
                    
                    // Calculate remaining quantity
                    const cantidadActual = record.cantidad_inicial - record.mortalidad_acumulada;
                    
                    // Setup data for pie chart
                    const labels = ['Aves Actuales', 'Mortalidad'];
                    const valores = [cantidadActual, record.mortalidad_acumulada];
                    
                    // Destroy existing chart if any
                    if (window.myPieChart && typeof window.myPieChart.destroy === 'function') {
                        window.myPieChart.destroy();
                    }
        
                    window.myPieChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: labels,
                            datasets: [{
                                data: valores,
                                backgroundColor: [
                                    'rgba(8, 89, 138 , 0.8)',  // Verde para aves vivas
                                    'rgba(182, 55, 55, 0.8)'   // Rojo para mortalidad
                                ],
                                borderColor: [
                                    'rgba(8, 89, 138 , 0.8)',
                                    'rgba(182, 55, 55, 0.8)' 
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'top',
                                },
                                title: {
                                    display: true,
                                    text: `Estado del Lote N° ${record.numLote} - Total Inicial: ${record.cantidad_inicial} - Mortalidad Acumulada: ${record.mortalidad_acumulada} Aves`
                                }
                            }
                        }
                    });

                    // Mapeo de claves a nombres personalizados
                    const keyMap = {
                        numLote: 'N° Lote',
                        cantidad_inicial: 'N° Gallinas',
                        mortalidad_acumulada: 'Mortalidad',
                        edad_ave: 'Edad (Semanas)',
                        create_at: 'Fecha de Recepcion',
                        ratio: 'Porcentaje Mortalidad',
                        // Agrega más mapeos según sea necesario
                    };

                    // Actualiza el div con la clase detalles
                    var detallesDiv = document.querySelector('.detalles');
                    detallesDiv.innerHTML = ''; // Limpia el contenido anterior
                    let isFirst = true;
                    for (const [key, value] of Object.entries(record)) {
                        var detailItem = document.createElement('div');
                        var displayKey = keyMap[key] || key; // Usa el nombre personalizado si existe, de lo contrario usa la clave original
                        if (isFirst) {
                            detailItem.innerHTML = `<br><strong>${displayKey}:</strong><br><span class="value">${value}</span>`;
                            isFirst = false;
                        } else {
                            detailItem.innerHTML = `<strong>${displayKey}:</strong><br><span class="value">${value}</span>`;
                        }
                        detallesDiv.appendChild(detailItem);
                    }
                })
                .catch(error => console.error('Error al obtener datos:', error));
        }
});