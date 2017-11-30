/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.List;

/**
 *
 * @author raphael
 */
public class Questao {
    private Long codigo;
    private String pergunta;
    private String descricao;
    private Long codigo_categoria;
    private Long codigo_usuario;
    private List<Alternativa> alternativas;
    

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public List<Alternativa> getAlternativas() {
        return alternativas;
    }

    public void setAlternativas(List<Alternativa> alternativas) {
        this.alternativas = alternativas;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Long getCodigo_categoria() {
        return codigo_categoria;
    }

    public void setCodigo_categoria(Long codigo_categoria) {
        this.codigo_categoria = codigo_categoria;
    }

    public Long getCodigo_usuario() {
        return codigo_usuario;
    }

    public void setCodigo_usuario(Long codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    @Override
    public String toString() {
        return "Questao{" + "codigo=" + codigo + ", pergunta=" + pergunta + ", descricao=" + descricao + ", codigo_categoria=" + codigo_categoria + ", codigo_usuario=" + codigo_usuario + ", alternativas=" + alternativas + '}';
    }
    
    
    
    
    
    
}
