/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.DAO;

import Modelo.Categoria;
import Modelo.Prova;
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
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

/**
 *
 * @author raphael
 */
public class ProvaDAOTest {
    
     
    private static final DbSetupTracker dbSetupTracker = new DbSetupTracker();
    
    
    @Rule
    public MockitoRule rule = MockitoJUnit.rule();
    
    @Mock
    private  List<Prova> result;

    private DAOFactory factory;
    private ProvaDAO dao;
    
    public ProvaDAOTest() {
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
                             CommonOperations.RESET_AUTOINCREMENT_MYSQL5,
                             CommonOperations.INSERE_DADOS_BASICOS,
                             CommonOperations.INSERE_DADOS_BASICOS2,
                             CommonOperations.INSERE_DADOS_BASICOS3,
                             CommonOperations.INSERE_DADOS_BASICOS4,
                             CommonOperations.INSERE_DADOS_BASICOS5,
                             CommonOperations.INSERE_DADOS_BASICOS6
                );
            // MySQL
        DbSetup dbSetup = new DbSetup(new DriverManagerDestination(
                "jdbc:mysql://localhost:3307/aplicacaotest",
                "admin", "12345"), operation);

//      
        
        dbSetupTracker.launchIfNecessary(dbSetup);

        factory = new DAOFactory();
        factory.abrirConexaoTest();
        dao = factory.criarProvaDAO();
    }
    
    @After
    public void tearDown() throws SQLException {
         factory.fecharConexao();
    }

    /**
     * Test of gravar method, of class ProvaDAO.
     */
    @Test
    public void testGravar() throws Exception {
        System.out.println("gravar");
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        Prova prova=new Prova();
        List<Categoria> categorias=new ArrayList<>();
        Categoria categoria=new Categoria();
        categoria.setNome("teste");
        categoria.setCodigo((long)1);
        List<Long> categoriasL=new ArrayList<>();
        categoriasL.add((long)1);
        categorias.add(categoria);
        usuario.setCategorias(categorias);
        prova.setCategorias(categoriasL);
        Questao questao;
        List<Questao> questoes=new ArrayList<>();
        int cod=1;
        for(int i=0;i<4;i++){
            questao=new Questao();
            questao.setCodigo((long)cod);
            questoes.add(questao);
            cod++;
        }
        prova.setQuestoes(questoes);
        usuario.setProva(prova);
        
        ProvaDAO instance = dao;
        instance.gravar(usuario);
        // TODO review the generated test code and remove the default call to fail.
        long test=usuario.getProva().getCodigo();
        assertEquals(test, 2);
    }

    /**
     * Test of gravarQuestaoProva method, of class ProvaDAO.
     */
    @Test(timeout = 500)
    public void testGravarQuestaoProva() throws Exception {
        System.out.println("gravarQuestaoProva");
        long codigoProva = 1;
        long codigoQuestao = 4;
        ProvaDAO instance = dao;
        instance.gravarQuestaoProva(codigoProva, codigoQuestao);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of listar method, of class ProvaDAO.
     */
    @Test
    public void testListar() throws Exception {
        System.out.println("listar");
        Usuario usuario = new Usuario();
        usuario.setCodigo(1);
        ProvaDAO instance = dao;
        
        result = instance.listar(usuario);
        assertEquals(result.size(),1);
        assertTrue(result.get(0).getCategoriaS().equals("Categoria_Grosbilda"));
        assertTrue(result.get(0).getNmq()==4);
        assertTrue(result.get(0).getData_cri().equals("10/12/2017"));
        
    }

    /**
     * Test of remover method, of class ProvaDAO.
     */
    @Test(timeout = 500)
    public void testRemover() throws Exception {
       
        Prova prova = new Prova();
        prova.setCodigo(1);
        ProvaDAO instance = dao;
        instance.remover(prova);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of buscarDados method, of class ProvaDAO.
     */
    @Test
    public void testBuscarDados() throws Exception {
        System.out.println("buscarDados");
        Prova prova = new Prova();
        Usuario usuario =new Usuario();
        prova.setCodigo(1);
        usuario.setCodigo(1);
        ProvaDAO instance = dao;
        instance.buscarDados(prova, usuario);
        assertEquals(prova.getData_cri(),"10/12/2017");
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
