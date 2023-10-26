/**
 * 
 */

  function formatarValor(event) {
		const input = event.target;
		const valor = input.value.replace(/\D/g, ''); 
		const formattedValue = formatarMoeda(valor / 100);
		input.value = formattedValue.replace('R$', '').replace(/\s/g, '');
		}
											
	function formatarMoeda(value) {
	 const options = {
		style: 'currency',
		currency: 'BRL',
		minimumFractionDigits: 2,
		maximumFractionDigits: 2,
		useGrouping: true
		};
		const formatter = new Intl.NumberFormat('pt-BR', options);
		return formatter.format(value).replace(',', '.');
}