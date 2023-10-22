package br.edu.exemplo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;

import br.edu.exemplo.dao.AdminDAO;
import br.edu.exemplo.model.Admin;
import br.edu.exemplo.util.ConnectionFactory;

/**
 * Um Servlet que lida com autenticação de administradores.
 */
@WebServlet("/ServletAdmin")
public class ServeletAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Processa solicitações HTTP POST e GET relacionadas à autenticação de administradores.
     *
     * @param request  O objeto HttpServletRequest contendo os detalhes da solicitação.
     * @param response O objeto HttpServletResponse para enviar respostas.
     * @throws ServletException Se ocorrer uma exceção do Servlet.
     * @throws IOException      Se ocorrer um erro de E/S ao lidar com a solicitação ou resposta.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        try {
            Connection conn = ConnectionFactory.getConnection();
            if (conn != null) {
                AdminDAO adminDAO = new AdminDAO();

                boolean credenciaisValidas = adminDAO.verificarCredenciais(login, senha);

                conn.close();

                if (credenciaisValidas) {
                    String nome = adminDAO.obterNomePorLogin(login);
                    Admin admin = new Admin();
                    admin.setNome(nome);
                    admin.setLogin(login);
                    admin.setSenha(senha);
                   
                    // Armazena o objeto Admin na sessão
                    request.getSession().setAttribute("admin", admin);

                    System.out.printf("Login " + admin.getLogin() + " feito com sucesso!");
                   

                    response.sendRedirect("jsp/admin.jsp"); 
                } else {
                    System.out.println("Login ou senha incorretos!");
                    response.sendRedirect("html/login.html"); 
                }
            } else {
                response.getWriter().println("Erro ao conectar ao banco de dados.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erro: " + e.getMessage());
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
