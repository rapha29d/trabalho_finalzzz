/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author raphael
 */
public class Disciplina {
    
    private Long codigo;
    private String nome;
    private Long codigo_usuario;
    private int qtdaulas;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Long getCodigo_usuario() {
        return codigo_usuario;
    }

    public void setCodigo_usuario(Long codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public int getQtdaulas() {
        return qtdaulas;
    }

    public void setQtdaulas(int qtdaulas) {
        this.qtdaulas = qtdaulas;
    }

    @Override
    public String toString() {
        return "Disciplina{" + "codigo=" + codigo + ", nome=" + nome + ", codigo_usuario=" + codigo_usuario + ", qtdaulas=" + qtdaulas + '}';
    }
    
    
      
    
}
