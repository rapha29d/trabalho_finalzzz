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
public class AlunoDAO {
    
     private final Connection conexao;
     
     public AlunoDAO(Connection conexao){
         this.conexao=conexao;
     }
    
}
