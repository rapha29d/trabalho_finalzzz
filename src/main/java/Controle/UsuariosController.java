/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.DAO.DAOFactory;

import Modelo.DAO.UsuarioDAO;

import Modelo.Usuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import outros.Encrypt;
import outros.Validacoes;

/**
 *
 * @author raphael
 */
@Controller
public class UsuariosController {

    private Validacoes valida = new Validacoes();

    @Inject
    private Usuario usuario;
    @Inject
    private Result result;

    public void cadastro() {
        if (usuario.getLogin() == null) {
            result.redirectTo(UsuariosController.class).novoResgistro();
        } else {
            if (usuario.getLogin() != null) {
                result.redirectTo(AdmController.class).questao_nova();
            }
        }

    }

    public void login() {

    }

    public void cadastrar(String login, String senha, String nome, String email) {
        String mensagem;
        boolean verifica = valida.validaCamposUsuario(login, senha, email, nome);
        if (verifica == false) {

            DAOFactory fabrica = new DAOFactory();

            try {
                fabrica.abrirConexao();
                UsuarioDAO dao = fabrica.criarUsuarioDAO();
                verifica = dao.verificarLoginExiste(login);

                if (verifica == false) {

                    usuario.setLogin(login);
                    usuario.setSenha(Encrypt.criarHash(senha));
                    usuario.setNome(nome);
                    usuario.setEmail(email);
                    dao.gravar(usuario);
                    mensagem = "bootbox.alert('Cadastro efetuado com sucesso')";
                    result.include("mensagem", mensagem);
                    usuario.release();
                    result.redirectTo(UsuariosController.class).login();

                } else {
                    mensagem = "bootbox.alert('O usuario " + login + " ja existe')";
                    result.include("mensagem", mensagem);
                    result.include("login", login);
                    result.include("senha", senha);
                    result.include("nome", nome);
                    result.include("email", email);
                    result.redirectTo(UsuariosController.class).novoResgistro();
                }

            } catch (SQLException ex) {
                Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    fabrica.fecharConexao();
                } catch (SQLException ex) {
                    System.out.println("Erro no acesso ao banco de dados.");
                    DAOFactory.mostrarSQLException(ex);

                }
            }
        }else{
                    mensagem = "bootbox.alert('Preencha todos os campos')";
                    result.include("mensagem", mensagem);
                    result.include("login", login);
                    result.include("senha", senha);
                    result.include("nome", nome);
                    result.include("email", email);
                    result.redirectTo(UsuariosController.class).novoResgistro();
        }

    }

    public void novoResgistro() {

    }

    public void perfil() {
        if (usuario.getLogin() == null) {
            Subject usuarioAtual = SecurityUtils.getSubject();
            String login = usuarioAtual.getPrincipal().toString();
            DAOFactory fabrica = new DAOFactory();

            try {

                fabrica.abrirConexao();
                UsuarioDAO dao = fabrica.criarUsuarioDAO();
                dao.buscarDadosCliente(login, usuario);
            } catch (SQLException ex) {
                Logger.getLogger(UsuariosController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).questao_nova();

    }

    public void sair() {
        usuario.release();
        result.redirectTo(UsuariosController.class).login();
    }

}
