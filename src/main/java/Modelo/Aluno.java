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
public class Aluno {
    
    private Long codigo_aluno;
    private Long codigo_disciplina;
    private String matricula;

    public Long getCodigo() {
        return codigo_aluno;
    }

    public void setCodigo(Long codigo) {
        this.codigo_aluno = codigo;
    }

    public Long getCodigo_disciplina() {
        return codigo_disciplina;
    }

    public void setCodigo_disciplina(Long codigo_disciplina) {
        this.codigo_disciplina = codigo_disciplina;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    @Override
    public String toString() {
        return  matricula;
    }
    
    
    
    
    
}
