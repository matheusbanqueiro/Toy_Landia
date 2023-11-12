package br.edu.exemplo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.edu.exemplo.model.Brinquedo;
import br.edu.exemplo.util.ConnectionFactory;

public class BrinquedoDAO {
	
	private Connection conn;  
	private PreparedStatement ps;  
	private ResultSet rs;  
	

	public BrinquedoDAO() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conexao
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	// metodo de salvar

	public void salvar(Brinquedo brinquedo) throws Exception {
	    if (brinquedo == null)
	        throw new Exception("O valor passado não pode ser nulo");

	    try (Connection conn = ConnectionFactory.getConnection();
	         PreparedStatement ps = conn.prepareStatement(
	            "INSERT INTO brinquedo (codigo, nome, categoria, marca, descricao, valor, image) VALUES (?, ?, ?, ?, ?, ?, ?)"
	         )
	    ) {
	        ps.setInt(1, brinquedo.getCodigo());
	        ps.setString(2, brinquedo.getNome());
	        ps.setString(3, brinquedo.getCategoria());
	        ps.setString(4, brinquedo.getMarca());
	        ps.setString(5, brinquedo.getDescricao());
	        ps.setFloat(6, brinquedo.getValor());
	        ps.setString(7, brinquedo.getImage()); 
	        ps.executeUpdate();
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao inserir dados " + sqle);
	    }
	}
	private String obterDescricaoAtualDoBancoDeDados(int codigo) throws Exception {
	    String descricaoAtual = null;

	    try (Connection conn = ConnectionFactory.getConnection();
	         PreparedStatement ps = conn.prepareStatement("SELECT descricao FROM brinquedo WHERE codigo=?")
	    ) {
	        ps.setInt(1, codigo);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            descricaoAtual = rs.getString("descricao");
	        }
	    }

	    return descricaoAtual;
	}

	public void atualizar(Brinquedo brinquedo) throws Exception {
	    if (brinquedo == null)
	        throw new Exception("O valor passado não pode ser nulo");

	    try {
	        String SQL;
	        if (brinquedo.getImage() != null && !brinquedo.getImage().isEmpty()) {
	            SQL = "UPDATE brinquedo SET nome=?, categoria=?, marca=?, descricao=?, valor=?, image=? WHERE codigo=?";
	        } else {
	            SQL = "UPDATE brinquedo SET nome=?, categoria=?, marca=?, descricao=?, valor=? WHERE codigo=?";
	        }

	        ps = conn.prepareStatement(SQL);

	        ps.setString(1, brinquedo.getNome());
	        ps.setString(2, brinquedo.getCategoria());
	        ps.setString(3, brinquedo.getMarca());

	        // Verificar se o campo de descrição no objeto Brinquedo é nulo
	        if (brinquedo.getDescricao() != null) {
	            ps.setString(4, brinquedo.getDescricao());
	        } else {
	            // Se for nulo, obter a descrição atual do banco de dados
	            String descricaoAtual = obterDescricaoAtualDoBancoDeDados(brinquedo.getCodigo());
	            ps.setString(4, descricaoAtual);
	        }

	        // Verificar se o campo de valor no objeto Brinquedo é diferente de zero
	        if (brinquedo.getValor() != 0) {
	            ps.setFloat(5, brinquedo.getValor());
	        } else {
	            // Se for zero, obter o valor atual do banco de dados
	            float valorAtual = obterValorAtualDoBancoDeDados(brinquedo.getCodigo());
	            ps.setFloat(5, valorAtual);
	        }

	        if (brinquedo.getImage() != null && !brinquedo.getImage().isEmpty()) {
	            ps.setString(6, brinquedo.getImage());
	            ps.setInt(7, brinquedo.getCodigo());
	        } else {
	            ps.setInt(6, brinquedo.getCodigo());
	        }

	        ps.executeUpdate();
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao alterar dados " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	}


	private float obterValorAtualDoBancoDeDados(int codigo) throws Exception {
	    float valorAtual = 0;

	    try (Connection conn = ConnectionFactory.getConnection();
	         PreparedStatement ps = conn.prepareStatement("SELECT valor FROM brinquedo WHERE codigo=?")
	    ) {
	        ps.setInt(1, codigo);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            valorAtual = rs.getFloat("valor");
	        }
	    }

	    return valorAtual;
	}


	public void excluir(Brinquedo brinquedo) throws Exception {
	    if (brinquedo == null)
	        throw new Exception("O valor passado não pode ser nulo");
	    
	    try (Connection conn = ConnectionFactory.getConnection();
	         PreparedStatement ps = conn.prepareStatement("DELETE FROM brinquedo WHERE codigo=?")
	    ) {
	        ps.setInt(1, brinquedo.getCodigo());
	        ps.executeUpdate();
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao excluir dados " + sqle);
	    }
	}

	public Brinquedo procurarBrinquedo(int codigo) throws Exception {
	    try {
	        String SQL = "SELECT * FROM brinquedo WHERE codigo=?";
	        ps = conn.prepareStatement(SQL);
	        ps.setInt(1, codigo);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            int codigoBrinquedo = rs.getInt("codigo");
	            String nome = rs.getString("nome");
	            String categoria = rs.getString("categoria");
	            float valor = rs.getFloat("valor");
	            String descricao = rs.getString("descricao");
	            String marca = rs.getString("marca");
	            String image = rs.getString("image");
	            return new Brinquedo(codigoBrinquedo, nome, categoria, marca, descricao, valor, image);
	        }
	        return null; // Retorna null se não encontrar o brinquedo com o código especificado
	    } catch (SQLException sqle) {
	        throw new Exception(sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	

	public List<Brinquedo> listarTodos() throws Exception {
	    try {
	        ps = conn.prepareStatement("SELECT * FROM brinquedo");
	        rs = ps.executeQuery();
	        List<Brinquedo> listaBrinquedos = new ArrayList<>();
	        while (rs.next()) {
	            int codigo = rs.getInt("codigo");
	            String nome = rs.getString("nome");
	            String categoria = rs.getString("categoria");
	            String marca = rs.getString("marca");
	            String descricao = rs.getString("descricao");
	            float valor = rs.getFloat("valor");  
	            String image = rs.getString("image");
	            
	            listaBrinquedos.add(new Brinquedo(codigo, nome, categoria, marca, descricao, valor, image));
	        }
	        return listaBrinquedos;
	    } catch (SQLException sqle) {
	        throw new Exception(sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	public List<Brinquedo> listarPorCategoria(String categoria) throws Exception {
	    try {
	        ps = conn.prepareStatement("SELECT * FROM brinquedo WHERE categoria = ?");
	        ps.setString(1, categoria); // Set the value of the 'categoria' placeholder
	        rs = ps.executeQuery();
	        List<Brinquedo> listaBrinquedos = new ArrayList<>();
	        while (rs.next()) {
	            int codigo = rs.getInt("codigo");
	            String nome = rs.getString("nome");
	            String marca = rs.getString("marca"); // Corrected the order
	            String categoria1 = rs.getString("categoria"); // Corrected the order
	            String descricao = rs.getString("descricao");
	            float valor = rs.getFloat("valor");
	            String image = rs.getString("image");

	            listaBrinquedos.add(new Brinquedo(codigo, nome, categoria1, marca, descricao, valor, image));
	        }
	        return listaBrinquedos;
	    } catch (SQLException sqle) {
	        throw new Exception(sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	public List<String> listarCategorias() throws Exception {
	    try {
	        PreparedStatement preparedStatement = conn.prepareStatement("SELECT DISTINCT categoria FROM brinquedo");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        List<String> categorias = new ArrayList<>();
	        while (resultSet.next()) {
	            String categoria = resultSet.getString("categoria");
	            if (!categoria.equalsIgnoreCase("jogos") &&
	                !categoria.equalsIgnoreCase("bebes") &&
	                !categoria.equalsIgnoreCase("esportes") &&
	                !categoria.equalsIgnoreCase("bonecos")) {
	                categorias.add(categoria);
	            }
	        }
	        return categorias;
	    } catch (SQLException sqle) {
	        // Log or handle the exception here
	        throw sqle;
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	 public Map<String, Integer> contarBrinquedosPorCategoria() throws Exception {
	        try {
	            ps = conn.prepareStatement("SELECT categoria, COUNT(*) as quantidade FROM brinquedo GROUP BY categoria");
	            rs = ps.executeQuery();
	            Map<String, Integer> categoriasQuantidade = new HashMap<>();
	            while (rs.next()) {
	                String categoria = rs.getString("categoria");
	                int quantidade = rs.getInt("quantidade");
	                categoriasQuantidade.put(categoria, quantidade);
	            }
	            return categoriasQuantidade;
	        } catch (SQLException sqle) {
	            throw new Exception(sqle);
	        } finally {
	            ConnectionFactory.closeConnection(conn, ps, rs);
	        }
	    }
}

