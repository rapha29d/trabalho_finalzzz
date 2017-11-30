/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Alternativa;
import Modelo.Questao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raphael
 */
public class AlternativaDAO {
    
     private final Connection conexao;
     
     public AlternativaDAO(Connection conexao){
         this.conexao=conexao;
     }
     
      public void gravar(Alternativa alternativa) throws SQLException {
        String insercao = "INSERT INTO alternativa (alternativa,codigo_questao,valor) VALUES (?, ?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, alternativa.getAlternativa());
            pstmt.setLong(2, alternativa.getCodigo_questao());
            pstmt.setInt(3, alternativa.getValor());
          
            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    alternativa.setCodigo(rs.getLong(1));

                }

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }
      
      public List<Alternativa> listar(Long codigoQuestao) throws SQLException {
        Alternativa alternativa;
        List<Alternativa> alternativas = new ArrayList<>();
        String selecao = "SELECT * FROM alternativa where codigo_questao = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,codigoQuestao);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    alternativa = new Alternativa();
                    alternativa.setCodigo(rs.getLong(1));
                    alternativa.setAlternativa(rs.getString(2));
                    alternativa.setCodigo_questao(rs.getLong(3));
                    alternativa.setValor(rs.getInt(4));
                   
                    alternativas.add(alternativa);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlternativaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return alternativas;
    }
    
    public List<Alternativa> listarRDM(Long codigoQuestao) throws SQLException {
        Alternativa alternativa;
        List<Alternativa> alternativas = new ArrayList<>();
        String selecao = "SELECT * FROM alternativa where codigo_questao = ? order by rand()";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,codigoQuestao);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    alternativa = new Alternativa();
                    alternativa.setCodigo(rs.getLong(1));
                    alternativa.setAlternativa(rs.getString(2));
                    alternativa.setCodigo_questao(rs.getLong(3));
                    alternativa.setValor(rs.getInt(4));
                   
                    alternativas.add(alternativa);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlternativaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return alternativas;
    }  
     
    public void atualizar(Alternativa alternativa) throws SQLException{
        String alteracao = "UPDATE alternativa SET alternativa = ?, valor = ? WHERE codigo = ? ";
        try (PreparedStatement pstmt = conexao.prepareStatement(alteracao)) {
            pstmt.setString(1, alternativa.getAlternativa());
            pstmt.setInt(2, alternativa.getValor());
            pstmt.setLong(3, alternativa.getCodigo());
           
            int alteracoes = pstmt.executeUpdate();
            if (alteracoes == 1) {
                System.out.println("\nAlteracao bem sucedida.");
               
            } else {
                System.out.println("A alteracao não foi feita corretamente.");
            }
        }
    }
     public int resposta(Long codigoAlternativa) throws SQLException {
        int resp=0;
        String selecao = "SELECT (valor) FROM alternativa where codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,codigoAlternativa);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                  
                    resp=rs.getInt(1);
                    
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlternativaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }
     
     
    
}
