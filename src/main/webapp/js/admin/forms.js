/**
 * 
 */

 document.getElementById('codigo').addEventListener('input', function() {
        this.value = this.value.replace(/[^0-9]/g, ''); // Remove caracteres não numéricos
    });
    


    document.getElementById('mostrarInput').addEventListener('click', function() {
        var campoCategoria = document.getElementById('campoCategoria');
        var novaCategoriaInput = document.getElementById('novaCategoria');
        var categoriaSelect = document.getElementById('categoria');

        if (campoCategoria.classList.contains('hidden')) {
            campoCategoria.classList.remove('hidden');
            novaCategoriaInput.focus();
        } else {
            campoCategoria.classList.add('hidden');
            novaCategoriaInput.value = ""; // Limpa o campo quando escondido
        }

        // Quando o usuário terminar de digitar, adicionamos a nova opção ao select
        novaCategoriaInput.addEventListener('blur', function() {
            var novaCategoria = novaCategoriaInput.value.trim();
            if (novaCategoria !== '') {
                var option = document.createElement("option");
                option.text = novaCategoria;
                option.value = novaCategoria;
                categoriaSelect.add(option);
                categoriaSelect.value = novaCategoria;
            } else {
                // Se o campo da nova categoria estiver vazio, mantenha a categoria selecionada atual.
                novaCategoriaInput.value = categoriaSelect.value;
            }
        });
    });