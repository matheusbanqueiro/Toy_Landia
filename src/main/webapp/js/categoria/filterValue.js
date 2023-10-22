/**
 * 
 */

 
 
function formatarValorMin(event) {
    const input = event.target;
    const valor = input.value.replace(/\D/g, ''); 
    input.value = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(valor / 100);
}

function formatarValorMax(event) {
    const input = event.target;
    const valor = input.value.replace(/\D/g, ''); 
    input.value = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(valor / 100);
}

function filtrarPorValor() {
    const valorMinInput = document.getElementById('valorMin');
    const valorMaxInput = document.getElementById('valorMax');
    const valorMin = parseFloat(valorMinInput.value.replace(',', '.').replace(/[^0-9.-]+/g, ""));
    const valorMax = parseFloat(valorMaxInput.value.replace(',', '.').replace(/[^0-9.-]+/g, ""));
   
    const brinquedos = document.querySelectorAll('.brinquedo-card');

    brinquedos.forEach(function(brinquedo) {
        const valor = parseFloat(brinquedo.getAttribute('data-valor'));
        if (valor >= valorMin && valor <= valorMax) {
            brinquedo.style.display = 'block';
        } else {
            brinquedo.style.display = 'none';
        }
    });
}
function limparPagina() {
    document.getElementById("valorMin").value = '';
    document.getElementById("valorMax").value = '';
    
    window.location.reload();
}