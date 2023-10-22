package br.edu.exemplo.controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Um Servlet que recupera uma imagem de uma URL especificada e a envia como resposta.
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Manipula solicitações HTTP GET para recuperar e transmitir imagens de uma URL especificada.
     *
     * @param request  O objeto HttpServletRequest contendo os detalhes da solicitação.
     * @param response O objeto HttpServletResponse para enviar a imagem como resposta.
     * @throws ServletException Se ocorrer uma exceção do Servlet.
     * @throws IOException      Se ocorrer um erro de E/S ao lidar com a imagem.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imageUrl = request.getParameter("url");

        // Verifica se a URL da imagem foi especificada na solicitação.
        if (imageUrl == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("URL da imagem não especificada.");
            return;
        }

        try (InputStream in = new java.net.URL(imageUrl).openStream();
             OutputStream out = response.getOutputStream()) {

            // Lê a imagem da URL e a envia como resposta.
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Erro ao buscar a imagem: " + e.getMessage());
        }
    }
}

