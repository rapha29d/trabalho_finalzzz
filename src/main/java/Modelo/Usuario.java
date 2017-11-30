/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author aluno
 */
@SessionScoped
@Named
public class Usuario implements Serializable {
    private long codigo;
    private String login;
    private String senha;
    private String nome;
    private String email;
    private List<Categoria> categorias;
    private Prova prova;

    public Usuario() {
        
    }

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long id) {
        this.codigo = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    public Prova getProva() {
        return prova;
    }

    public void setProva(Prova prova) {
        this.prova = prova;
    }
    
    
    
    
    
    

    @Override
    public String toString() {
        return nome;
    }
    
    public void release(){
        codigo=0;
        login=null;
        senha=null;
        email=null;
        categorias=null;
        prova=null;
    }
    
    
    
    
    
    
}
