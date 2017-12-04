/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
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

    public Usuario(String nome,String login,String senha,String email) {
        
        this.login=login;
        this.nome=nome;
        this.senha=senha;
        this.email=email;
        
    }
    public Usuario(Long codigo,String nome,String login,String senha,String email) {
        this.codigo=codigo;
        this.login=login;
        this.nome=nome;
        this.senha=senha;
        this.email=email;
        
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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (int) (this.codigo ^ (this.codigo >>> 32));
        hash = 97 * hash + Objects.hashCode(this.login);
        hash = 97 * hash + Objects.hashCode(this.senha);
        hash = 97 * hash + Objects.hashCode(this.nome);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + Objects.hashCode(this.categorias);
        hash = 97 * hash + Objects.hashCode(this.prova);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Usuario other = (Usuario) obj;
        if (this.codigo != other.codigo) {
            return false;
        }
        if (!Objects.equals(this.login, other.login)) {
            return false;
        }
        if (!Objects.equals(this.senha, other.senha)) {
            return false;
        }
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.categorias, other.categorias)) {
            return false;
        }
        if (!Objects.equals(this.prova, other.prova)) {
            return false;
        }
        return true;
    }
    
    
    
    
    
    
    
    
    
}
