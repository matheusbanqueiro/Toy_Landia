/**
 * 
 */


	function mostrarListagem() {
    var tabela = document.getElementById("listagemTable");
    var adicionarForms = document.getElementById("adicionarForms");
	var dashboard = document.getElementById("dashboard");
    // Tornar a tabela de Listagem visível
    tabela.classList.remove("hidden");

    // Ocultar o formulário de Adicionar
    adicionarForms.classList.add("hidden");
    dashboard.classList.add("hidden");
     
    var dashboardTitle = document.getElementById("dashboardTitle");
    dashboardTitle.innerText = "Listagem";
}

function mostrarAdicionar() {
    var tabela = document.getElementById("listagemTable");
    var adicionarForms = document.getElementById("adicionarForms");
	var dashboard = document.getElementById("dashboard");
    // Tornar a tabela de Listagem invisível
    tabela.classList.add("hidden");
    adicionarForms.classList.remove("hidden");
    dashboard.classList.add("hidden");
    
    var dashboardTitle = document.getElementById("dashboardTitle");
    dashboardTitle.innerText = "Adicionar";
}
 
function mostrarGraficos() {
   	var tabela = document.getElementById("listagemTable");
    var adicionarForms = document.getElementById("adicionarForms");
	var dashboard = document.getElementById("dashboard");

	tabela.classList.add("hidden");
    adicionarForms.classList.add("hidden");
    dashboard.classList.remove("hidden");

    var dashboardTitle = document.getElementById("dashboardTitle");
    dashboardTitle.innerText = "Dashboard";
}





	
	 