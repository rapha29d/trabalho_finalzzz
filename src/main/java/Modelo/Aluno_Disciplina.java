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
public class Aluno_Disciplina {

    private Long codigo_aluno;
    private Long codigo_disciplina;
    private String matricula;
    
    public Long getCodigo_aluno() {
        return codigo_aluno;
    }

    public void setCodigo_aluno(Long codigo_aluno) {
        this.codigo_aluno = codigo_aluno;
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
        return "Aluno_Disciplina{" + "codigo_aluno=" + codigo_aluno + ", codigo_disciplina=" + codigo_disciplina + ", matricula=" + matricula + '}';
    }
    
    

}
