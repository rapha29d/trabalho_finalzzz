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
public class Alternativa {
    
    private Long codigo;
    private String alternativa;
    private Long codigo_questao;
    private int valor=0;
    private String[] alphabet={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getAlternativa() {
        return alternativa;
    }

    public void setAlternativa(String alternativa) {
        this.alternativa = alternativa;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return  alternativa ;
    }

    public Long getCodigo_questao() {
        return codigo_questao;
    }

    public void setCodigo_questao(Long codigo_questao) {
        this.codigo_questao = codigo_questao;
    }

    public String[] getAlphabet() {
        return alphabet;
    }

    public void setAlphabet(String[] alphabet) {
        this.alphabet = alphabet;
    }
    
    
    
    
    
    
}
