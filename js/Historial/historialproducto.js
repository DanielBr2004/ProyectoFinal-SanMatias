document.addEventListener('DOMContentLoaded', function() {
    // Initialize modal
    const historyModales = new bootstrap.Modal(document.getElementById('historyModales'));
    
    // Fix variable declaration
    let historyprodTable = null;
  
    document.getElementById('showHistoryBtn').addEventListener('click', async function() {
        try {
            historyModales.show();
            
            // Check if table already initialized
            if ($.fn.DataTable.isDataTable('#historyprodTable')) {
                historyprodTable.destroy();
            }

            // Fetch data
            const response = await fetch('../../controllers/historial.controller.php?operacion=list');
            console.log('Response:', response); // Debug
            
            const data = await response.json();
            console.log('Data:', data); // Debug

            historyprodTable = $('#historyprodTable').DataTable({
                data: data,
                columns: [
                    { data: 'idHistorial' },
                    { data: 'idAlmacenProducto' },
                    { data: 'usuario' },
                    { data: 'accion' },
                    { data: 'datos_anteriores' },
                    { data: 'datos_nuevos' },
                    { data: 'fecha' }
                ],
                scrollY: '50vh',
                scrollX: true,
                scrollCollapse: true,
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "Todos"]],
                pageLength: 10,
                dom: 'Blfrtip',
                buttons: [
                    'excel', 'pdf', 'print'
                ],
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
                    lengthMenu: "Mostrar _MENU_ registros"
                }
            });

        } catch (error) {
            console.error('Error completo:', error); // Detailed error
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'No se pudo cargar el historial: ' + error.message
            });
        }
    });
});