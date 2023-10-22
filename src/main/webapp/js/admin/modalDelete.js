/**
 * 
 */

 function mostrarModalExclusao(codigo) {
	    document.getElementById("confirmDeleteButton").setAttribute(
	      "data-codigo", codigo);
	    document.getElementById("codigoDoProduto").textContent = codigo;
	    document.getElementById("myModal").style.display = "block";
	  }
	
	  function fecharModalExclusao() {
	    document.getElementById("myModal").style.display = "none";
	  }
	
	  document
	    .getElementById("confirmDeleteButton")
	    .addEventListener(
	      "click",
	      function() {
	        var codigo = this.getAttribute("data-codigo");
	        window.location.href = "../ServletBrinquedo?cmd=exc&codigo="
	          + codigo;
	      });