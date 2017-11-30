/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Modelo.Alternativa;
import Modelo.Categoria;
import Modelo.DAO.AlternativaDAO;
import Modelo.DAO.CategoriaDAO;
import Modelo.DAO.ConexaoFactory;
import Modelo.DAO.DAOFactory;
import Modelo.DAO.ProvaDAO;
import Modelo.DAO.QuestaoDAO;
import Modelo.DAO.UsuarioDAO;
import Modelo.Prova;
import Modelo.Questao;
import Modelo.Usuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.jasperreports.Report;
import br.com.caelum.vraptor.jasperreports.ReportBuilder;
import br.com.caelum.vraptor.jasperreports.download.ReportDownload;
import static br.com.caelum.vraptor.jasperreports.formats.ExportFormats.pdf;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.view.Results;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 *
 * @author raphael
 */
@Controller
public class AdmController {

    @Inject
    private Usuario usuario;
    @Inject
    private Result result;

    @Path("/")
    public void questao_nova() {
        this.verificaLogado();

    }

    public void questao_inserir(Questao questao, List<Alternativa> alternativas, int resp) {
        questao.setCodigo_usuario(usuario.getCodigo());
        alternativas.get(resp).setValor(1);
        questao.setAlternativas(alternativas);
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            QuestaoDAO dao = fabrica.criarQuestaoDAO();
            dao.gravar(questao);
            mensagem = "bootbox.alert('Questao inserida com sucesso!')";
            result.include("mensagem", mensagem);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).questao_nova();

    }

    public void questao_gerenciar() {
        this.verificaLogado();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            List<Categoria> categorias = dao.listarComQuestoes(usuario);
            result.include("categorias", categorias);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void questao_categoria(Categoria categoria) {
        this.verificaLogado();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            dao.buscarEspecifica(categoria, usuario);
            result.include("categoria", categoria);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void questao_busca(String busca) {
        this.verificaLogado();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            QuestaoDAO dao = fabrica.criarQuestaoDAO();
            List<Questao> questoes = dao.buscar(busca, usuario);
            result.include("questoes", questoes);
            result.include("busca", busca);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void questao_remover(Questao questao, Categoria categoria, String busca) {
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            QuestaoDAO dao = fabrica.criarQuestaoDAO();
            dao.remover(questao);

            mensagem = "bootbox.alert('Questao removida com sucesso!')";
            result.include("mensagem", mensagem);
            if (categoria.getCodigo() != 0) {
                result.include("categoria", categoria);
            }
            if (!("").equals(busca) && null != busca) {
                result.include("busca", busca);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.use(Results.referer()).redirect();

    }

    public void questao_alterar(Questao questao) {
        this.verificaLogado();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            QuestaoDAO dao = fabrica.criarQuestaoDAO();
            dao.buscarDados(questao, usuario);
            result.include("questao", questao);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void questao_atualizar(Questao questao, List<Alternativa> alternativas, int resp) {
        alternativas.get(resp).setValor(1);
        questao.setAlternativas(alternativas);
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            QuestaoDAO dao = fabrica.criarQuestaoDAO();
            dao.atualizar(questao);
            mensagem = "bootbox.alert('Questao Atualizada com sucesso!')";
            result.include("mensagem", mensagem);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).questao_nova();
    }

    public void categoria_nova() {
        this.verificaLogado();

    }

    public void categoria_inserir(Categoria categoria) {
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            boolean verifica = dao.verificarCategoriaExiste(categoria.getNome(), usuario);
            if (!verifica) {
                dao.gravar(categoria, usuario);
                this.atualizarListaCategorias(dao);
                mensagem = "bootbox.alert('Categoria " + categoria.getNome() + " cadastrada com sucesso!')";
            } else {
                mensagem = "bootbox.alert('Categoria " + categoria.getNome() + " ja existe!')";
            }
            result.include("mensagem", mensagem);
            result.redirectTo(AdmController.class).categoria_nova();

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void categoria_remover(Categoria categoria) {
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            dao.remover(categoria);
            this.atualizarListaCategorias(dao);
            mensagem = "bootbox.alert('Categoria " + categoria.getNome() + " removida com sucesso!')";
            result.include("mensagem", mensagem);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).categoria_nova();

    }

    public void categoria_alterar(Categoria categoria) {

        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            dao.buscaDados(categoria);
            result.include("categoria", categoria);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void categoria_atualizar(Categoria categoria) {
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            CategoriaDAO dao = fabrica.criarCategoriaDAO();
            dao.atualizar(categoria);
            this.atualizarListaCategorias(dao);
            mensagem = "bootbox.alert('Categoria " + categoria.getNome() + " atulizada com sucesso!')";
            result.include("mensagem", mensagem);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).categoria_nova();

    }

    public void prova_selecionarc() {
        this.verificaLogado();
    }

    public void prova_etapa(int opc, List<Long> categorias, int nmq) {
        DAOFactory fabrica = new DAOFactory();
        if (categorias.size() == 1) {
            String mensagem = "bootbox.alert('Selecione ao menos uma categoria!')";
            result.include("mensagem", mensagem);
            result.redirectTo(AdmController.class).prova_selecionarc();
        } else {
            try {
                usuario.setProva(new Prova());
               
                usuario.getProva().setCategorias(categorias);
                fabrica.abrirConexao();
                if (opc == 1) {

                } else {

                    QuestaoDAO dao = fabrica.criarQuestaoDAO();
                    List<Questao> questoes = dao.listaAleatoria(categorias, nmq, usuario);
                    usuario.getProva().setQuestao(questoes);
                    usuario.getProva().setNmq(usuario.getProva().getQuestoes().size());
                    result.redirectTo(AdmController.class).prova_criada();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    fabrica.fecharConexao();
                } catch (SQLException ex) {
                    Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void prova_criada() {

    }

    public void prova_correcao(List<String> resp, int nmq, String time) {
        int respc = 0;
        int respe = 0;
        List<Integer> questr = new ArrayList<>();
        List<Long> respmarc = new ArrayList<>();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            AlternativaDAO dao = fabrica.criarAlternativaDAO();
            for (int i = 0; i < resp.size(); i++) {
                String[] parts = resp.get(i).split("-", 2);
                questr.add(Integer.parseInt(parts[0]));
                respmarc.add(Long.parseLong(parts[1]));
                if (dao.resposta(respmarc.get(i)) == 0) {
                    respe = respe + 1;
                } else {
                    respc = respc + 1;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.include("questr", questr);
        result.include("respmarc", respmarc);
        result.include("respc", respc);
        result.include("respe", respe);
        result.include("nmq", nmq);
        result.include("time", time);

    }

    public void prova_salvar() {
        String mensagem = "";
        if (usuario.getProva().getCodigo() == 0) {
            DAOFactory fabrica = new DAOFactory();
            try {

                fabrica.abrirConexao();
                ProvaDAO dao = fabrica.criarProvaDAO();
                dao.gravar(usuario);
                mensagem = "bootbox.alert('Prova salva com sucesso!')";

            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    fabrica.fecharConexao();
                } catch (SQLException ex) {
                    Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            mensagem = "bootbox.alert('Prova ja foi salva')";
        }
        result.include("mensagem", mensagem);
        result.redirectTo(AdmController.class).prova_salvas();

    }

    public void prova_salvas() {
        this.verificaLogado();
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            ProvaDAO dao = fabrica.criarProvaDAO();
            List<Prova> provas = dao.listar(usuario);
            result.include("provas", provas);
        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void prova_remover(Prova prova) {
        String mensagem = "";
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            ProvaDAO dao = fabrica.criarProvaDAO();
            dao.remover(prova);
            
            mensagem = "bootbox.alert('Prova removida com sucesso!')";
            result.include("mensagem", mensagem);

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).prova_salvas();

    }
    
    public void prova_visualizar(Prova prova){
        DAOFactory fabrica = new DAOFactory();
        try {

            fabrica.abrirConexao();
            ProvaDAO dao = fabrica.criarProvaDAO();
            dao.buscarDados(prova,usuario);
            
          

        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fabrica.fecharConexao();
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        result.redirectTo(AdmController.class).prova_criada();
        
    }
    
     public Download prova_baixar(Prova prova,final ServletContext contexto) throws SQLException {
        String jasper = contexto.getRealPath("/WEB-INF/reports") + "/";
        Report report = new ReportBuilder()
                .withTemplate("Prova.jasper")
                .addParam("CODIGO",prova.getCodigo())
                
                .addParam("java.sql.Connection", ConexaoFactory.getConexao())
                .addParam("SUBREPORT_DIR", jasper)
                .withFileName("Prova ID "+prova.getCodigo())
                .build();
        return new ReportDownload(report, pdf());
    }

    public void verificaLogado() {
        if (usuario.getLogin() == null) {
            Subject usuarioAtual = SecurityUtils.getSubject();
            String login = usuarioAtual.getPrincipal().toString();
            DAOFactory fabrica = new DAOFactory();

            try {

                fabrica.abrirConexao();
                UsuarioDAO dao = fabrica.criarUsuarioDAO();
                dao.buscarDadosCliente(login, usuario);
            } catch (SQLException ex) {
                Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    fabrica.fecharConexao();
                } catch (SQLException ex) {
                    Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void atualizarListaCategorias(CategoriaDAO dao) {

        try {
            List<Categoria> categorias = dao.listar(usuario);
            usuario.setCategorias(categorias);
        } catch (SQLException ex) {
            Logger.getLogger(AdmController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
