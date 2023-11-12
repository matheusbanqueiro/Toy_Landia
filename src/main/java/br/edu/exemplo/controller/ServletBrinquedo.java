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

@MultipartConfig
@WebServlet("/ServletBrinquedo")
public class ServletBrinquedo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Brinquedo brinquedo = new Brinquedo();
		BrinquedoDAO dao;
		String cmd = request.getParameter("cmd");
		try {
			if (cmd.equals("incluir") || cmd.equals("atualizar")) {
				String uri = request.getRequestURL().toString();
				String baseURL = uri.substring(0, uri.length() - request.getRequestURI().length())
						+ request.getContextPath();

				Part file = request.getPart("image");

				String imageFileName = file.getSubmittedFileName();

				if (imageFileName != null && !imageFileName.isEmpty()) {
					brinquedo.setImage(baseURL + "/imgs/" + imageFileName);
					String uploadFolder = getServletContext().getRealPath("/") + "imgs/" + imageFileName;
					System.out.println(uploadFolder);
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
					if (request.getParameter("imagemAtual") != null) {
						brinquedo.setImage(request.getParameter("imagemAtual"));
					} else {
						brinquedo.setImage("http://localhost:8080/toylandia/imgs/default1.png");
					}
				}

				brinquedo.setCodigo(Integer.parseInt(request.getParameter("codigo")));
				brinquedo.setNome(request.getParameter("nome"));
				brinquedo.setCategoria(request.getParameter("categoria"));
				brinquedo.setMarca(request.getParameter("marca"));
				brinquedo.setValor(Float.parseFloat(request.getParameter("valor")));
				brinquedo.setDescricao(request.getParameter("descricao"));
				} else {
				brinquedo.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		try {
			dao = new BrinquedoDAO();
			if (cmd.equalsIgnoreCase("incluir")) {
				dao.salvar(brinquedo);
				response.sendRedirect("jsp/admin.jsp#adicionar");

			} else if (cmd.equalsIgnoreCase("listar")) {
				List<Brinquedo> brinquedosList = dao.listarTodos();
				request.setAttribute("brinquedosList", brinquedosList);
				request.getRequestDispatcher("jsp/admin.jsp#listagem").forward(request, response);

			} else if (cmd.equalsIgnoreCase("listarCategoria")) {
				String categoria = request.getParameter("categoria");
				List<Brinquedo> brinquedosList = dao.listarPorCategoria(categoria);
				request.setAttribute("brinquedosList", brinquedosList);
				request.getRequestDispatcher("jsp/categoria.jsp").forward(request, response);
			}

			else if (cmd.equalsIgnoreCase("atu")) {
				brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
				request.getSession(true).setAttribute("brinquedo", brinquedo);
				request.getRequestDispatcher("jsp/atualizarBrinquedo.jsp").forward(request, response);
			}

			else if (cmd.equalsIgnoreCase("atualizar")) {
				dao.atualizar(brinquedo);
				response.sendRedirect("jsp/admin.jsp#listagem");
			}

			else if (cmd.equalsIgnoreCase("con")) {
				brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
				request.getSession(true).setAttribute("brinquedo", brinquedo);
				request.getRequestDispatcher("jsp/brinquedo.jsp").forward(request, response);
			} else if (cmd.equalsIgnoreCase("con2")) {
				brinquedo = dao.procurarBrinquedo(brinquedo.getCodigo());
				request.getSession(true).setAttribute("brinquedo", brinquedo);
				request.getRequestDispatcher("jsp/previewToy.jsp").forward(request, response);
			} else if (cmd.equalsIgnoreCase("exc")) {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}