/**
 * 
 */

 $(document).ready(function() {
        $('#tabelaBrinquedos').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": true, // Deixe essa opção como "true" para as colunas classificáveis
            "info": false,
            "autoWidth": false,
            "order": [], // Desative a classificação inicial
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.11.5/i18n/Portuguese-Brasil.json"
            },
            "columnDefs": [
                { "targets": [0, 6], "orderable": false } // Define as colunas 0 (Image) e 6 (Ações) como não classificáveis
            ]
        });
    });
    
    function filtrarBrinquedos() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("txtPesquisa");
    filter = input.value.toUpperCase();
    table = document.getElementById("tabelaBrinquedos");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        var match = false;
        td = tr[i].getElementsByTagName("td");

        for (j = 1; j < 5; j++) {
            // Agora, estamos verificando as colunas de Código (j = 1), Nome (j = 2), Categoria (j = 3) e Marca (j = 4)
            txtValue = td[j].textContent || td[j].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                match = true;
                break;
            }
        }

        if (match) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }
    }
}