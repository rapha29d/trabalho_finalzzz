/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Usuario;
import com.ninja_squad.dbsetup.DbSetup;
import com.ninja_squad.dbsetup.DbSetupTracker;
import com.ninja_squad.dbsetup.destination.DriverManagerDestination;
import static com.ninja_squad.dbsetup.operation.CompositeOperation.sequenceOf;
import com.ninja_squad.dbsetup.operation.Operation;
import java.sql.SQLException;
import java.util.List;
import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.Matchers.hasItems;
import static org.hamcrest.Matchers.hasProperty;

import static org.junit.Assert.assertThat;



import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author raphael
 */
public class UsuarioDAOTest {
    
     private static final DbSetupTracker dbSetupTracker = new DbSetupTracker();

    private DAOFactory factory;
    private UsuarioDAO dao;
    private Usuario usuario;
    
    public UsuarioDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() throws SQLException {
          Operation operation
                = sequenceOf(CommonOperations.DELETE_ALL,
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL,
//                             OperacoesComunsBD.RESET_AUTOINCREMENT_H2,
                             CommonOperations.INSERE_DADOS_BASICOS);
            // MySQL
        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
                "jdbc:mysql://localhost:3307/aplicacaotest",
                "admin", "12345"), operation);

//        //H2 em arquivo
//        ConexaoFactory.getConexaoH2Arquivo();  // para criar o BD caso ele nao exista
//        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
//                "jdbc:h2:./contatossimples;DATABASE_TO_UPPER=false;",
//                "root", "12345"), operation);
        
//        //H2 em memoria
//        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
//                "jdbc:h2:mem:contatossimples;DATABASE_TO_UPPER=false;DB_CLOSE_DELAY=-1;" +
//                "INIT=CREATE TABLE IF NOT EXISTS contato (idContato bigint(20) "
//                + "PRIMARY KEY AUTO_INCREMENT, nome varchar(145), "
//                + "endereco varchar(145), telefone varchar(45), email "
//                + "varchar(45))\\;",
//                "root", "12345"), operation);
        
        dbSetupTracker.launchIfNecessary(dbSetup);

        factory = new DAOFactory();
        factory.abrirConexaoTest();
        dao = factory.criarUsuarioDAO();
        usuario=new Usuario("admteste","teste","123","teste@teste");
    }
    
    @After
    public void tearDown() throws SQLException {
        factory.fecharConexao();
    }

    /**
     * Test of gravar method, of class UsuarioDAO.
     */
    @Test
    public void testGravar() throws Exception {
        System.out.println("gravar");
        
        UsuarioDAO instance = dao;
        instance.gravar(usuario);
        // TODO review the generated test code and remove the default call to fail.
        assertEquals(usuario.getCodigo(),4);
    }

    /**
     * Test of verificarLoginExiste method, of class UsuarioDAO.
     */
    @Test
    public void testVerificarLoginExiste() throws Exception {
        System.out.println("verificarLoginExiste");
        String login = "teste";
        UsuarioDAO instance = dao;
        boolean expResult = false;
        boolean result = instance.verificarLoginExiste(login);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of atribuirPapel method, of class UsuarioDAO.
     */
    /*@Test
    public void testAtribuirPapel() throws Exception {
        System.out.println("atribuirPapel");
        
        int papel = 1;
        UsuarioDAO instance = dao;
        instance.atribuirPapel(usuario, papel);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/

    /**
     * Test of buscarDadosCliente method, of class UsuarioDAO.
     */
    @Test
    public void testBuscarDadosCliente() throws Exception {
        System.out.println("buscarDadosCliente");
        String login = "Seilah";
        
        UsuarioDAO instance = dao;
        instance.buscarDadosCliente(login, usuario);
        assertEquals(usuario.getNome(),"Grosbilda");
       
    }
    
    @Test
    public void testListar() throws Exception {
        System.out.println("ListarDadosUsuario");
       
        
        UsuarioDAO instance = dao;
        List<Usuario> usuarios=instance.listar();
        assertThat(usuarios, hasItems(
                new Usuario(Long.parseLong("1"),"Grosbilda", "Seilah"," 222","grosbilda@seilah.com"),
                new Usuario(Long.parseLong("2"),"Estrobilobaldo", "Seilah2", "333","estrobilobaldo@seilah.com"),
                new Usuario(Long.parseLong("3"),"Zirgonisvaldo", "Seilah3", "444","zirgonisvaldo@seilah.com")
                
                
        ));
       
       
    }
    
    @Test
    public void testRemove() throws Exception {
        System.out.println("removerDadosUsuario");
       
        
        UsuarioDAO instance = dao;
        usuario.setCodigo(1);
        int res=instance.remover(usuario);
         assertEquals(res,1);
       
    }
    
    
    
}
