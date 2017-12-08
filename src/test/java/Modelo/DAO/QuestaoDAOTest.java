/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Alternativa;
import Modelo.Questao;
import Modelo.Usuario;
import com.ninja_squad.dbsetup.DbSetup;
import com.ninja_squad.dbsetup.DbSetupTracker;
import com.ninja_squad.dbsetup.destination.DriverManagerDestination;
import static com.ninja_squad.dbsetup.operation.CompositeOperation.sequenceOf;
import com.ninja_squad.dbsetup.operation.Operation;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Rule;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Matchers.anyString;
import static org.mockito.Matchers.isA;
import org.mockito.Mock;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

/**
 *
 * @author raphael
 */
public class QuestaoDAOTest {
    
   private static final DbSetupTracker dbSetupTracker = new DbSetupTracker();
    
    @Rule
    public MockitoRule rule = MockitoJUnit.rule();

    
    private DAOFactory factory;
    private QuestaoDAO dao;
    
    @Mock
    private  List<Questao> result;
    
    public QuestaoDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass(){
          
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
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL3,
                             CommonOperations.INSERE_DADOS_BASICOS,
                             CommonOperations.INSERE_DADOS_BASICOS2,
                             CommonOperations.INSERE_DADOS_BASICOS3
                             
                );
            // MySQL
        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
                "jdbc:mysql://localhost:3307/aplicacaotest",
                "admin", "12345"), operation);

//      
        
        dbSetupTracker.launchIfNecessary(dbSetup);

        factory = new DAOFactory();
        factory.abrirConexaoTest();
        dao = factory.criarQuestaoDAO();
    }
    
    @After
    public void tearDown() throws SQLException {
        factory.fecharConexao();
    }

    /**
     * Test of gravar method, of class QuestaoDAO.
     */
    @Test
    public void testGravar() throws Exception {
        System.out.println("gravar");
        Questao questao = new Questao();
        questao.setCodigo_categoria((long)1);
        questao.setCodigo_usuario((long)1);
        questao.setPergunta("teste");
        questao.setDescricao("asjdfoijasf");
        List<Alternativa> alternativas=new ArrayList<>();
        Alternativa alternativa;
        for(int i=0;i<4;i++){
            alternativa=new Alternativa();
            alternativa.setAlternativa("alternativa "+i);
            if(i==0){
                alternativa.setValor(1);
            }else{
                alternativa.setValor(0);
            }
            alternativas.add(alternativa);
        }
        questao.setAlternativas(alternativas);
        QuestaoDAO instance =dao;
        instance.gravar(questao);
        long test=questao.getCodigo();
        assertEquals(test,5);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of listar method, of class QuestaoDAO.
     */
    @Test
    public void testListar() throws Exception {
        System.out.println("listar");
        Long codigoUsuario = (long)1;
        QuestaoDAO instance = dao;
       
        result = instance.listar(codigoUsuario);
        assertEquals(result.size(),4);
        assertTrue(result.get(0).getPergunta().equals("teadkajjsd"));
        assertTrue(result.get(1).getDescricao().equals("sdjfsodsdf"));
        assertTrue(result.get(2).getCodigo()==3);
        assertTrue(result.get(3).getCodigo_categoria()==1);
      
    }

    /**
     * Test of listarPorCategoria method, of class QuestaoDAO.
     */
    @Test
    public void testListarPorCategoria() throws Exception {
        System.out.println("listarPorCategoria");
        Long codigoCategoria =(long)1;
        QuestaoDAO instance = dao;
        result = instance.listarPorCategoria(codigoCategoria);
        assertEquals(result.size(),4);
        // TODO review the generated test code and remove the default call to fail.
        
        
    }

    /**
     * Test of buscar method, of class QuestaoDAO.
     */
    @Test
    public void testBuscar() throws Exception {
        System.out.println("buscar");
        String busca = "Categoria_Grosbilda";
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        QuestaoDAO instance = dao;
        
        result = instance.buscar(busca, usuario);
        assertEquals(result.size(),4);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of remover method, of class QuestaoDAO.
     */
    @Test
    public void testRemover() throws Exception {
        System.out.println("remover");
        Questao questao = new Questao();
        questao.setCodigo((long)1);
        QuestaoDAO instance = dao;
        instance.remover(questao);
        // TODO review the generated test code and remove the default call to fail.
        long test=questao.getCodigo();
         assertEquals(test,0);
    }

    /**
     * Test of buscarDados method, of class QuestaoDAO.
     */
    @Test
    public void testBuscarDados() throws Exception {
        System.out.println("buscarDados");
        Questao questao = new Questao();
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        questao.setCodigo((long)1);
        QuestaoDAO instance = dao;
        instance.buscarDados(questao, usuario);
        // TODO review the generated test code and remove the default call to fail.
         assertEquals("teadkajjsd",questao.getPergunta());
    }

    /**
     * Test of atualizar method, of class QuestaoDAO.
     */
    //@Test
    public void testAtualizar() throws Exception {
        System.out.println("atualizar");
        Questao questao = null;
        QuestaoDAO instance = null;
        instance.atualizar(questao);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listaAleatoria method, of class QuestaoDAO.
     */
    //@Test
    public void testListaAleatoria() {
        System.out.println("listaAleatoria");
        List<Long> categorias = null;
        int nmq = 0;
        Usuario usuario = null;
        QuestaoDAO instance = null;
        List<Questao> expResult = null;
        List<Questao> result = instance.listaAleatoria(categorias, nmq, usuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listarQuestoesProva method, of class QuestaoDAO.
     */
   // @Test
    public void testListarQuestoesProva() throws Exception {
        System.out.println("listarQuestoesProva");
        Long codigoProva = null;
        Long codigoUsuario = null;
        QuestaoDAO instance = null;
        List<Questao> expResult = null;
        List<Questao> result = instance.listarQuestoesProva(codigoProva, codigoUsuario);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
