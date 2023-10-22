<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="br.edu.exemplo.model.Brinquedo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.exemplo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home | Toylandia</title>
<link rel="icon" type="image/svg+xml" href="imgs/toylandia1.svg">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background-color: var(--complement1);">
	<nav style="background-color: var(--complement1);"
		class="flex justify-between items-center flex top-0 w-full z-10">
		<a href="index.jsp" >
			<img  class="h-auto w-14 ml-4 py-4" src="imgs/toylandia1.svg" alt="Logo" />
		</a>
		<div>
			<ul class="flex space-x-6">
				<li><a href="index.jsp" class="nav-link font-semibold links ">Início</a></li>
				<li class="flex gap-2 justify-center items-center">
				  <a class="cursor-pointer links nav-link font-semibold" id="categoriasLink">Categorias</a>
				  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="links cursor-pointer text-purple-800 w-6 h-6" id="categoriasIcon">
				    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
				</svg>
				
					<%
				    BrinquedoDAO daoCategoria = new BrinquedoDAO();
				    List<String> categorias = daoCategoria.listarCategorias();
					%>
					
					<div class="top-14 absolute hidden bg-white text-gray-800 border border-purple-500 mt-2 py-2 w-48 rounded shadow-lg" id="dropdownContent">
					    <ul>
					    		<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Jogos" class="px-4 py-2 block w-full links cursor-pointer">Jogos</a>					        
					           	<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Bonecos" class="px-4 py-2 block w-full links cursor-pointer">Bonecos</a>					        
					           	<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Bebes" class="px-4 py-2 block w-full links cursor-pointer">Bebes</a>
					            <a href="ServletBrinquedo?cmd=listarCategoria&categoria=Esportes" class="px-4 py-2 block w-full links cursor-pointer">Esportes</a>					            
					             
					        <%
					            for (String categoria : categorias) {
					        %>
					        <li> 
					     		<a href="ServletBrinquedo?cmd=listarCategoria&categoria=<%= categoria %>" class="px-4 py-2 block w-full links cursor-pointer"><%= categoria %></a>
					        </li>
					        <%
					            }
					        %>
					    </ul> 
					</div>




				 
				<li><a href="#destaques"
					class="nav-link font-semibold links">Destaques</a></li>
				<li><a href="jsp/team.jsp"
					class="nav-link font-semibold links">Sobre nós</a></li>
			</ul>
		</div>
		<div>
			<ul class="flex space-x-6 mr-4">
				<li>
					<button
						class="buttons text-white hover:text-white font-bold py-2 px-4 rounded-full flex items-center"
						onclick="window.location.href = 'html/login.html';">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none"
							viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
							class="w-6 h-6 mr-2">
								<path stroke-linecap="round" stroke-linejoin="round"
								d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />
							</svg>

						Admin
					</button>
				</li>
			</ul>
		</div>
	</nav>
	
	



	
	 <div class="carousel-container">
	  <div class="carousel justify-center flex mt-8 flex-col">
	    <img src="imgs/image1.png" alt="banner1" class="carousel-image shadow-1xl rounded-xl object-cover object-center mx-auto">
	    <img src="imgs/image2.png" alt="banner2" class="carousel-image shadow-1xl rounded-xl object-cover object-center mx-auto">
	    <img src="imgs/image3.png" alt="banner3" class="carousel-image shadow-1xl rounded-xl object-cover object-center mx-auto">
	  </div>
	</div>

	

 
	
	<section class="container mx-auto mt-10 mb-10">
		<div style="color: var(--third);" class="text-2xl font-semibold text-center mb-10">Categorias Principais</div>
		<div class="flex space-x-4 mt-4 justify-center items-center">
			<div class="text-center gap-4">
				<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Jogos"
					class="buttons px-8 py-8 cursor-pointer mb-2 rounded-full flex justify-center items-center ">
					<img src="imgs/batalha.png" />
				</a> <a style="color: var(--third);"
					href="ServletBrinquedo?cmd=listarCategoria&categoria=Jogos"
					class="cursor-pointer font-semibold">Jogos</a>
			</div>
			<div class="text-center gap-4">
				<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Bonecos"
					class="buttons px-8 py-8 cursor-pointer mb-2  rounded-full flex justify-center items-center ">
					<img src="imgs/spider.png" />
				</a> <a style="color: var(--third);"
					href="ServletBrinquedo?cmd=listarCategoria&categoria=Bonecos"
					class="cursor-pointer font-semibold">Bonecos</a>
			</div>
			<div class="text-center gap-4">
				<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Bebes"
					class="buttons px-8 py-8 cursor-pointer mb-2 rounded-full flex justify-center items-center ">
					<img src="imgs/animais.png" />
				</a> <a style="color: var(--third);"
					href="ServletBrinquedo?cmd=listarCategoria&categoria=Bebes"
					class="cursor-pointer font-semibold">Bebês</a>
			</div>
			<div class="text-center gap-4">
				<a href="ServletBrinquedo?cmd=listarCategoria&categoria=Esportes"
					class="buttons px-8 py-8 cursor-pointer mb-2 rounded-full flex justify-center items-center ">
					<img src="imgs/patinete.png" />
				</a> <a style="color: var(--third);"
					href="ServletBrinquedo?cmd=listarCategoria&categoria=Esportes"
					class="cursor-pointer font-semibold">Esportes</a>
			</div>
		</div>


	</section>
		<div class="gap-8 flex justify-center py-10 items-center">
			<img  class="rounded-xl" src="imgs/empresas.png" alt="empresas" />
			<img  class="rounded-xl" src="imgs/empresas1.png" alt="anos no mercado" />
		</div>
		
	<section id="destaques" class="container mx-auto mt-8 mb-8 ">

	    <h2 style="color: var(--third);" class="text-2xl font-semibold mb-4">Destaques</h2>
	   <div class="w-full overflow-x-auto scroll-none  ">
	   		 <div class="w-auto flex gap-x-4 ">     
			<%
	        BrinquedoDAO dao = new BrinquedoDAO();
	        List<Brinquedo> brinquedosList = dao.listarTodos();
	        for (Brinquedo brinquedo : brinquedosList) {
	        %>
	     <div style="background-color: var(--fourth); min-width: 250px;" class="w-64 p-3 border rounded-2xl">
	    <img src="<%=brinquedo.getImage()%>" alt="<%=brinquedo.getNome()%>"
	        class="w-full h-32 bg-white object-contain mx-auto rounded-xl" />
	    <h3 style="color: var(--complement1);" class="text-lg font-semibold mt-4"><%=brinquedo.getNome()%></h3>
	    <p style="color: var(--complement1);" class="text-md">
	        <%=brinquedo.getMarca()%>
	    </p>
	   <% 
	        		float valorDesconto = brinquedo.getValor();
                  	
                  	if (valorDesconto >= 200 ){
                  		float valorFinal = valorDesconto - 100;
                 
	    		%>
	    				<div class="relative">
	    					<div title="Brinquedo com desconto" class="cursor-pointer absolute bottom-16 -left-3 p-2  rounded-r-lg shadow-lg left-0 bg-green-600  ">
	    						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class=" text-white w-6 h-6">
							  	<path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z" />
								</svg>
	    				
	    					</div>
	    				</div>
                         <p style="color: var(--fifth);" class="text-2xl font-semibold "> R$ <%=valorFinal %></p>
	        	 <%
                    } else {
                      %>
                         <p style="color: var(--fifth);" class="text-2xl font-semibold "> R$ <%=brinquedo.getValor() %></p>
                      <%
                     }
                  %>
	    <a href="ServletBrinquedo?cmd=con&codigo=<%=brinquedo.getCodigo()%>"
	        class="text-white flex justify-center py-2 px-2 rounded-full mt-4 text-center buttons">
	        Ver mais
	    </a>
	</div>

        <%
        }
        %>
    </div>
	   </div>
</section>


	
	<footer class="bottom-0 w-full" style="background-color: var(--third);">
		<div class="flex gap-12 justify-center items-center p-8">
			<div class="flex-col">
				<div class="flex gap-x-2">
					<p class="font-semibold flex text-white gap-4 mb-2">
					Contato
					</p>
					<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M3 3.9375C3 3.41973 3.41973 3 3.9375 3H5.95582C6.41411 3 6.80522 3.33132 6.88056 3.78338L7.57367 7.94201C7.64133 8.34797 7.4363 8.7506 7.06819 8.93466L5.61681 9.66035C6.66334 12.2609 8.73907 14.3367 11.3397 15.3832L12.0653 13.9318C12.2494 13.5637 12.652 13.3587 13.058 13.4263L17.2166 14.1194C17.6687 14.1948 18 14.5859 18 15.0442V17.0625C18 17.5803 17.5803 18 17.0625 18H15.1875C8.45653 18 3 12.5435 3 5.8125V3.9375Z" fill="#F4F4F4"/>
					</svg>
				</div>
				<p class=" text-white text-sm">Email: suporte@toylandia.com</p>
				<p class=" text-white text-sm">Telefone: (123) 456-7890</p>
			</div>
			<div class="flex-col ">
				<div class="flex gap-x-2 ">
					<p class="font-semibold flex text-white gap-4 mb-2">
					Localização
					</p>
					<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" clip-rule="evenodd" d="M6.05025 4.05025C8.78392 1.31658 13.2161 1.31658 15.9497 4.05025C18.6834 6.78392 18.6834 11.2161 15.9497 13.9497L11 18.8995L6.05025 13.9497C3.31658 11.2161 3.31658 6.78392 6.05025 4.05025ZM11 11C12.1046 11 13 10.1046 13 9C13 7.89543 12.1046 7 11 7C9.89543 7 9 7.89543 9 9C9 10.1046 9.89543 11 11 11Z" fill="#F4F4F4"/>
					</svg>
				</div>
				<p class=" text-white text-sm">Rua dos Brinquedos, 200 - Landia Nery</p>
				<p class=" text-white text-sm">CEP: 12345-678</p>
			</div>
			<div class="flex-col ">
				<div class="flex gap-x-2 ">
					<p class="font-semibold flex text-white gap-4 mb-2">
					Redes Sociais
					</p>
					<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5 18C14.6421 18 18 14.6421 18 10.5C18 6.35786 14.6421 3 10.5 3C6.35786 3 3 6.35786 3 10.5C3 14.6421 6.35786 18 10.5 18ZM5.18605 8.6507C5.53633 7.64401 6.1646 6.76748 6.97894 6.11302C7.23009 6.49656 7.66359 6.74992 8.15626 6.74992C8.93291 6.74992 9.56251 7.37952 9.56251 8.15617V8.62492C9.56251 9.66045 10.402 10.4999 11.4375 10.4999C12.473 10.4999 13.3125 9.66045 13.3125 8.62492C13.3125 7.74356 13.9206 7.00423 14.7402 6.80362C15.6026 7.79213 16.125 9.08502 16.125 10.4999C16.125 10.8194 16.0984 11.1327 16.0472 11.4376H15.1875C14.1519 11.4376 13.3125 12.2771 13.3125 13.3126V15.3724C12.4851 15.851 11.5245 16.1249 10.4999 16.1249V14.25C10.4999 13.2145 9.66045 12.375 8.62492 12.375C7.58939 12.375 6.74992 11.5355 6.74992 10.5C6.74992 9.57046 6.07351 8.7989 5.18605 8.6507Z" fill="#F4F4F4"/>
					</svg>
				</div>
				<div class="mb-4 flex-col items-center gap-x-4 justify-self-end">
					
				<div  class="flex items-center gap-x-4 justify-self-end">
					<svg width="21" height="19" viewBox="0 0 21 19" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M10.0583 6.33635C11.9074 6.33635 13.4075 7.75212 13.4075 9.49949C13.4075 11.2469 11.9084 12.6626 10.0583 12.6626C8.20814 12.6626 6.70908 11.2469 6.70908 9.49949C6.70908 7.75212 8.2092 6.33635 10.0583 6.33635ZM10.0583 4.58798C7.19103 4.58798 4.85786 6.79152 4.85786 9.49949C4.85786 12.2075 7.19103 14.411 10.0583 14.411C12.9256 14.411 15.2587 12.2075 15.2587 9.49949C15.2587 6.79152 12.9256 4.58798 10.0583 4.58798Z" fill="#F4F4F4"/>
					  <path d="M14.4927 1.74839C16.5769 1.74839 18.2664 3.34403 18.2664 5.31245V13.6875C18.2664 15.656 16.5769 17.2516 14.4927 17.2516H5.62494C3.54073 17.2516 1.85122 15.656 1.85122 13.6875V5.31245C1.85122 3.34403 3.54073 1.74839 5.62494 1.74839H14.4927ZM14.4927 0H5.62494C2.52362 0 0 2.38343 0 5.31245V13.6875C0 16.6166 2.52362 19 5.62494 19H14.4927C17.594 19 20.1176 16.6166 20.1176 13.6875V5.31245C20.1166 2.38343 17.594 0 14.4927 0Z" fill="#F4F4F4"/>
					  <path d="M16.7151 4.61174C16.8708 3.98904 16.4625 3.36504 15.8032 3.218C15.1438 3.07097 14.4831 3.45657 14.3275 4.07927C14.1718 4.70197 14.5801 5.32596 15.2394 5.473C15.8987 5.62004 16.5594 5.23444 16.7151 4.61174Z" fill="#F4F4F4"/>
					</svg>
					<svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M9.62576 1.63077C13.9642 1.63077 17.4804 5.12501 17.475 9.43376C17.4686 13.6718 13.9741 17.1723 9.7051 17.2144C8.10568 17.2305 6.61717 16.7695 5.37028 15.9694C5.33241 15.9452 5.28733 15.938 5.24406 15.9497L2.44013 16.6953L3.17763 13.96C3.18935 13.9152 3.18124 13.8687 3.15509 13.8302C2.28686 12.5763 1.77747 11.0592 1.77747 9.42303C1.77656 5.11876 5.29094 1.63077 9.62576 1.63077ZM9.62576 0C4.39206 0 0.134781 4.2273 0.134781 9.42213C0.134781 11.0798 0.566634 12.6828 1.39068 14.105C1.41142 14.1408 1.41774 14.1838 1.40692 14.2231L0.117645 19L5.00334 17.7004C5.04211 17.6897 5.08357 17.695 5.11873 17.7138C6.49906 18.4558 8.04257 18.8443 9.62666 18.8443C14.8604 18.8443 19.1176 14.617 19.1176 9.42213C19.1167 4.2264 14.8586 0 9.62576 0Z" fill="#F4F4F4"/>
					  <path d="M6.00591 5.12144C6.12762 5.06953 6.49907 5.03014 6.88585 5.0919C7.02831 5.11427 7.14912 5.21094 7.21042 5.34072C7.56835 6.09703 7.68736 6.39687 7.94341 6.97328C8.13094 7.39395 8.02456 7.88801 7.68556 8.20128C7.52868 8.34627 7.38172 8.48233 7.3168 8.54857C7.13108 8.74548 8.31125 11.0842 10.7536 11.7394C10.8681 11.7698 10.9917 11.7296 11.0674 11.6383C11.3144 11.3402 11.5516 11.0296 11.7968 10.7289C11.9176 10.5803 12.125 10.5293 12.3044 10.5991C13.114 10.9133 13.3466 11.0914 14.158 11.4055C14.3672 11.487 14.4727 11.6069 14.4727 11.8298C14.4736 12.544 14.2428 13.491 13.1411 13.8562C13.0256 13.8946 12.7335 13.9332 12.6298 13.9403C9.45807 14.1372 5.28193 10.822 4.85278 7.67859C4.85007 7.66337 4.85548 7.6938 4.85278 7.67859C4.73106 5.99501 5.70568 5.24853 6.00591 5.12144Z" fill="#F4F4F4"/>
					</svg>
					<svg width="14" height="23" viewBox="0 0 14 23" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M8.56065 6.44157V8.80813H12.1388L11.5625 12.7444H8.56065V22.037C7.96046 22.1136 7.34834 22.1505 6.72793 22.1505C5.93657 22.1505 5.16175 22.0896 4.4044 21.9705V12.7444H0.978844L1.04686 8.80813H4.40532V5.40373C4.40532 2.87929 6.66636 -0.0985044 12.1397 1.13971V4.4453L10.4789 4.47576C9.3318 4.49792 8.56065 5.28831 8.56065 6.44157Z" fill="#510087"/>
					  <path d="M6.72701 23C5.90257 23 5.0772 22.9363 4.27297 22.8098L3.5579 22.6971V13.5938H0.117645L0.214157 7.95865H3.5579V5.40373C3.5579 3.81465 4.26929 2.33174 5.51102 1.33452C6.64705 0.421331 8.75093 -0.497386 12.3245 0.311468L12.9844 0.461038V5.28001L10.4936 5.32618C9.81249 5.33911 9.40626 5.75645 9.40626 6.4425V7.95955H13.1176L12.2923 13.5948H9.40626V22.7867L8.66728 22.8809C8.03769 22.9594 7.3851 23 6.72701 23ZM5.24909 21.2244C6.06618 21.3093 6.90532 21.3232 7.71415 21.2669V11.8949H10.8309L11.159 9.65761H7.71415V6.44157C7.71415 4.81555 8.84376 3.6586 10.4614 3.62721L11.2923 3.61152V1.83777C9.28769 1.49982 7.66268 1.78051 6.56617 2.66139C5.72885 3.33451 5.24817 4.33449 5.24817 5.40465V9.65853H1.87499L1.83639 11.8958H5.24725V21.2244H5.24909Z" fill="#F4F4F4"/>
					</svg>
					<svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M2.40938 4.6231C3.67508 4.6231 4.70115 3.58819 4.70115 2.31156C4.70115 1.03493 3.67508 0 2.40938 0C1.14369 0 0.117645 1.03493 0.117645 2.31156C0.117645 3.58819 1.14369 4.6231 2.40938 4.6231Z" fill="#F4F4F4"/>
					  <path d="M4.34064 6.25478H0.485106V19H4.34064V6.25478Z" fill="#F4F4F4"/>
					  <path d="M10.5558 8.02143V6.25478H6.73324V19H10.5558V13.964C10.5558 11.7823 10.8454 10.7389 11.3667 10.1678C11.3767 10.1567 11.3866 10.1456 11.3976 10.1346C12.1925 9.26533 13.6764 9.12936 14.4243 9.9875C14.8357 10.4599 15.0404 11.1287 15.0365 11.9506V19H19.1176V12.285C19.1176 7.45136 17.3312 6.12787 15.0175 5.94758C14.9496 5.94254 14.8827 5.93752 14.8157 5.93147C13.5016 5.83075 11.6742 6.09565 10.5558 8.02143Z" fill="#F4F4F4"/>
					</svg>
					<svg width="16" height="19" viewBox="0 0 16 19" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M14.3842 4.47511C13.5318 4.2889 12.3895 3.71197 11.6782 2.48862C11.3047 1.848 11.0496 1.03082 11.0174 0.000428795C10.8067 -0.000535994 10.596 0.000428795 10.3853 0.000428795C9.60167 0.000428795 8.81721 0.00621753 8.03449 0.000428795C8.03449 0.144182 8.03449 0.288899 8.03449 0.432652C8.03449 0.432652 8.03451 0.432652 8.03364 0.432652C8.03625 1.39165 8.03623 2.35547 8.03449 3.32026C8.03014 5.58172 8.01969 7.85092 8.01621 10.1124C8.01447 11.0608 8.01449 12.0053 8.01536 12.9488C8.01449 13.7352 7.72279 14.4973 7.17863 15.001C6.75288 15.3936 6.20787 15.6281 5.61234 15.6281C4.67377 15.6281 3.8597 15.0424 3.44701 14.1847C3.26504 13.8056 3.16056 13.3714 3.16056 12.9112C3.16056 11.41 4.25847 10.1944 5.61234 10.1944C5.85961 10.1944 6.09903 10.2349 6.32366 10.3111V6.87358C6.09119 6.84078 5.85264 6.82148 5.61234 6.82148C5.60625 6.82148 5.59928 6.82244 5.59406 6.82244C2.56592 6.83209 0.117645 9.55473 0.117645 12.9112C0.117645 12.9884 0.11937 13.0646 0.121982 13.1408C0.12024 13.2084 0.117645 13.2759 0.117645 13.3444C0.117645 13.4322 0.119392 13.52 0.122874 13.6068C0.213422 15.9638 1.67872 17.9957 3.71692 18.6749C4.41954 18.9093 5.09863 19 5.61319 19C8.4228 19 10.7379 16.6623 11.067 13.6474C11.0827 13.5055 11.087 13.3637 11.0888 13.2209C11.1088 11.0502 11.1384 8.75203 11.1575 6.58994C13.127 7.77952 14.3999 7.80073 15.1155 7.75732C15.1225 6.68447 15.1094 5.61164 15.1155 4.53976C14.9205 4.55616 14.668 4.53685 14.3842 4.47511Z" fill="#F4F4F4"/>
					</svg>
					<svg width="21" height="15" viewBox="0 0 21 15" fill="none" xmlns="http://www.w3.org/2000/svg">
					  <path d="M19.8978 4.32205C19.8587 4.03455 19.8124 3.74606 19.7615 3.45953C19.7279 3.26786 19.6916 3.07719 19.6525 2.88649C19.6271 2.75937 19.5934 2.63419 19.5544 2.51391C19.5335 2.44839 19.509 2.38483 19.4844 2.32322C19.3082 1.88708 19.0429 1.51645 18.7122 1.21721C18.2471 0.797687 17.6538 0.515084 16.9961 0.422183C12.4701 -0.214432 8.00136 -0.061879 3.24189 0.422183C3.09926 0.436852 2.96116 0.464213 2.82762 0.499417C2.68226 0.537556 2.54237 0.589388 2.40883 0.650018C2.39702 0.654908 2.3861 0.659812 2.3752 0.664701C2.0536 0.805519 1.7638 0.988375 1.51216 1.21427C1.1951 1.49786 0.940733 1.84795 0.768124 2.2616C0.751771 2.29876 0.736327 2.33692 0.7227 2.37505C0.71089 2.40635 0.699978 2.43666 0.689076 2.46893L0.666365 2.53933L0.582792 2.86498C0.543728 3.05568 0.507416 3.24635 0.473803 3.43802C0.42202 3.72357 0.376596 4.01108 0.337532 4.30054C0.215797 5.17283 0.144906 6.05 0.12492 6.93011C0.122195 7.01226 0.120396 7.09538 0.120396 7.17948C0.11767 7.28314 0.117645 7.38486 0.117645 7.48851V7.51003C0.119462 7.61368 0.133127 7.89629 0.337532 10.6765C0.376596 10.964 0.42202 11.2525 0.473803 11.539C0.507416 11.7307 0.543728 11.9213 0.582792 12.112C0.60823 12.2391 0.64185 12.3643 0.680914 12.4846C0.701809 12.5501 0.72634 12.6137 0.750868 12.6753C0.927112 13.1114 1.19238 13.4821 1.52307 13.7813C1.9882 14.2008 2.58326 14.4844 3.23918 14.5764C7.76699 15.2149 12.2339 15.0624 16.9934 14.5764C17.1451 14.5617 17.2923 14.5314 17.4331 14.4913C17.4494 14.4883 17.4667 14.4825 17.4849 14.4776C17.6321 14.4346 17.7747 14.3768 17.911 14.3123C17.9201 14.3074 17.9291 14.3025 17.9382 14.2986C18.228 14.1637 18.4915 13.9916 18.7222 13.7842C19.0393 13.5007 19.2936 13.1506 19.4672 12.7369C19.4835 12.6998 19.499 12.6616 19.5126 12.6235C19.5244 12.5922 19.5353 12.5619 19.5462 12.5296C19.5535 12.5061 19.5617 12.4827 19.5689 12.4592L19.6525 12.1336C19.6916 11.9429 19.7279 11.7522 19.7615 11.5605C19.8133 11.2749 19.8587 10.9874 19.8978 10.698C20.0186 9.82569 20.0904 8.94852 20.1104 8.0684C20.1131 7.98626 20.1149 7.90313 20.1149 7.81903C20.1167 7.70853 20.1176 7.59804 20.1176 7.48851C20.1158 7.38486 20.1022 7.10321 19.8978 4.32205Z" fill="#F4F4F4"/>
					  <path d="M13.1315 7.47969C13.1469 7.48947 13.1469 7.51293 13.1315 7.52173L8.11311 10.6413C8.09767 10.651 8.07949 10.6393 8.07949 10.6197V4.38268C8.07949 4.3641 8.09857 4.35236 8.11311 4.36117L13.1315 7.47969Z" fill="#510087"/>
					</svg>
					<svg width="19" height="15" viewBox="0 0 19 15" fill="none" xmlns="http://www.w3.org/2000/svg">
				  <path d="M16.0582 2.35089C16.9061 1.79203 17.3063 1.44749 17.629 0.282667C17.629 0.282667 16.0874 1.17406 15.2687 1.17406C15.2568 1.17406 15.2422 1.17591 15.2286 1.17683C14.5521 0.452627 13.5949 0 12.5328 0C10.4824 0 8.82044 1.68396 8.82044 3.76143C8.82044 4.02839 8.84869 4.28887 8.90066 4.54013C8.88698 4.54752 8.8724 4.55583 8.85872 4.56322C4.79997 4.73965 1.31559 0.679853 1.31559 0.679853C0.0611342 3.30971 1.4633 4.96042 2.37861 5.76314C1.88631 5.69664 1.36391 5.60888 0.793207 5.3216C0.793207 6.15111 0.954553 8.1279 3.66768 9.02854C3.16626 9.15786 2.65667 9.08951 2.08232 9.08305C2.08232 9.08305 2.48253 11.47 5.46186 11.6935C4.09436 12.7613 2.622 13.3876 0.117645 13.2555C2.06862 14.3973 5.76909 16.1413 10.3566 13.953L11.1242 13.5059C14.1409 11.7462 16.0655 8.55097 16.2296 5.02786L16.2916 3.69215C17.0118 3.38455 17.8569 2.30839 18.1176 1.86223C17.3783 2.11903 16.8705 2.25667 16.0582 2.35089Z" fill="#F4F4F4"/>
				</svg>
				</div>
				</div>
			</div>
			<a href="index.jsp" >
				<img  class="h-auto w-20 ml-4" src="imgs/toylandia1.png" alt="Logo" />
			</a>
		</div>
		
		<div style="background-color: var(--fifth); color: var(--third);" class="p-2 w-full font-medium flex justify-center items-center">
		<p>© 2023 ToyLandia. Todos os direitos reservados.</p>
		</div>
	</footer>
	
	
	<script src="js/home/carrossel.js"></script>
	<script src="js/home/listCategoria.js"></script>

</body>
</html>
