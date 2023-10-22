package br.edu.exemplo.model;

public class Admin {
  private String nome;
  private String login;
  private String senha;
  

  public Admin(String nome, String login, String senha) {
    this.nome = nome;
    this.login = login;
    this.senha = senha;
    
  }

  public Admin() {}

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getLogin() {
    return login;
  }

  public void setLogin(String login) {
    this.login = login;
  }
  public void setSenha(String senha) {
	    this.senha = senha;
	  }
  public String getSenha() {
    return senha;
  }


}
