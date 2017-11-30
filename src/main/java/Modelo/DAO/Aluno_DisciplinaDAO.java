/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import java.sql.Connection;

/**
 *
 * @author raphael
 */
public class Aluno_DisciplinaDAO {
    
     private final Connection conexao;
     
     public Aluno_DisciplinaDAO(Connection conexao){
         this.conexao=conexao;
     }
    
}
