//Función de referencia GLOBAL
function $$(object = null) {
  return document.querySelector(object);
}

async function eliminarProducto(idproducto) {
  if (confirm("¿Estás seguro de que deseas eliminar este producto?")) {
      const params = new FormData();
      params.append("operacion", "eliminar");
      params.append("idproducto", idproducto);

      const options = {
          method: 'POST',
          body: params
      };

      const response = await fetch('../../controllers/producto.controller.php', options);
      const result = await response.json();

      if (result.status === "success") {
          showToast("Producto eliminado correctamente", "SUCCESS", 1000);
          listarProductos(); 
      } else {
          showToast("Error al eliminar el producto", "ERROR", 1000);
      }
  }
}

async function editarProducto(idproducto) {
  const response = await fetch(`../../controllers/producto.controller.php?operacion=getAll`);
  const productos = await response.json();
  const producto = productos.find(prod => prod.idproducto === idproducto);

  if (producto) {
      // Llenamos el modal con los datos del producto
      document.querySelector("#idproducto-editar").value = producto.idproducto;
      document.querySelector("#Producto-editar").value = producto.producto;
      document.querySelector("#descripcion-editar").value = producto.descripcion;
      document.querySelector("#stockminimo-editar").value = producto.stockminimo; // Agregar stockminimo

      // Mostramos el modal
      const modal = new bootstrap.Modal(document.getElementById('modalEditarProducto'));
      modal.show();
  }
}

// Manejador del formulario de edición
document.querySelector("#form-editar-producto").addEventListener("submit", async (event) => {
  event.preventDefault();
  const idproducto = document.querySelector("#idproducto-editar").value;
  const params = new FormData();
  params.append("operacion", "editar");
  params.append("idproducto", idproducto);
  params.append("Producto", document.querySelector("#Producto-editar").value);
  params.append("descripcion", document.querySelector("#descripcion-editar").value);
  params.append("stockminimo", document.querySelector("#stockminimo-editar").value); // Agregar stockminimo

  const options = {
      method: 'POST',
      body: params
  };

  const response = await fetch('../../controllers/producto.controller.php', options);
  const result = await response.json();

  if (result.status === "success") {
      showToast("Producto actualizado correctamente", "SUCCESS", 1000);
      listarProductos(); // Refresca la lista de productos después de la edición
      // Cierra el modal
      const modal = bootstrap.Modal.getInstance(document.getElementById('modalEditarProducto'));
      if (modal) {
          modal.hide();
      }
  } else {
      showToast("Error al actualizar el producto", "ERROR", 1000);
  }
});

document.addEventListener('DOMContentLoaded', async function() {
  let dataTable;
  let dataTableIsInitialized = false;

  const dataTableOptions = {
      dom: 'Bfrtilp',
      buttons: [
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              className: 'btn btn-success',
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              className: 'btn btn-danger',
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              className: 'btn btn-info',
          },
      ],
      lengthMenu: [5, 10, 15, 20, 100, 200, 500],
      columnDefs: [
          { className: 'text-center', targets: '_all' },
          { orderable: false, targets: [4] }, 
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
              previous: 'Anterior',
          },
          buttons: {
              excel: 'Excel',
              pdf: 'PDF',
              print: 'Imprimir',
          },
      },
      columns: [
          { title: "ID" },
          { title: "Producto" },
          { title: "Stock Minimo" },
          { title: "Descripción" },
          { title: "Operaciones", orderable: false }
      ]
  };

  async function listarProductos() {
      try {
          const response = await fetch('../../controllers/producto.controller.php?operacion=getAll');
          const data = await response.json();

          let content = '';
          data.forEach((item, index) => {
              content += `
                  <tr>
                      <td class="text-center">${index + 1}</td>
                      <td class="text-center">${item.producto}</td>
                      <td class="text-center">${item.stockminimo}</td>
                      <td class="text-center">${item.descripcion}</td>
                      <td class="text-center">
                          <button class="btn btn-warning btn-sm" onclick="editarProducto(${item.idproducto})">Editar</button>
                          <button class="btn btn-danger btn-sm" onclick="eliminarProducto(${item.idproducto})">Eliminar</button>
                      </td>
                  </tr>`;
          });

          const tbodyElement = document.getElementById('productos-body');
          if (tbodyElement) {
              tbodyElement.innerHTML = content;
          } else {
              console.error("El elemento con ID 'productos-body' no se encontró en el DOM.");
          }
      } catch (error) {
          console.error('Error al cargar los productos:', error);
      }
  }

  const initDataTable = async () => {
      if (dataTableIsInitialized) {
          dataTable.destroy();
      }

      await listarProductos();

      // Inicializar DataTables
      dataTable = $('#tabla-produc').DataTable(dataTableOptions);
      dataTableIsInitialized = true;
  };

  await initDataTable();
});