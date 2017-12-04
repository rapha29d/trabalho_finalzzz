package Modelo.DAO;

import Modelo.DAO.DAOFactory;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConexaoFactoryTEST {
    //HikariCP
    private static Context initContext;
    private static Context environmentContext;
    private static DataSource ds;

    /*static {
        try {
            // Obtem nosso contexto de nomes do ambiente (environment naming context)
            initContext = new InitialContext();
            environmentContext = (Context) initContext.lookup("java:comp/env");

            // Busca pela nossa fonte de dados (data source)
            ds = (DataSource) environmentContext.lookup("jdbc/aplicacao");
        } catch (NamingException ex) {
            Logger.getLogger(ConexaoFactoryTEST.class.getName()).log(Level.SEVERE,
                    "Erro buscando o recurso JNDI jdbc/aplicacao", ex);
        }
    }*/

    public static Connection getConexao() throws SQLException {
        return ds.getConnection();
    }

    private ConexaoFactoryTEST() {
    }
    
    //DBSEUP 
    public static Connection getConexaoH2Memoria() throws SQLException {
        String bd = "aplicacaotest";
        String url = "jdbc:h2:mem:" + bd + ";DATABASE_TO_UPPER=false;DB_CLOSE_DELAY=-1;"
                + "INIT=CREATE TABLE IF NOT EXISTS usuario (codigo bigint(20) "
                + "PRIMARY KEY AUTO_INCREMENT, nome varchar(145), "
                + "login varchar(145), senha varchar(145), email "
                + "varchar(45))\\;";
        String login = "admin";
        String senha = "12345";
        boolean criarBD = false;
        Connection conexao = null;

        try {
            Class.forName("org.h2.Driver");
            conexao = DriverManager.getConnection(url, login, senha);
        } catch (SQLException e) {
            System.out.println("Não foi possível estabelecer a conexão com o banco selecionado.");
            DAOFactory.mostrarSQLException(e);
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível carregar o driver JDBC do BD.");
        }

        return conexao;
    }

    public static Connection getConexaoH2Arquivo() throws SQLException {
        String bd = "aplicacaotest";
        String url = "jdbc:h2:./" + bd + ";DATABASE_TO_UPPER=false;";
        String login = "admin";
        String senha = "12345";
        boolean criarBD = false;
        Connection conexao = null;

        try {
            Class.forName("org.h2.Driver");
            File arquivoBD = new File(System.getProperty("user.dir")
                    + System.getProperty("file.separator") + bd + ".mv.db");
            if (!arquivoBD.exists()) {  // O arquivo do BD ainda não existe. 
                criarBD = true;
            }
            conexao = DriverManager.getConnection(url, login, senha);

            if (criarBD) {  //Cria as tabelas e insere os dados iniciais no BD.
                System.out.println("O banco de dados da aplicação não existe.");
                criarTabelas(conexao);
                System.out.println("Banco de dados criado: " + bd + ".mv.db");
            }
            System.out.println("Banco de dados utilizado: " + bd + ".mv.db");
        } catch (SQLException e) {
            System.out.println("Não foi possível estabelecer a conexão com o banco selecionado.");
            DAOFactory.mostrarSQLException(e);
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível carregar o driver JDBC do BD.");
        }

        return conexao;
    }

    public static Connection getConexaoMySQL() throws SQLException {
        String caminho = "jdbc:mysql";  // "jdbc:postgresql"
        String host = "localhost";
        String porta = "3307";  // "5432"
        String bd = "aplicacaotest";
        String login = "admin";  // "postgres"
        String senha = "12345";
        //String encoding = "?useUnicode=true&amp;characterEncoding=UTF-8";
        String url = caminho + "://" + host + ":" + porta + "/" + bd ;

        Connection conexao = null;

        try {
            System.out.println("Conectando com o banco de dados.");
            Class.forName("com.mysql.jdbc.Driver");  // "org.postgresql.Driver"
            conexao = DriverManager.getConnection(url, login, senha);
            System.out.println("Conexão com o banco de dados estabelecida.");
        } catch (ClassNotFoundException ex) {
            System.out.println("Erro ao carregar o driver JDBC.");
        }
        return conexao;
    }

    private static void criarTabelas(Connection conexao) throws SQLException {
        String create = "CREATE TABLE usuario (codigo bigint(20) "
                + "PRIMARY KEY AUTO_INCREMENT, nome varchar(145), "
                + "login varchar(145), senha varchar(145), email "
                + "varchar(45));";
        try (Statement stmt = conexao.createStatement()) {
            int resultado = stmt.executeUpdate(create);
        }
    }

    private static void inserirDadosIniciais(Connection conexao) throws SQLException {
        String insert = "INSERT INTO usuario (nome, login, senha, email) "
                + "VALUES('Estrobilobaldo', 'Seilah', '123', "
                + "'estrobilobaldo@seilah.com');";
        try (Statement stmt = conexao.createStatement()) {
            int resultado = stmt.executeUpdate(insert);
        }
    }

}
