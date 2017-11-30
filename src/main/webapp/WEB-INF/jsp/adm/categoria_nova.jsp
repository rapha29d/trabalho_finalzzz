<%-- 
    Document   : questao_inserir
    Created on : 12/11/2017, 12:12:49
    Author     : raphael
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Aplicacao - categorias</title>
        <!-- Bootstrap core CSS-->
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "language": {
                        "url": "${pageContext.request.contextPath}/assets/js/Portuguese-Brasil.json"
                    }
                });
                $('[data-toggle="tooltip"]').tooltip();


                $('button[name="remove"]').on('click', function (e) {
                    var $form = $(this).closest('form');
                    e.preventDefault();
                    $('#confirm').modal({
                        backdrop: 'static',
                        keyboard: false
                    })
                            .one('click', '#confirmOk', function (e) {
                                $form.trigger('submit');
                            });
                });
            ${mensagem}
            });

        </script>
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="index.html">Bem vindo ${usuario.nome} </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-question-circle"></i>
                            <span class="nav-link-text">Questao</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseComponents">
                            <li>
                                <a href="/aplicacao">Inserir</a>
                            </li>
                            <!--<li>
                                <a href="/aplicacao/adm/questao_gerenciar">Gerenciar</a>
                            </li>-->
                            <li>
                                <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">Gerenciar</a>
                                <ul class="sidenav-third-level collapse" id="collapseMulti2">
                                     <li>
                                        <a href="/aplicacao/adm/questao_gerenciar">Todas</a>
                                    </li>
                                    
                                    <c:forEach var="categoria" items="${usuario.categorias}" varStatus="i">
                                        <li>
                                            <a href="/aplicacao/adm/questao_categoria?categoria.codigo=${categoria.codigo}">${categoria.nome}</a>
                                        </li>
                                    </c:forEach>

                                    
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-sitemap"></i>
                            <span class="nav-link-text">Categoria</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseExamplePages">
                            <li>
                                <a href="#">Inserir</a>
                            </li>


                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-file"></i>
                            <span class="nav-link-text">Prova Online</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseMulti">
                            <li>
                                <a href="/aplicacao/adm/prova_selecionarc">Criar</a>
                            </li>
                            <li>
                                <a href="/aplicacao/adm/prova_salvas">Salvas</a>
                            </li>


                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMultiArray" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-book"></i>
                            <span class="nav-link-text">Frequencia</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseMultiArray">
                            <li>
                                <a href="#">Chamada</a>
                            </li>
                            <li>
                                <a href="#">Relatorio</a>
                            </li>


                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">


                    <li class="nav-item">

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="col-sm-12 text-left">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Categoria</a>
                        </li>
                        <li class="breadcrumb-item active">Inserir</li>
                    </ol>
                    <form class="form-horizontal" action="/aplicacao/adm/categoria_inserir" method="post">
                        <input type="hidden" value="2" name="opc" />
                        <div class="panel panel-default">
                              <div class="panel-heading bg-dark" style="color:white">&nbsp<i class="fa fa-plus-circle"></i> Nova Categoria</div>
                            <div class="panel-body">



                                <br>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="Nome" >Nome:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="Nome" placeholder="Nome da categoria" name="categoria.nome" value="${categoria.nome}" required="">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="desc" >Descriçao:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="desc" placeholder="digite a descriçao" name="categoria.descricao" value="${categoria.descricao}">
                                    </div>
                                </div>



                                <br>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-success"  name="salvar"><i class="fa fa-plus"></i> Adicionar</button>
                                    <button type="reset" class="btn btn-dark" style="float:right"><i class="fa fa-eraser"></i> Limpar</button>
                                </div>

                            </div>
                            <hr>        
                            <br>

                        </div>


                    </form>

                    <!-- Example DataTables Card-->
                      <c:if test="${!empty usuario.categorias}">
                    <div class="card mb-3">
                        <div class="card-header bg-dark" style="color:white" >
                            <i class="fa fa-database"></i> Categorias cadastradas</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>qtdQuestoes</th>
                                            <th style="text-align: center">Ação</th>

                                        </tr>
                                    </thead>


                                    <tbody>
                                        <c:forEach var="categoria" items="${usuario.categorias}" varStatus="i">
                                            <tr>
                                                <td>${categoria.nome}</td>
                                                <td>${categoria.descricao}</td>
                                                <td>${categoria.qtdq}</td>
                                                <td>
                                                    <div class="container">
                                                        <div class="pull-left">
                                                            <form action="/aplicacao/adm/categoria_alterar" method="post">
                                                                <input type="hidden" name="categoria.codigo" value="${categoria.codigo}">
                                                                <button type="submit" class="btn btn-primary" data-toggle="tooltip" title="Atualizar categoria ${categoria.nome}" ><i class="fa fa-edit"></i></button>
                                                            </form>
                                                        </div>

                                                        <div class="pull-right">
                                                            <form action="/aplicacao/adm/categoria_remover" method="post">
                                                                <input type="hidden" name="categoria.nome" value="${categoria.nome}">
                                                                <input type="hidden" name="categoria.codigo" value="${categoria.codigo}">
                                                                <button type="submit" class="btn btn-danger" data-toggle="tooltip" title="remover categoria ${categoria.nome}" name="remove"><i class="fa fa-trash-o"></i></button>
                                                            </form>

                                                        </div>
                                                    </div>


                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>


                    </div>
                    </c:if>
                </div>
                <br>
                <br>
            </div>

            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>Copyright © TEDS - Aplicacao 2017</small>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Pronto para sair?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Deseja realmente terminar essa sessão?.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/usuarios/sair">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal" id="confirm" style="display: none; z-index: 1050;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body" id="confirmMessage">
                            <p><i class="fa fa-fw fa-warning" style="color:orange"></i>Deseja realmente remover essa categoria?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" id="confirmOk" data-dismiss="modal">Ok</button>
                            <button type="button" class="btn btn-default" id="confirmCancel"  data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>            
            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/Chart.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/datatables/jquery.dataTables.js"></script>
            <script src="${pageContext.request.contextPath}/assets/vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="${pageContext.request.contextPath}/assets/js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="${pageContext.request.contextPath}/assets/js/sb-admin-datatables.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/sb-admin-charts.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js" type="text/javascript"></script>
            <script src="${pageContext.request.contextPath}/assets/js/plugins/purify.min.js"></script>
            <link href="${pageContext.request.contextPath}//assets/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>
            <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator.js" type="text/javascript"></script>
        </div>
    </body>
</html>
