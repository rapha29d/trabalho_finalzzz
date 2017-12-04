/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Categoria;
import Modelo.Questao;
import Modelo.Usuario;
import com.ninja_squad.dbsetup.DbSetup;
import com.ninja_squad.dbsetup.DbSetupTracker;
import com.ninja_squad.dbsetup.destination.DriverManagerDestination;
import static com.ninja_squad.dbsetup.operation.CompositeOperation.sequenceOf;
import com.ninja_squad.dbsetup.operation.Operation;
import java.sql.SQLException;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Rule;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

/**
 *
 * @author raphael
 */
public class CategoriaDAOTest {
    
    private static final DbSetupTracker dbSetupTracker = new DbSetupTracker();
    
    @Rule
    public MockitoRule rule = MockitoJUnit.rule();

     
    @Mock
    private  List<Categoria> result; 

    private DAOFactory factory;
    private CategoriaDAO dao;
   
    
    public CategoriaDAOTest() {
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
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL2,
                             CommonOperations.INSERE_DADOS_BASICOS,
                             CommonOperations.INSERE_DADOS_BASICOS2
                           
                );
            // MySQL
        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
                "jdbc:mysql://localhost:3307/aplicacaotest",
                "admin", "12345"), operation);

//      
        
        dbSetupTracker.launchIfNecessary(dbSetup);

        factory = new DAOFactory();
        factory.abrirConexaoTest();
        dao = factory.criarCategoriaDAO();
      
    }
    
    @After
    public void tearDown() throws SQLException {
          factory.fecharConexao();
    }

    /**
     * Test of gravar method, of class CategoriaDAO.
     */
    @Test
    public void testGravar() throws Exception {
        System.out.println("gravar");
        Categoria categoria = new Categoria("teste","teste");
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        CategoriaDAO instance = dao;
        instance.gravar(categoria, usuario);
        // TODO review the generated test code and remove the default call to fail.
        long test=categoria.getCodigo();
        assertEquals(test,4);
      
    }

    /**
     * Test of listar method, of class CategoriaDAO.
     */
    @Test
    public void testListar() throws Exception {
        System.out.println("listar");
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        CategoriaDAO instance = dao;
        List<Categoria> expResult = null;
        result = instance.listar(usuario);
        assertNotEquals(expResult, result);
        assertEquals(result.size(),1);
        assertTrue(result.get(0).getDescricao().equals("Seilah"));
        
       
    }

    /**
     * Test of listarComQuestoes method, of class CategoriaDAO.
     */
    /*@Test
    public void testListarComQuestoes() throws Exception {
        System.out.println("listarComQuestoes");
        Usuario usuario = null;
        CategoriaDAO instance = null;
        List<Categoria> expResult = null;
        List<Categoria> result = instance.listarComQuestoes(usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/

    /**
     * Test of buscarEspecifica method, of class CategoriaDAO.
     */
   /* @Test
    public void testBuscarEspecifica() {
        System.out.println("buscarEspecifica");
        Categoria categoria = new Categoria();
        Usuario usuario = new Usuario();
        categoria.setCodigo(Long.parseLong("2"));
        usuario.setCodigo(2);
        CategoriaDAO instance = dao;
        instance.buscarEspecifica(categoria, usuario);
        // TODO review the generated test code and remove the default call to fail.
       
    }*/

    /**
     * Test of verificarCategoriaExiste method, of class CategoriaDAO.
     */
    @Test
    public void testVerificarCategoriaExiste() throws Exception {
        System.out.println("verificarCategoriaExiste");
        String nome = "Categoria_Grosbilda";
        Usuario usuario =new Usuario();
        usuario.setCodigo(1);
        CategoriaDAO instance = dao;
        boolean expResult = true;
        boolean result = instance.verificarCategoriaExiste(nome, usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of remover method, of class CategoriaDAO.
     */
   /* @Test
    public void testRemover() throws Exception {
        System.out.println("remover");
        Categoria categoria = new Categoria();
        CategoriaDAO instance = dao;
        instance.remover(categoria);
        // TODO review the generated test code and remove the default call to fail.
       
    }/

    /**
     * Test of buscaDados method, of class CategoriaDAO.
     */
    @Test
    public void testBuscaDados() throws Exception {
        System.out.println("buscaDados");
        Categoria categoria =new Categoria();
        categoria.setCodigo(Long.parseLong("1"));
        CategoriaDAO instance = dao;
        instance.buscaDados(categoria);
        // TODO review the generated test code and remove the default call to fail.
        assertEquals(categoria.getNome(),"Categoria_Grosbilda");
        
    }

    /**
     * Test of atualizar method, of class CategoriaDAO.
     */
    
    /*@Test
    public void testAtualizar() throws Exception {
        System.out.println("atualizar");
        Categoria categoria = null;
        CategoriaDAO instance = null;
        instance.atualizar(categoria);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/
    
}
