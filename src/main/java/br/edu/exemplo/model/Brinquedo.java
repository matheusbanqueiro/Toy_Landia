package br.edu.exemplo.model;

public class Brinquedo {

    private int codigo;
    private String nome;
    private String categoria;
    private String marca;
    private float valor;
    private String descricao;
    private String image; 

    public Brinquedo(int codigo, String nome, String categoria, String marca, String descricao, float valor, String image) {
        this.codigo = codigo;
        this.nome = nome;
        this.categoria = categoria;
        this.marca = marca;
        this.valor = valor;
        this.descricao = descricao;
        this.image = image;
       
    }

    public Brinquedo() {
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
