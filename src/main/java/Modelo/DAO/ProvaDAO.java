/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Alternativa;
import Modelo.Prova;
import Modelo.Questao;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raphael
 */
public class ProvaDAO {

    private final Connection conexao;

    public ProvaDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public void gravar(Usuario usuario) throws SQLException {
        Prova prova = usuario.getProva();
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        prova.setData_cri(LocalDateTime.now().format(fmt));
        String categorias = "";
        for (int i = 0; i < prova.getCategorias().size(); i++) {

            for (int j = 0; j < usuario.getCategorias().size(); j++) {
                if (prova.getCategorias().get(i) == usuario.getCategorias().get(j).getCodigo()) {
                    if (i == prova.getCategorias().size() - 1) {
                        categorias += usuario.getCategorias().get(j).getNome();
                    } else {
                        categorias += usuario.getCategorias().get(j).getNome()+ ", ";
                    }
                }
            }
        }
        prova.setCategoriaS(categorias);
        String insercao = "INSERT INTO Prova (codigo_usuario,data_cri,nmq,categorias) VALUES (?,?,?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setLong(1, usuario.getCodigo());
            pstmt.setString(2, prova.getData_cri());
            pstmt.setInt(3, prova.getNmq());
            pstmt.setString(4, prova.getCategoriaS());
            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    prova.setCodigo(rs.getLong(1));

                    for (int i = 0; i < prova.getQuestoes().size(); i++) {
                        this.gravarQuestaoProva(prova.getCodigo(), prova.getQuestoes().get(i).getCodigo());

                    }

                }

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }

    public void gravarQuestaoProva(long codigoProva, long codigoQuestao) throws SQLException {
        String insercao = "INSERT INTO prova_questao (codigo_prova,codigo_questao) VALUES (?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setLong(1, codigoProva);
            pstmt.setLong(2, codigoQuestao);

            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }
    
     public List<Prova> listar(Usuario usuario) throws SQLException {
        Prova prova;
        QuestaoDAO dao = new QuestaoDAO(conexao);
        List<Prova> provas = new ArrayList<>();
        String selecao = "SELECT * FROM Prova where codigo_usuario = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, usuario.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    prova = new Prova();
                    prova.setCodigo(rs.getLong(1));
                    prova.setCodigo_usuario(rs.getLong(2));
                    prova.setData_cri(rs.getString(3));
                    prova.setNmq(rs.getInt(4));
                    prova.setCategoriaS(rs.getString(5));
                    //prova.setQuestao(dao.listarQuestoesProva(prova.getCodigo(), usuario.getCodigo()));
                    provas.add(prova);
                    

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return provas;
    }
     
     public void remover(Prova prova) throws SQLException {

        String remocao = "DELETE FROM Prova WHERE codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(remocao)) {
            pstmt.setLong(1, prova.getCodigo());
            int remocoes = pstmt.executeUpdate();
            if (remocoes == 1) {
                System.out.println("Remoção efetuada com sucesso.");
            } else {
                System.out.println("Não foi possível efetuar a remoção.");
            }
        }

    }
     
    public void buscarDados(Prova prova, Usuario usuario) throws SQLException {
       
        QuestaoDAO dao = new QuestaoDAO(conexao);
      
        String selecao = "SELECT * FROM Prova where codigo_usuario = ? and codigo= ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setLong(1, usuario.getCodigo());
            pstmt.setLong(2, prova.getCodigo());
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                   
                    prova.setCodigo(rs.getLong(1));
                    prova.setCodigo_usuario(rs.getLong(2));
                    prova.setData_cri(rs.getString(3));
                    prova.setNmq(rs.getInt(4));
                    prova.setCategoriaS(rs.getString(5));
                    prova.setQuestao(dao.listarQuestoesProva(prova.getCodigo(), usuario.getCodigo()));
                    usuario.setProva(prova);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    } 

}
