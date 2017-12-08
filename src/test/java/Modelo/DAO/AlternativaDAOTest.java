/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Alternativa;
import Modelo.Questao;
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
public class AlternativaDAOTest {
    
    private static final DbSetupTracker dbSetupTracker = new DbSetupTracker();
    
    
    @Rule
    public MockitoRule rule = MockitoJUnit.rule();
    
    @Mock
    private  List<Alternativa> result;

    private DAOFactory factory;
    private AlternativaDAO dao;
    
    
    public AlternativaDAOTest() {
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
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL3,
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL4,
                             CommonOperations.INSERE_DADOS_BASICOS,
                             CommonOperations.INSERE_DADOS_BASICOS2,
                             CommonOperations.INSERE_DADOS_BASICOS3,
                             CommonOperations.INSERE_DADOS_BASICOS4
                );
            // MySQL
        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
                "jdbc:mysql://localhost:3307/aplicacaotest",
                "admin", "12345"), operation);

//      
        
        dbSetupTracker.launchIfNecessary(dbSetup);

        factory = new DAOFactory();
        factory.abrirConexaoTest();
        dao = factory.criarAlternativaDAO();
    }
    
    @After
    public void tearDown() throws SQLException {
         factory.fecharConexao();
    }

    /**
     * Test of gravar method, of class AlternativaDAO.
     */
    @Test
    public void testGravar() throws Exception {
        System.out.println("gravar");
        Alternativa alternativa = new Alternativa();
        alternativa.setAlternativa("teste teste teste");
        alternativa.setCodigo_questao((long)1);
        alternativa.setValor(1);
        AlternativaDAO instance = dao;
        instance.gravar(alternativa);
        long test=alternativa.getCodigo();
        assertEquals(test,13);
       
    }

    /**
     * Test of listar method, of class AlternativaDAO.
     */
    @Test
    public void testListar() throws Exception {
        System.out.println("listar");
        Long codigoQuestao = (long)1;
        AlternativaDAO instance = dao;
       
        result = instance.listar(codigoQuestao);
        assertEquals(result.size(),4);
        assertTrue(result.get(0).getAlternativa().equals("teadkajjsdd"));
        assertTrue(result.get(3).getValor()==1);
        
      
    }

    /**
     * Test of listarRDM method, of class AlternativaDAO.
     */
    @Test
    public void testListarRDM() throws Exception {
        System.out.println("listarRDM");
        Long codigoQuestao =(long)1;
        AlternativaDAO instance = dao;
       
        result = instance.listarRDM(codigoQuestao);
        assertEquals(result.size(),4);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of atualizar method, of class AlternativaDAO.
     */
    //@Test
    public void testAtualizar() throws Exception {
        System.out.println("atualizar");
        Alternativa alternativa = null;
        AlternativaDAO instance = null;
        instance.atualizar(alternativa);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of resposta method, of class AlternativaDAO.
     */
    @Test
    public void testResposta() throws Exception {
        System.out.println("resposta");
        Long codigoAlternativa = (long)4;
        AlternativaDAO instance = dao;
        int expResult = 1;
        int result = instance.resposta(codigoAlternativa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
     
    }
    
}
