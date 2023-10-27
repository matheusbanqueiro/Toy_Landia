/**
 * 
 */

 document.addEventListener("DOMContentLoaded", function() {
	var elementosValor = document.querySelectorAll(".valor-brinquedo");
													  
	elementosValor.forEach(function(elementoValor) {
			var valor = parseFloat(elementoValor.getAttribute("data-valor"));
			var valorFormatado = formatarValor(valor);
			elementoValor.textContent = valorFormatado;
	});
													  
	function formatarValor(valor) {
			const valorFormatado = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(valor);
			return valorFormatado;
	}});