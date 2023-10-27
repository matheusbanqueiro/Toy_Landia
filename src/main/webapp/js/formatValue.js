/**
 * 
 */

function formatarValor(event) {
  const input = event.target;
  const valorFormatado = input.value; // Mantém o valor formatado
  let valor = input.value.replace(/\D/g, ''); // Remove tudo, exceto dígitos
  valor = valor.replace(/^0+/g, ''); // Remove zeros à esquerda
  valor = parseFloat(valor) / 100; // Divide por 100 para obter o valor correto

  const formattedValue = formatarMoeda(valor);
  input.value = formattedValue;

  // Armazene o valor sem formatação em um campo oculto para ser enviado ao servidor
  const valorSemFormatacaoInput = document.getElementById("valor");
  valorSemFormatacaoInput.value = valor.toFixed(2);
}



											
	function formatarMoeda(value) {
  const options = {
    style: 'decimal',
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
    useGrouping: true,
  };
  const formatter = new Intl.NumberFormat('pt-BR', options);
  return formatter.format(value);
}
