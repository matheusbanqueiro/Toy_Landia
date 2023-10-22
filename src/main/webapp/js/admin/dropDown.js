/**
 * 
 */

 	const menuIcon = document.getElementById("menuIcon");
	  const menuDropdown = document.getElementById("menuDropdown");
	
	  menuDropdown.style.display = "none"; // Inicialmente, ocultar o menu dropdown
	
	  menuIcon.addEventListener("click", function(e) {
	    e.stopPropagation(); // Impede o evento de clique de ser propagado para o documento
	    if (menuDropdown.style.display === "none") {
	      menuDropdown.style.display = "block";
	    } else {
	      menuDropdown.style.display = "none";
	    }
	  });
	
	  // Feche o menu quando clicar em qualquer parte do documento
	  document.addEventListener("click", function() {
	    menuDropdown.style.display = "none";
	  });