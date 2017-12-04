/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Categoria;
import Modelo.Usuario;
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
public class UsuarioDAO {

    private final Connection conexao;

    public UsuarioDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public void gravar(Usuario usuario) throws SQLException {
        String insercao = "INSERT INTO usuario (login, senha,nome,email) VALUES (?, ?,?,?);";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao, PreparedStatement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, usuario.getLogin());
            pstmt.setString(2, usuario.getSenha());
            pstmt.setString(3, usuario.getNome());
            pstmt.setString(4, usuario.getEmail());
            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    usuario.setCodigo(rs.getLong(1));
                    this.atribuirPapel(usuario, 1);

                }

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
    }

    public boolean verificarLoginExiste(String login) throws SQLException {

        boolean resposta = false;
        String selecao = "SELECT * FROM usuario where login = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setString(1, login);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    resposta = true;
                }
            }
        }
        return resposta;
    }
    
     public void atribuirPapel(Usuario usuario,int papel) throws SQLException{
        String insercao="INSERT INTO usuario_tem_papel (usuario_codigo, papel_idPapel) VALUES (?, ?)";
        try (PreparedStatement pstmt = conexao.prepareStatement(insercao)) {
            pstmt.setLong(1, usuario.getCodigo());
            pstmt.setInt(2, papel);

            int resultado = pstmt.executeUpdate();
            if (resultado == 1) {
                 
                 System.out.println("A inserção concluida.");

            } else {
                System.out.println("A inserção não foi feita corretamente.");
            }
        }
        
    }
     
    public void buscarDadosCliente(String login,Usuario usuario) throws SQLException{
        CategoriaDAO dao=new CategoriaDAO(conexao);
        String selecao="select * from usuario where login = ?;";
          try (PreparedStatement pstmt = conexao.prepareStatement(selecao)) {
            pstmt.setString(1,login);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                   usuario.setLogin(login);
                   usuario.setCodigo(rs.getLong(1));
                   usuario.setNome(rs.getString("nome"));
                   usuario.setEmail(rs.getString("email"));
                   usuario.setCategorias(dao.listar(usuario));
                   
                }
            }
        }
    }
    
    public int remover(Usuario usuario) throws SQLException{
        
        String remocao = "DELETE FROM usuario WHERE codigo = ?";
        try (PreparedStatement pstmt = conexao.prepareStatement(remocao)) {
            pstmt.setLong(1,usuario.getCodigo());
            int remocoes = pstmt.executeUpdate();
            if (remocoes == 1) {
                System.out.println("Remoção efetuada com sucesso.");
                return 1;
            } else {
                System.out.println("Não foi possível efetuar a remoção.");
                return 0;
            }
        }
       
        
    }
    
     public List<Usuario> listar() throws SQLException {
        Usuario usuario;
        List<Usuario> usuarios = new ArrayList<>();
        String selecao = "select * from usuario";
        try (Statement stmt = conexao.createStatement()) {
            try (ResultSet rs = stmt.executeQuery(selecao)) {
                while (rs.next()) {
                   usuario=new Usuario();
                   usuario.setCodigo(rs.getLong("codigo"));
                   usuario.setNome(rs.getString("nome"));
                   usuario.setLogin(rs.getString("login"));
                   usuario.setSenha(rs.getString("senha"));
                   usuario.setEmail(rs.getString("email"));
                   usuarios.add(usuario);
                }
            }
        }
        return usuarios;
    }

}
