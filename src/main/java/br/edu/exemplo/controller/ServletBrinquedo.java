package br.edu.exemplo.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.edu.exemplo.dao.BrinquedoDAO;
import br.edu.exemplo.model.Brinquedo;

/**
 * Um Servlet que lida com operações relacionadas a brinquedos, como inclusão, atualização, listagem e exclusão.
 */
@MultipartConfig
@WebServlet("/ServletBrinquedo")
public class ServletBrinquedo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Processa solicitações HTTP POST e GET relacionadas a operações de brinquedos.
     *
     * @param request  O objeto HttpServletRequest contendo os detalhes da solicitação.
     * @param response O objeto HttpServletResponse para enviar respostas.
     * @throws ServletException Se ocorrer uma exceção do Servlet.
     * @throws IOException      Se ocorrer um erro de E/S ao lidar com a solicitação ou resposta.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Brinquedo brinquedo = new Brinquedo();
        BrinquedoDAO dao;
        String cmd = request.getParameter("cmd");
        try {
        	// Verifica se a operação é de inclusão ou atualização de brinquedo.
        	if (cmd.equals("incluir") || cmd.equals("atualizar")) {
        	    // Obtém a URL base da aplicação.
        	    String uri = request.getRequestURL().toString();
        	    String baseURL = uri.substring(0, uri.length() - request.getRequestURI().length()) + request.getContextPath();

        	    // Obtém a parte (arquivo) enviada na solicitação chamada "image".
        	    Part file = request.getPart("image");

        	    // Obtém o nome do arquivo enviado.
        	    String imageFileName = file.getSubmittedFileName();

        	    // Verifica se um arquivo de imagem foi enviado.
        	    if (imageFileName != null && !imageFileName.isEmpty()) {
        	        // Define o caminho da imagem como a URL base da aplicação mais o caminho para a pasta "imgs" e o nome do arquivo.
        	        brinquedo.setImage(baseURL + "/imgs/" + imageFileName);

        	        // Define o caminho completo do upload no sistema de arquivos do servidor.
        	        String uploadFolder = getServletContext().getRealPath("/") + "imgs/" + imageFileName;

        	        // Realiza o upload do arquivo.
        	        try {
        	            FileOutputStream fos = new FileOutputStream(uploadFolder);
        	            InputStream is = file.getInputStream();
        	            byte[] data = new byte[is.available()];
        	            is.read(data);
        	            fos.write(data);
        	            fos.close();
        	        } catch (Exception e) {
        	            e.printStackTrace();
        	        }
        	    } else {
        	        // Se nenhum arquivo de imagem foi enviado, define uma imagem padrão.
        	        brinquedo.setImage("http://localhost:8080/SistemaAcademico-web/imgs/default1.png");
        	    }
        	}

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
        	// Cria uma instância do DAO para brinquedos.
        	dao = new BrinquedoDAO();

        	// Verifica o valor do parâmetro "cmd" para determinar a ação a ser executada.
        	if (cmd.equalsIgnoreCase("incluir")) {
        	    // Se a ação é "incluir", salva o brinquedo no banco de dados.
        	    dao.salvar(brinquedo);
        	    response.sendRedirect("jsp/admin.jsp#brinquedosTable");
        	} else if (cmd.equalsIgnoreCase("listar")) {
        	    // Se a ação é "listar", obtém a lista de todos os brinquedos e encaminha para a página "listagem".
        	    List<Brinquedo> brinquedosList = dao.listarTodos();
        	    request.setAttribute("brinquedosList", brinquedosList);
        	    request.getRequestDispatcher("jsp/admin.jsp#listagem").forward(request, response);
        	} else if (cmd.equalsIgnoreCase("listarCategoria")) {
        	    // Se a ação é "listarCategoria", obtém a lista de brinquedos por categoria e encaminha para a página "categoria".
        	    String categoria = request.getParameter("categoria");
        	    List<Brinquedo> brinquedosList = dao.listarPorCategoria(categoria);
        	    request.setAttribute("brinquedosList", brinquedosList);
        	    request.getRequestDispatcher("jsp/categoria.jsp").forward(request, response);
        	} else if (cmd.equalsIgnoreCase("atu")) {
        	    // Se a ação é "atu", procura um brinquedo pelo código e encaminha para a página de atualização.
        	    brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
        	    request.getSession(true).setAttribute("brinquedo", brinquedo);
        	    request.getRequestDispatcher("jsp/atualizarBrinquedo.jsp").forward(request, response);
        	} else if (cmd.equalsIgnoreCase("atualizar")) {
        	    // Se a ação é "atualizar", atualiza o brinquedo no banco de dados.
        	    dao.atualizar(brinquedo);
        	    response.sendRedirect("jsp/admin.jsp#listagem");
        	} else if (cmd.equalsIgnoreCase("con")) {
        	    // Se a ação é "con", procura um brinquedo pelo código e encaminha para a página de visualização.
        	    brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
        	    request.getSession(true).setAttribute("brinquedo", brinquedo);
        	    request.getRequestDispatcher("jsp/brinquedo.jsp").forward(request, response);
        	} else if (cmd.equalsIgnoreCase("con2")) {
        	    // Se a ação é "con2", procura um brinquedo pelo código e encaminha para a página de visualização alternativa.
        	    brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
        	    request.getSession(true).setAttribute("brinquedo", brinquedo);
        	    request.getRequestDispatcher("jsp/previewToy.jsp").forward(request, response);
        	} else if (cmd.equalsIgnoreCase("exc")) {
        	    // Se a ação é "exc", procura um brinquedo pelo código, exclui-o do banco de dados e redireciona para a página de listagem.
        	    brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
        	    request.getSession(true).setAttribute("brinquedo", brinquedo);
        	    dao.excluir(brinquedo);
        	    response.sendRedirect("jsp/admin.jsp#listagem");
        	}

        } catch (Exception e) {
            System.out.println("Erro ao gravar");
            System.out.println(e.getMessage());
        }
    }

    /**
     * Manipula solicitações HTTP GET chamando o método processRequest.
     *
     * @param request  O objeto HttpServletRequest contendo os detalhes da solicitação.
     * @param response O objeto HttpServletResponse para enviar respostas.
     * @throws ServletException Se ocorrer uma exceção do Servlet.
     * @throws IOException      Se ocorrer um erro de E/S ao lidar com a solicitação ou resposta.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Manipula solicitações HTTP POST chamando o método processRequest.
     *
     * @param request  O objeto HttpServletRequest contendo os detalhes da solicitação.
     * @param response O objeto HttpServletResponse para enviar respostas.
     * @throws ServletException Se ocorrer uma exceção do Servlet.
     * @throws IOException      Se ocorrer um erro de E/S ao lidar com a solicitação ou resposta.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
