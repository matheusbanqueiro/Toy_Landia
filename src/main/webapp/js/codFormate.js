/**
 * 
 */

  
var codigo = document.getElementById("codigoBrinquedo").getAttribute("data-codigo");
    
var codigoFormatado = codigo.toString().replace(/(\d{3})(\d{3})(\d{2})/, "$1.$2-$3");
    
document.getElementById("codigoBrinquedo").textContent = codigoFormatado;
