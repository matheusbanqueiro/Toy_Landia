package br.edu.exemplo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.edu.exemplo.model.Admin;
import br.edu.exemplo.util.ConnectionFactory;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private Admin admin;

	public AdminDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}
	      
	    
	public boolean verificarCredenciais(String login, String senha) {
	    String query = "SELECT COUNT(*) FROM administracao WHERE login = ? AND senha = ?";
	    
	    try {
	        ps = conn.prepareStatement(query);
	        ps.setString(1, login);
	        ps.setString(2, senha);
	        
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            return count == 1; 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (ps != null) {
	                ps.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return false;
	}
	 public String obterNomePorLogin(String login) {
	        String query = "SELECT nome FROM administracao WHERE login = ?";
	        String nome = null;

	        try {
	            ps = conn.prepareStatement(query);
	            ps.setString(1, login);

	            rs = ps.executeQuery();

	            if (rs.next()) {
	                nome = rs.getString("nome");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (ps != null) {
	                    ps.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return nome;
	    }

}