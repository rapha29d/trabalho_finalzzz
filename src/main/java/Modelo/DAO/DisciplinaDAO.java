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
public class DisciplinaDAO {
    
      private final Connection conexao;
     
     public DisciplinaDAO(Connection conexao){
         this.conexao=conexao;
     }
    
}
