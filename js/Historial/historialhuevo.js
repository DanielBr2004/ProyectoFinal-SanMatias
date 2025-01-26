document.addEventListener('DOMContentLoaded', function() {
  // Initialize modal
  const historyModal = new bootstrap.Modal(document.getElementById('historyModal'));
  
  // Initialize DataTable
  let historyTable = null;

  // Show modal and load data when clicking button
  document.getElementById('showHistoryBtn').addEventListener('click', async function() {
    historyModal.show();
    
    if (!historyTable) {
        try {
            const response = await fetch('../../controllers/historial.controller.php?operacion=getAll');
            const data = await response.json();
            
            historyTable = $('#historyTable').DataTable({
                data: data,
                columns: [
                    { data: 'idHistorial' },
                    { data: 'usuario' },
                    { data: 'accion' },
                    { data: 'datos_anteriores' },
                    { data: 'datos_nuevos' },
                    { data: 'fecha' }
                ],
                // Add scrolling options
                scrollY: '50vh',
                scrollX: true,
                scrollCollapse: true,
                // Add length menu
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
            console.error('Error loading data:', error);
            Swal.fire({
                icon: 'error',
                title: 'Error', 
                text: 'No se pudo cargar el historial'
            });
        }
    }
});
});