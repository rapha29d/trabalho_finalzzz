package Modelo.DAO;

import java.sql.Connection;
import java.sql.SQLException;

public class DAOFactory {

    private Connection conexao = null;

    public CategoriaDAO criarCategoriaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new CategoriaDAO(conexao);
        }
    }
    
     public QuestaoDAO criarQuestaoDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new QuestaoDAO(conexao);
        }
    }
     
     public DisciplinaDAO criarDisciplinaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new DisciplinaDAO(conexao);
        }
    }
     
     public UsuarioDAO criarUsuarioDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new UsuarioDAO(conexao);
        }
    }
     
     public AlternativaDAO criarAlternativaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new AlternativaDAO(conexao);
        }
    }
     
     public FrequenciaDAO criarFrequenciaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new FrequenciaDAO(conexao);
        }
    }
     
     public Aluno_DisciplinaDAO criarAluno_DisciplinaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new Aluno_DisciplinaDAO(conexao);
        }
    }
     
     public AlunoDAO criarAlunoDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new AlunoDAO(conexao);
        }
    } 
     public ProvaDAO criarProvaDAO() {
        if (conexao == null) {
            throw new IllegalStateException("Abra uma conexão antes de criar um DAO.");
        } else {
            return new ProvaDAO(conexao);
        }
    } 
     
     
     
     
     
     

    public void abrirConexao() throws SQLException {
        if (conexao == null) {
            conexao = ConexaoFactory.getConexao();
        } else {
            throw new IllegalStateException("A conexão já está aberta.");
        }
    }

    public void fecharConexao() throws SQLException {
        if (conexao != null) {
            System.out.println("Terminando a conexão com o banco de dados.");
            conexao.close();
            conexao = null;
            System.out.println("Conexão com o banco de dados terminada.");
        } else {
            throw new IllegalStateException("A conexão com o BD já está fechada.");
        }
    }

    public void iniciarTransacao() throws SQLException {
        conexao.setAutoCommit(false);
    }

    public void terminarTransacao() throws SQLException {
        conexao.commit();
        conexao.setAutoCommit(true);
    }

    public void abortarTransacao() throws SQLException {
        conexao.rollback();
        conexao.setAutoCommit(true);
    }

    public static void mostrarSQLException(SQLException ex) {
        SQLException e = ex;
        while (e != null) {
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("Mensagem: " + e.getMessage());
            Throwable t = e.getCause();
            while (t != null) {
                System.out.println("Causa: " + t);
                t = t.getCause();
            }
            e = e.getNextException();
        }
    }

}
