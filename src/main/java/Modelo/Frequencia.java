/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Objects;

/**
 *
 * @author raphael
 */
public class Frequencia {
    
     private Long codigo;
     private int qtdaulas;
     private String dataAula;
     private String matricula;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public int getQtdaulas() {
        return qtdaulas;
    }

    public void setQtdaulas(int qtdaulas) {
        this.qtdaulas = qtdaulas;
    }

    public String getDataAula() {
        return dataAula;
    }

    public void setDataAula(String dataAula) {
        this.dataAula = dataAula;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    @Override
    public int hashCode() {
        int hash = 7;
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
        final Frequencia other = (Frequencia) obj;
        if (this.qtdaulas != other.qtdaulas) {
            return false;
        }
        if (!Objects.equals(this.dataAula, other.dataAula)) {
            return false;
        }
        if (!Objects.equals(this.matricula, other.matricula)) {
            return false;
        }
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }
     
     
    
}
