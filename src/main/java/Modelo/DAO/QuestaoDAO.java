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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raphael
 */
public class QuestaoDAO {

    private final Connection conexao;

    public QuestaoDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public void gravar(Questao questao) throws SQLException {
        String insercao = "INSERT INTO questao (pergunta,descricao,codigo_categoria,codigo_usuario) VALUES (?, ?,?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, questao.getPergunta());
            pstmt.setString(2, questao.getDescricao());
            pstmt.setLong(3, questao.getCodigo_categoria());
            pstmt.setLong(4, questao.getCodigo_usuario());
            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    questao.setCodigo(rs.getLong(1));
                    AlternativaDAO atdao = new AlternativaDAO(conexao);
                    Alternativa alternativa;
                    for (int i = 0; i < questao.getAlternativas().size(); i++) {
                        alternativa = questao.getAlternativas().get(i);
                        alternativa.setCodigo_questao(questao.getCodigo());
                        atdao.gravar(alternativa);

                    }

                }

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }

    public List<Questao> listar(Long codigoUsuario) throws SQLException {
        Questao questao;
        AlternativaDAO dao = new AlternativaDAO(conexao);
        List<Questao> questoes = new ArrayList<>();
        String selecao = "SELECT * FROM questao where codigo_usuario = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, codigoUsuario);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    questao = new Questao();
                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));
                    questao.setCodigo_usuario(codigoUsuario);
                    questao.setAlternativas(dao.listar(questao.getCodigo()));
                    questoes.add(questao);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questoes;
    }

    public List<Questao> listarPorCategoria(Long codigoCategoria) throws SQLException {
        Questao questao;
        AlternativaDAO dao = new AlternativaDAO(conexao);
        List<Questao> questoes = new ArrayList<>();
        String selecao = "SELECT * FROM questao where codigo_categoria = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, codigoCategoria);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    questao = new Questao();
                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));

                    questao.setAlternativas(dao.listar(questao.getCodigo()));
                    questoes.add(questao);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questoes;
    }

    public List<Questao> buscar(String busca, Usuario usuario) throws SQLException {
        Questao questao;
        AlternativaDAO dao = new AlternativaDAO(conexao);
        List<Questao> questoes = new ArrayList<>();
        String selecao = "select a.* from questao as a,categoria as b where (a.codigo_categoria=b.codigo and b.nome LIKE ? and b.codigo_usuario=?) or (a.codigo_categoria=b.codigo and a.pergunta LIKE ? and b.codigo_usuario=?) ";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setString(1, "%" + busca + "%");
            pstmt.setLong(2, usuario.getCodigo());
            pstmt.setString(3, "%" + busca + "%");
            pstmt.setLong(4, usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    questao = new Questao();
                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));

                    questao.setAlternativas(dao.listar(questao.getCodigo()));
                    questoes.add(questao);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questoes;
    }

    public void remover(Questao questao) throws SQLException {

        String remocao = "DELETE FROM questao WHERE codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(remocao)) {
            pstmt.setLong(1, questao.getCodigo());
            int remocoes = pstmt.executeUpdate();
            if (remocoes == 1) {
                System.out.println("Remoção efetuada com sucesso.");
            } else {
                System.out.println("Não foi possível efetuar a remoção.");
            }
        }

    }

    public void buscarDados(Questao questao, Usuario usuario) throws SQLException {

        AlternativaDAO dao = new AlternativaDAO(conexao);

        String selecao = "select * from questao where codigo_usuario = ? and codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, usuario.getCodigo());
            pstmt.setLong(2, questao.getCodigo());

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {

                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));

                    questao.setAlternativas(dao.listar(questao.getCodigo()));

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void atualizar(Questao questao) throws SQLException {
        AlternativaDAO dao = new AlternativaDAO(conexao);
        String alteracao = "UPDATE questao SET pergunta = ?, descricao = ? ,codigo_categoria = ? WHERE codigo = ? ";
        try (PreparedStatement pstmt = conexao.prepareStatement(alteracao)) {
            pstmt.setString(1, questao.getPergunta());
            pstmt.setString(2, questao.getDescricao());
            pstmt.setLong(3, questao.getCodigo_categoria());
            pstmt.setLong(4, questao.getCodigo());

            int alteracoes = pstmt.executeUpdate();
            if (alteracoes == 1) {
                System.out.println("\nAlteracao bem sucedida.");

                for (int i = 0; i < questao.getAlternativas().size(); i++) {
                    dao.atualizar(questao.getAlternativas().get(i));
                }
            } else {
                System.out.println("A alteracao não foi feita corretamente.");
            }
        }
    }

    public List<Questao> listaAleatoria(List<Long> categorias, int nmq,Usuario usuario) {
        Questao questao;
        AlternativaDAO dao = new AlternativaDAO(conexao);
        List<Questao> questoes = new ArrayList<>();
        String selecao = "SELECT * FROM questao where ";
        for (int i = 0; i < categorias.size(); i++) {
            if (i < categorias.size() - 1) {
                selecao += "codigo_categoria = ? or ";
            } else {
                selecao += "codigo_categoria = ? and codigo_usuario = ? order by rand() limit ?";
            }
        }
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
          
            for (int i = 0; i < categorias.size(); i++) {
                if (i < categorias.size() - 1) {
                    pstmt.setLong(i+1, categorias.get(i));
                } else {
                   
                    pstmt.setLong(i+1, categorias.get(i));
                    pstmt.setLong(i+2, usuario.getCodigo());
                    pstmt.setInt(i+3,nmq);
                }
            }
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    questao = new Questao();
                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));
                    questao.setCodigo_usuario(usuario.getCodigo());
                    questao.setAlternativas(dao.listarRDM(questao.getCodigo()));
                    questoes.add(questao);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questoes;
    }
    
    
    public List<Questao> listarQuestoesProva(Long codigoProva,Long codigoUsuario) throws SQLException {
        Questao questao;
        AlternativaDAO dao = new AlternativaDAO(conexao);
        List<Questao> questoes = new ArrayList<>();
        String selecao = "select b.* from Prova as a , questao as b, prova_questao as c where c.codigo_questao=b.codigo and a.codigo=c.codigo_prova and  a.codigo = ?;";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, codigoProva);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    questao = new Questao();
                    questao.setCodigo(rs.getLong(1));
                    questao.setPergunta(rs.getString(2));
                    questao.setDescricao(rs.getString(3));
                    questao.setCodigo_categoria(rs.getLong(4));
                    questao.setCodigo_usuario(codigoUsuario);
                    questao.setAlternativas(dao.listarRDM(questao.getCodigo()));
                    questoes.add(questao);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questoes;
    }

}
