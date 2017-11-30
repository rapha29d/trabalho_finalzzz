/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Alternativa;
import Modelo.Categoria;
import Modelo.Questao;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raphael
 */
public class CategoriaDAO {
    
     private final Connection conexao;
     
     public CategoriaDAO(Connection conexao){
         this.conexao=conexao;
     }
     
     public void gravar(Categoria categoria,Usuario usuario) throws SQLException {
        String insercao = "INSERT INTO categoria (nome,descricao,codigo_usuario) VALUES (?, ?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, categoria.getNome());
            pstmt.setString(2, categoria.getDescricao());
            pstmt.setLong(3, usuario.getCodigo());
            
            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    categoria.setCodigo(rs.getLong(1));
                 

                }

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }
     
     public List<Categoria> listar(Usuario usuario) throws SQLException {
        Categoria categoria;
        List<Categoria> categorias = new ArrayList<>();
        String selecao = "select a.*,(select count(codigo)from questao where codigo_categoria=a.codigo) as qtdq from categoria as a where codigo_usuario=? order by a.nome asc;";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    categoria=new Categoria();
                    categoria.setCodigo(rs.getLong(1));
                    categoria.setNome(rs.getString(2));
                    categoria.setDescricao(rs.getString(3));
                    categoria.setQtdq(rs.getInt("qtdq"));
                    categorias.add(categoria);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorias;
    }
     
    public List<Categoria> listarComQuestoes(Usuario usuario) throws SQLException {
        QuestaoDAO dao=new QuestaoDAO(conexao);
        Categoria categoria;
        List<Categoria> categorias = new ArrayList<>();
        String selecao =" select a.*,(select count(codigo)from questao where codigo_categoria=a.codigo) as qtdq from categoria as a where codigo_usuario=? order by a.nome asc;";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    categoria=new Categoria();
                    categoria.setQtdq(rs.getInt("qtdq"));
                    if(categoria.getQtdq()>0){
                       categoria.setCodigo(rs.getLong(1));
                       categoria.setNome(rs.getString(2));
                       categoria.setDescricao(rs.getString(3));
                       categoria.setQuestoes(dao.listarPorCategoria(categoria.getCodigo()));
                       categorias.add(categoria);
                    }
                   
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorias;
    }
    
    
    public void buscarEspecifica(Categoria categoria,Usuario usuario){
        QuestaoDAO dao=new QuestaoDAO(conexao);
        
     
        String selecao =" select a.*,(select count(codigo)from questao where codigo_categoria=a.codigo) as qtdq from categoria as a where codigo=? and codigo_usuario=? order by a.nome asc;";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1,categoria.getCodigo());
            pstmt.setLong(2, usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    
                    categoria.setQtdq(rs.getInt("qtdq"));
                    categoria.setCodigo(rs.getLong(1));
                    categoria.setNome(rs.getString(2));
                    categoria.setDescricao(rs.getString(3));
                    if(categoria.getQtdq()>0){
                     
                       categoria.setQuestoes(dao.listarPorCategoria(categoria.getCodigo()));
              
                    }
                   
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
    }
     
     public boolean verificarCategoriaExiste(String nome,Usuario usuario) throws SQLException {

        boolean resposta = false;
        String selecao = "select * from categoria where nome= ? and codigo_usuario=?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setString(1, nome);
            pstmt.setLong(2, usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    resposta = true;
                }
            }
        }
        return resposta;
    }
     
    public void remover(Categoria categoria) throws SQLException{
        
        String remocao = "DELETE FROM categoria WHERE codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(remocao)) {
            pstmt.setLong(1,categoria.getCodigo());
            int remocoes = pstmt.executeUpdate();
            if (remocoes == 1) {
                System.out.println("Remoção efetuada com sucesso.");
            } else {
                System.out.println("Não foi possível efetuar a remoção.");
            }
        }
        
    }
    
    public void buscaDados(Categoria categoria) throws SQLException {

       
        String selecao = "select * from categoria where codigo = ?;";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, categoria.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                   categoria.setCodigo(rs.getLong(1));
                   categoria.setNome(rs.getString(2));
                   categoria.setDescricao(rs.getString(3));
                }
            }
        }
        
    }
    
    public void atualizar(Categoria categoria) throws SQLException {
        String alteracao = "UPDATE categoria SET nome = ?, descricao = ? WHERE codigo = ? ";
        try (PreparedStatement pstmt = conexao.prepareStatement(alteracao)) {
            pstmt.setString(1, categoria.getNome());
            pstmt.setString(2, categoria.getDescricao());
            pstmt.setLong(3, categoria.getCodigo());
           
            int alteracoes = pstmt.executeUpdate();
            if (alteracoes == 1) {
                System.out.println("\nAlteracao bem sucedida.");
            } else {
                System.out.println("A alteracao não foi feita corretamente.");
            }
        }
    }
    
    
    
    
   
    
}
