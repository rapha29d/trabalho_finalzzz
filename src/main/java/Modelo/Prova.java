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
public class Prova {

    long codigo=0;
    long codigo_usuario;
    int nmq;
    String data_cri;
    List<Questao> questoes;

    List<Long> categorias;
    private String categoriaS="";

    public String getCategoriaS() {
        return categoriaS;
    }

    public void setCategoriaS(String categoriaS) {
        this.categoriaS = categoriaS;
    }
    
    

    public List<Long> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Long> categorias) {
        this.categorias = categorias;
    }

    public int getNmq() {
        return nmq;
    }

    public void setNmq(int nmq) {
        this.nmq = nmq;
    }

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public long getCodigo_usuario() {
        return codigo_usuario;
    }

    public void setCodigo_usuario(long codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public List<Questao> getQuestao() {
        return questoes;
    }

    public void setQuestao(List<Questao> questao) {
        this.questoes = questao;
    }

    public String getData_cri() {
        return data_cri;
    }

    public void setData_cri(String data_cri) {
        this.data_cri = data_cri;
    }

    public List<Questao> getQuestoes() {
        return questoes;
    }

    public void setQuestoes(List<Questao> questoes) {
        this.questoes = questoes;
    }
    
    

    


}
