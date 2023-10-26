<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="icon" type="image/svg+xml" href="imgs/toylandia1.png">
<link rel="stylesheet" href="css/style.css">
<title>Editar Brinquedos | Toylandia</title>
</head>
<body style="background-color: var(--third);">
	<jsp:useBean id="brinquedo" scope="session"
		class="br.edu.exemplo.model.Brinquedo" />

	
		 <h1 style="color: var(--complement1);" class="text-2xl font-semibold text-center mb-6 mt-6">Editar Brinquedos</h1>
		 
		<form action="ServletBrinquedo?cmd=atualizar" method="post"
			enctype="multipart/form-data"
			class="bg-white p-4 rounded-lg shadow-md max-w-xl mx-auto mb-10">
			
			
			
			
		<div class="mb-4 grid grid-cols-2 gap-4">
        <div class="flex items-center">
	        <div class="">
				   	 <label style="color: var(--fourth);" for="codigo" class="block text-sm font-semibold mb-2">Código (8 números)</label>
				     
				    
				     <input style="color: var(--fifth);" type="text" id="codigo" name="codigo" 
				        class="w-full px-3 py-2 border border-gray-300 rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500"
				       value="<%=brinquedo.getCodigo()%>" readonly="readonly">
				 
		    </div>     
		</div>


        <div>
            <label style="color: var(--fourth);" for="nome" class="block text-sm font-semibold mb-2">Nome</label>
            <input style="color: var(--fifth);" type="text" id="nome" name="nome" value="<%=brinquedo.getNome()%>"
                class="w-full px-3 py-2 border rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500">
        </div>
    </div>

    <div class="flex mb-4 gap-4">
        <div class="w-full ">
            <label style="color: var(--fourth);" for="categoria" class="block text-sm font-semibold text-gray-600 mb-2">Categoria</label>
            
            <select id="categoria" name="categoria"
					style="color: var(--fifth);" class="bg-white w-full px-3 py-2 border rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500">
					<option><%=brinquedo.getCategoria()%></option>
					<option value="jogos">Jogos</option>
					<option value="bonecos">Bonecos</option>
					<option value="bebes">Bebês</option>
					<option value="esportes">Esportes</option>
				</select>
				
           
        </div>


    </div>

    <div class="mb-4 grid grid-cols-2 gap-4">
        <div>
            <label style="color: var(--fourth);" for="marca" class="block text-sm font-semibold text-gray-600 mb-2">Marca</label>
            <input style="color: var(--fifth);" type="text" id="marca" name="marca" value="<%=brinquedo.getMarca()%>"
                class="w-full px-3 py-2 border border-purple-600 rounded-lg focus:outline-none focus:border-yellow-500">
        </div>

        <div>
		    <label style="color: var(--fourth);" for="valor" class="block text-sm font-semibold text-gray-600 mb-2">Valor</label>
		    <input style="color: var(--fifth)" type="text" id="valor" name="valor" value="<%=brinquedo.getValor()%>"
		        class="w-full px-3 py-2 border border-purple-600 rounded-lg focus:outline-none focus:border-yellow-500" 
		        >
		</div>

    </div>

   <div class="mb-4">
    	<label style="color: var(--fourth);" for="descricao" class="block text-sm font-semibold text-gray-600 mb-2">Descrição</label>
	    <textarea style="color: var(--fifth);" id="descricao" name="descricao" rows="4"
	        class="w-full px-3 py-2 border border-gray-300 rounded-lg border-purple-600 focus:outline-none focus:border-yellow-500 resize-none"
	        placeholder="Insira a descrição aqui..."><%=brinquedo.getDescricao()%></textarea>
	</div>
	<div class="mb-4">
			<label style="color: var(--fourth);" for="image" class="block font-semibold text-gray-800 ">Imagem
					Atual</label> <img src="<%=brinquedo.getImage()%>" alt="Imagem Atual"
					class=" w-40 h-40 mb-2">
	</div>
	<input type="hidden" name="imagemAtual" value="<%=brinquedo.getImage()%>">
     <div class="mb-4 rounded-lg">
    <label style="color: var(--fourth);" for="image" class="block text-sm font-semibold text-gray-600 mb-2">Nova imagem</label>
    <div style="color: var(--fourth);" id="dropzone" class="p-4 bg-white border border-purple-600 rounded-lg cursor-pointer gap-4 flex justify-center items-center dropzone">
        <svg width="30" height="30" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1 13L1 14C1 15.6569 2.34315 17 4 17L14 17C15.6569 17 17 15.6569 17 14L17 13M13 9L9 13M9 13L5 9M9 13L9 1" stroke="#F440C7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Arraste uma imagem aqui ou clique para selecionar.
    </div>
    <input style="display: none;" type="file" id="image" name="image" accept="image/*">
    <div style="color: var(--third);" id="file-name" class="text-gray-600 text-sm mt-2"></div>
</div>

    	<div class="gap-8 flex flex-col">
			<button type="submit" value="Enviar"
				class="text-white py-2 px-4 rounded-full buttons w-full">Editar
				Brinquedo</button>
				<a href="jsp/admin.jsp#listagem" class=" text-center w-full text-white links rounded-lg">Voltar à administração</a>
		</div>
		</form>
	<script src="js/admin/uploadImage.js"></script>
</body>
</html>
