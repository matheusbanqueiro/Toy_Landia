<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page import="br.edu.exemplo.model.Brinquedo"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.exemplo.dao.BrinquedoDAO"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="stylesheet" href="../css/style.css">
	<link rel="icon" type="image/svg+xml" href="../imgs/toylandia1.png">
<title>Administração | Toylandia</title>

<style>
</style>
</head>

<body style="background-color: var(--complement1);"
	class="flex flex-col min-h-screen">
	<jsp:useBean id="admin" scope="session"
		class="br.edu.exemplo.model.Admin" />

	<nav style="color: var(--third);" class="p-0">
		<div style="color: var(--third);" class="flex items-center justify-between p-3">
		        <img src="../imgs/toylandia1.png" alt="Logo Toylandia" class="h-12">
			<h1 class="text-xl font-semibold">
				Olá,
				<%=admin.getNome()%>
			</h1>
			<div class="flex items-center space-x-4">
		<svg class="cursor-pointer" id="menuIcon" width="22" height="24" viewBox="0 0 14 16" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M2 4C0.89543 4 -4.82823e-08 3.10457 0 2C4.82823e-08 0.89543 0.895431 -4.82823e-08 2 0C3.10457 4.82823e-08 4 0.895431 4 2C4 3.10457 3.10457 4 2 4Z" fill="#510087"/>
  <path d="M2 10C0.89543 10 -4.82823e-08 9.10457 0 8C4.82823e-08 6.89543 0.895431 6 2 6C3.10457 6 4 6.89543 4 8C4 9.10457 3.10457 10 2 10Z" fill="#510087"/>
  <path d="M2 16C0.89543 16 -4.82823e-08 15.1046 0 14C4.82823e-08 12.8954 0.895431 12 2 12C3.10457 12 4 12.8954 4 14C4 15.1046 3.10457 16 2 16Z" fill="#510087"/>
  <path d="M7 4C5.89543 4 5 3.10457 5 2C5 0.89543 5.89543 -4.82823e-08 7 0C8.10457 4.82823e-08 9 0.895431 9 2C9 3.10457 8.10457 4 7 4Z" fill="#510087"/>
  <path d="M7 10C5.89543 10 5 9.10457 5 8C5 6.89543 5.89543 6 7 6C8.10457 6 9 6.89543 9 8C9 9.10457 8.10457 10 7 10Z" fill="#510087"/>
  <path d="M7 16C5.89543 16 5 15.1046 5 14C5 12.8954 5.89543 12 7 12C8.10457 12 9 12.8954 9 14C9 15.1046 8.10457 16 7 16Z" fill="#510087"/>
  <path d="M12 4C10.8954 4 10 3.10457 10 2C10 0.89543 10.8954 -4.82823e-08 12 0C13.1046 4.82823e-08 14 0.895431 14 2C14 3.10457 13.1046 4 12 4Z" fill="#510087"/>
  <path d="M12 10C10.8954 10 10 9.10457 10 8C10 6.89543 10.8954 6 12 6C13.1046 6 14 6.89543 14 8C14 9.10457 13.1046 10 12 10Z" fill="#510087"/>
  <path d="M12 16C10.8954 16 10 15.1046 10 14C10 12.8954 10.8954 12 12 12C13.1046 12 14 12.8954 14 14C14 15.1046 13.1046 16 12 16Z" fill="#510087"/>
</svg>

            <img src="../imgs/<%= admin.getLogin() %>" alt="Foto do perfil" class="w-10 h-10 rounded-full"></div>
   
  <div  class="z-50 hidden absolute right-20 top-14 mt-2" id="menuDropdown" >
    <div  class="bg-gray-100 rounded-lg shadow-md p-4 text-center">
        <div  class="mb-4 gap-4 grid grid-cols-2">
            <a style="color: var(--third);" href="#dashboard" class="transition-transform transform hover:translate-y-1  text-sm flex flex-col items-center " onclick="mostrarGraficos()" aria-current="page">
                <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mb-2">
                    <path d="M9 1.05493C4.50005 1.55238 1 5.36745 1 10C1 14.9706 5.02944 19 10 19C14.6326 19 18.4476 15.5 18.9451 11H9V1.05493Z" stroke="#510087" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M18.4878 7H13V1.5123C15.5572 2.41613 17.5839 4.44285 18.4878 7Z" stroke="#510087" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                Dashboard
            </a>

            <a style="color: var(--third);" href="#listagem" id="mostrarListagem" class="transition-transform transform hover:translate-y-1  text-sm flex flex-col items-center " onclick="mostrarListagem()">
                <svg viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mb-2">
                    <path d="M1 1H17M1 5H17M1 9H17M1 13H17" stroke="#510087" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                Listagem
            </a>
        </div>
        <div class="gap-4 grid grid-cols-2">
           <a style="color: var(--third);" href="#mostrarAdicionar" class="transition-transform transform hover:translate-y-1 text-sm flex flex-col items-center" onclick="mostrarAdicionar()">
		    <svg viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mb-2">
		        <path d="M10 7V10M10 10V13M10 10H13M10 10H7M19 10C19 14.9706 14.9706 19 10 19C5.02944 19 1 14.9706 1 10C1 5.02944 5.02944 1 10 1C14.9706 1 19 5.02944 19 10Z" stroke="#510087" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
		    </svg>
		    Adicionar
		</a>

            <a href="../index.jsp" class="transition-transform transform hover:translate-y-1  text-sm flex flex-col items-center text-sm flex flex-col items-center text-gray-700 text-red-600 hover:text-red-700">
                <svg width="20" height="18" viewBox="0 0 20 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mb-2">
				  <path d="M15 13L19 9M19 9L15 5M19 9L5 9M11 13V14C11 15.6569 9.65686 17 8 17H4C2.34315 17 1 15.6569 1 14V4C1 2.34315 2.34315 1 4 1H8C9.65686 1 11 2.34315 11 4V5" stroke="#ef4444" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
                Sair
            </a>
        </div>
    </div>
</div>

    </div>

	</nav>

	<header style="background-color: var(--third);" class="shadow">
		<div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
			<h1 id="dashboardTitle" style="color: var(--complement1);"
				class="text-3xl font-bold tracking-tight">Dashboard</h1>
		</div>
	</header>
	
	<!--Dashboard Brinquedo-->
	
<div id="dashboard" class="mt-10 ">
<%
    BrinquedoDAO brinquedoDAO = new BrinquedoDAO();
    Map<String, Integer> categoriasQuantidade = brinquedoDAO.contarBrinquedosPorCategoria();
    
    if (categoriasQuantidade != null && !categoriasQuantidade.isEmpty()) {
%>
    <div class="mx-auto w-3/4">     
            <div class="w-1/2">
            <h2 class="text-lg font-semibold mb-4">Quantidade Brinquedos por Categoria</h2>
                <canvas id="graficoCategorias" class="shadow-lg rounded-lg"></canvas>
            </div>          
        </div>
    </div>

    <script>
        var ctx = document.getElementById('graficoCategorias').getContext('2d');

        var categorias = [];
        var quantidades = [];

        <% for (Map.Entry<String, Integer> entry : categoriasQuantidade.entrySet()) { %>
            categorias.push('<%= entry.getKey() %>');
            quantidades.push('<%= entry.getValue() %>');
        <% } %>

        var data = {
            labels: categorias,
            datasets: [{
                data: quantidades,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                    'rgba(255, 159, 64, 0.6)',
                    'rgba(100, 200, 100, 0.6)'
                ]
            }]
        };

        var options = {
            cutout: '70%', // Controla o tamanho do buraco no gráfico (90% cria um gráfico de rosca)
            responsive: true // Evita redimensionamento responsivo
        };

        var myChart = new Chart(ctx, {
            type: 'doughnut', // Use 'doughnut' para criar um gráfico de rosca
            data: data,
            options: options
        });
    </script>

<% } else { %>
	<div class="flex justify-center items-center ">
        <div style="border: 0.2px solid var(--third);" class="rounded-lg bg-white shadow-lg p-8 max-w-md text-center">
            <img class="mx-auto w-70 h-70" src="../imgs/animation.gif" alt="Animação" />
            <p style="color: var(--fourth);" class="mt-10 font-semibold" >Não Temos informações completas para a exibição do gráfico.</p>
            <p style="color: var(--fifth);" class="mb-8">Por favor, aguarde!</p>
        </div>
    </div>
<% } %>
</div>



	<!-- ... Modal Cancelamento  ... -->
<div id="myModal" class="z-50 hidden absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
    <div style="background-color: var(--complement1);" class="modal-content flex flex-col items-center justify-center relative transform overflow-hidden rounded-lg bg-white text-center shadow-2xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
        <div class="px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
            <div class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:h-10 sm:w-10">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-6 w-6 text-red-600">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                </svg>
            </div>
            <div class="mt-3">
                <h3 class="text-base font-semibold leading-6 text-gray-900 mb-2" id="modal-title">Exclusão</h3>
                <p class="text-sm text-gray-500">Deseja excluir o brinquedo?</p>
                <div class="mt-2 mb-2">
                   <span id="codigoDoProduto">Código</span>
                </div>
            </div>
        </div>
        <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
            <button type="button" id="confirmDeleteButton" class="w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white hover:bg-red-700 sm:ml-3 sm:w-auto transition-transform transform hover:translate-y-1">Confirmar</button>
            <button type="button" onclick="fecharModalExclusao()" class="mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto transition-transform transform hover:translate-y-1">Cancelar</button>
        </div>
    </div>
</div>
	<!-- ... Listagem Brinquedos  ... -->

	<div class="p-10 hidden table-container" id="listagemTable">
	
	<div class="py-4 flex flex-col items-center justify-center">
		<div class="relative mb-4 items-center justify-center">
			<input style="background-color: var(--complement1); color: var(--fifth);" onkeyup="filtrarBrinquedos()" type="text" id="txtPesquisa"
				placeholder="Código, nome, categoria e marca"
				class="w-80 px-10 py-2 text-sm text-gray-900 placeholder-gray-400 border rounded-full border-purple-600 focus:outline-none focus:border-yellow-500">
				
			<button type="submit" class="absolute left-4 top-0 mt-2 mr-3">
				<svg class="w-4 h-4 text-purple-900 justify-center items-center"
					aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
					viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
            </svg>
			</button>
		</div>
		
	</div>
	
	    <table id="tabelaBrinquedos" class="w-full min-w-full divide-y divide-gray-200">
				<thead  style="color: var(--complement1)" >
					<tr style="background-color: var(--fourth)" >
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase ">Image</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase " >Código</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase ">Nome</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold  uppercase ">Categoria</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase ">Marca</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase ">Valor</th>
						<th scope="col"
							class="px-6 py-3 text-center text-xs font-semibold uppercase ">Ações</th>
					</tr>
				</thead>
				<tbody style="background-color: var(--complement1); color: var(--fourth)" >
					<%
					BrinquedoDAO dao = new BrinquedoDAO();
					List<Brinquedo> brinquedosList = dao.listarTodos();
					for (Brinquedo brinquedo : brinquedosList) {
					%>
					<tr
							class="border-b-2 border-gray-300 transition-colors hover:bg-gray-200">
						<td class="px-6 py-4 flex justify-center items-center whitespace-nowrap">
						    <img src="<%=brinquedo.getImage()%>" alt="Brinquedo" class="h-12 w-12 mx-auto rounded-sm">
						</td>
						<td class="px-6 py-4 text-center whitespace-nowrap"><%=brinquedo.getCodigo()%></td>
						<td class="px-6 py-4 text-center whitespace-nowrap"><%=brinquedo.getNome()%></td>
						<td class="px-6 py-4 text-center whitespace-nowrap"><%=brinquedo.getCategoria()%></td>
						<td class="px-6 py-4 text-center whitespace-nowrap"><%=brinquedo.getMarca()%></td>
						<td class="px-6 py-4 text-center whitespace-nowrap">R$ <%=brinquedo.getValor()%></td>
						<td class="px-2 py-4 text-center whitespace-nowrap">
							<div class="justify-center text-center flex">
							    <a onclick="mostrarModalExclusao('<%=brinquedo.getCodigo()%>')"
							        class="py-2 px-4 cursor-pointer rounded-lg flex items-center justify-center transition-transform transform hover:translate-y-1"
							        title="Excluir Brinquedo">
							        <svg width="22" height="25" viewBox="0 0 22 25" fill="none" xmlns="http://www.w3.org/2000/svg"
							            class="w-6 h-6 mr-2">
							            <path
							                d="M19.75 6L18.6658 21.1781C18.5724 22.4864 17.4838 23.5 16.1722 23.5H5.8278C4.5162 23.5 3.4276 22.4864 3.33415 21.1781L2.25 6M8.5 11V18.5M13.5 11V18.5M14.75 6V2.25C14.75 1.55964 14.1904 1 13.5 1H8.5C7.80964 1 7.25 1.55964 7.25 2.25V6M1 6H21"
							                stroke="red" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
							        </svg>
							    </a>
							    <a href="../ServletBrinquedo?cmd=atu&codigo=<%=brinquedo.getCodigo()%>"
							        class="py-2 px-4 rounded-lg flex items-center justify-center transition-transform transform hover:translate-y-1"
							        title="Atualizar Brinquedo">
							        <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
							            xmlns="http://www.w3.org/2000/svg">
							            <path
							                d="M1 1V6H1.58152M16.9381 8C16.446 4.05369 13.0796 1 9 1C5.64262 1 2.76829 3.06817 1.58152 6M1.58152 6H6M17 17V12H16.4185M16.4185 12C15.2317 14.9318 12.3574 17 9 17C4.92038 17 1.55399 13.9463 1.06189 10M16.4185 12H12"
							                stroke="blue" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
							        </svg>
							    </a>
							    <a href="../ServletBrinquedo?cmd=con2&codigo=<%=brinquedo.getCodigo()%>" class="py-2 px-4 text-pink-600 cursor-pointer rounded-lg flex items-center justify-center transition-transform transform hover:translate-y-1"
							        title="Ver Brinquedo">
							        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
							            stroke="currentColor" class="w-6 h-6">
							            <path stroke-linecap="round" stroke-linejoin="round"
							                d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
							            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
							        </svg>
							    </a>
							</div>
	
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
	</div>
	
		<!-- ... Adicionar brinquedo  ... -->
	
	<div class="hidden mt-10 mb-10" id="adicionarForms">
	  <form action="../ServletBrinquedo?cmd=incluir" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded-lg shadow-md max-w-lg mx-auto">
    <input type="hidden" name="cmd" value="incluir">

    <div class="mb-4 grid grid-cols-2 gap-4">
        <div class="flex items-center">
	        <div class="">
				   	 <label style="color: var(--fourth);" for="codigo" class="block text-sm font-semibold mb-2">Código (8 números)</label>
				     
				    
				     <input style="color: var(--fifth);" type="text" id="codigo" name="codigo" required
				        class="w-full px-3 py-2 border border-gray-300 rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500"
				        maxlength="8" pattern="[0-9]{8}">
				 
		    </div>     
		</div>


        <div>
            <label style="color: var(--fourth);" for="nome" class="block text-sm font-semibold mb-2">Nome</label>
            <input style="color: var(--fifth);" type="text" id="nome" name="nome" required
                class="w-full px-3 py-2 border rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500">
        </div>
    </div>

    <div class="flex mb-4 gap-4">
        <div class="w-full ">
            <label style="color: var(--fourth);" for="categoria" class="block text-sm font-semibold text-gray-600 mb-2">Categoria</label>
            <%
				BrinquedoDAO daoCategoria = new BrinquedoDAO();
				List<String> categorias = daoCategoria.listarCategorias();
			%>
            <select id="categoria" name="categoria" required
                style="color: var(--fifth);" class="bg-white w-full px-3 py-2 border rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500">
                <option style="color: var(--fifth);" value="jogos">Jogos</option>
                <option value="bonecos">Bonecos</option>
                <option value="bebes">Bebês</option>
                <option value="esportes">Esportes</option>
                <%
                for (String categoria : categorias) {
                %>
                <option value="<%= categoria %>"><%= categoria %></option>
                <%
                }
                %>
            </select>
            <a id="mostrarInput" class="text-sm links cursor-pointer">adicionar nova categoria</a>
        </div>

        <div class="hidden" id="campoCategoria">
            <label style="color: var(--fourth);" for="novaCategoria" class="block text-sm font-semibold text-gray-600 mb-2">Nova Categoria</label>
            <input style="color: var(--fifth);" type="text" id="novaCategoria" name="novaCategoria"
                class="w-full px-3 py-2 border border-purple-600 rounded-lg focus:outline-none focus:border-yellow-500">
        </div>
    </div>

    <div class="mb-4 grid grid-cols-2 gap-4">
        <div>
            <label style="color: var(--fourth);" for="marca" class="block text-sm font-semibold text-gray-600 mb-2">Marca</label>
            <input style="color: var(--fifth);" type="text" id="marca" name="marca" required
                class="w-full px-3 py-2 border border-purple-600 rounded-lg focus:outline-none focus:border-yellow-500">
        </div>

        <div>
		    <label style="color: var(--fourth);" for="valor" class="block text-sm font-semibold text-gray-600 mb-2">Valor</label>
		    <input style="color: var(--fifth)" type="text" id="valor" name="valor" required
		        class="w-full px-3 py-2 border border-purple-600 rounded-lg focus:outline-none focus:border-yellow-500" 
		        >
		</div>

    </div>

   <div class="mb-4">
    	<label style="color: var(--fourth);" for="descricao" class="block text-sm font-semibold text-gray-600 mb-2">Descrição</label>
	    <textarea style="color: var(--fifth);" id="descricao" name="descricao" rows="4"
	        class="w-full px-3 py-2 border border-gray-300 rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500 resize-none"
	        placeholder="Insira a descrição aqui..."></textarea>
	</div>


      <div class="mb-4  rounded-lg">
        <label style="color: var(--fourth);" for="image" class="block text-sm font-semibold text-gray-600 mb-2">Imagem</label>
        <div style="color: var(--fourth);" id="dropzone" class="p-4  bg-white border border-purple-600 rounded-lg cursor-pointer gap-4 flex justify-center items-center dropzone">
           <svg width="30" height="30" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
			  <path d="M1 13L1 14C1 15.6569 2.34315 17 4 17L14 17C15.6569 17 17 15.6569 17 14L17 13M13 9L9 13M9 13L5 9M9 13L9 1" stroke="#F440C7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
			</svg>
            Arraste uma imagem aqui ou clique para selecionar.
        </div>
        <input style="display: none;" type="file" id="image" name="image" accept="image/*">
        <div style="color: var(--third);" id="file-name" class="text-gray-600 text-sm mt-2"></div>
    </div>

    <button type="submit"
        class="text-white py-2 px-4 rounded-lg buttons w-full">Cadastrar Brinquedo</button>
</form>



	</div>
		
		
	
	

	<script src="../js/admin/dropDown.js"></script>
	<script src="../js/admin/modalDelete.js"></script>
	<script src="../js/admin/showDashboard.js"></script>
	<script src="../js/admin/forms.js"></script>
	<script src="../js/admin/uploadImage.js"></script>
	<script src="../js/admin/formatarTabela.js"></script>
	
    

	
</body>

</html>
