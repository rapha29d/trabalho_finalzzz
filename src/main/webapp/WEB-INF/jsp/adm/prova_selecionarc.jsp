<%-- 
    Document   : questao_nova
    Created on : 09/11/2017, 18:02:25
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
        <title>Aplicacao - Nova Questão</title>
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
            ${mensagem}
                $('input[type="radio"]').on('change', function (e) {
                    $("#div1").toggle();
                    $("#div2").toggle();
                });

            });

        </script>
        <style>
            .checkbox label:after, 
            .radio label:after {
                content: '';
                display: table;
                clear: both;
            }

            .checkbox .cr,
            .radio .cr {
                position: relative;
                display: inline-block;
                border: 1px solid #a9a9a9;
                border-radius: .25em;
                width: 1.3em;
                height: 1.3em;
                float: left;
                margin-right: .5em;
            }

            .radio .cr {
                border-radius: 50%;
            }

            .checkbox .cr .cr-icon,
            .radio .cr .cr-icon {
                position: absolute;
                font-size: .8em;
                line-height: 0;
                top: 50%;
                left: 20%;
            }

            .radio .cr .cr-icon {
                margin-left: 0.04em;
            }

            .checkbox label input[type="checkbox"],
            .radio label input[type="radio"] {
                display: none;
            }

            .checkbox label input[type="checkbox"] + .cr > .cr-icon,
            .radio label input[type="radio"] + .cr > .cr-icon {
                transform: scale(3) rotateZ(-20deg);
                opacity: 0;
                transition: all .3s ease-in;
            }

            .checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
            .radio label input[type="radio"]:checked + .cr > .cr-icon {
                transform: scale(1) rotateZ(0deg);
                opacity: 1;
            }

            .checkbox label input[type="checkbox"]:disabled + .cr,
            .radio label input[type="radio"]:disabled + .cr {
                opacity: .5;
            }
        </style>
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="index.html">Bem vindo ${usuario.nome}</a>
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
                                <a href="/aplicacao/adm/categoria_nova">Inserir</a>
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
                                <a href="#">Criar</a>
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
                            <a href="#">Prova</a>
                        </li>
                        <li class="breadcrumb-item active">Criar</li>
                    </ol>
                    <c:if test="${!empty usuario.categorias}"> 
                        <form method="post" action="/aplicacao/adm/prova_etapa">
                            <div class="panel-heading bg-dark" style="color:white">&nbsp<i class="fa fa-sitemap"></i> Categorias Disponiveis</div>
                            

                            <table class="table table-hover">
                                <c:set var="total" value="${0}"/>
                                <c:forEach var="categoria" items="${usuario.categorias}" varStatus="i">
                                    <tr>
                                        <td>
                                            <div class="checkbox ho">
                                                <label>
                                                    <input type="checkbox" value="${categoria.codigo}" name="categorias[${i.index}]">
                                                    <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                        ${categoria.nome}
                                                </label>
                                            </div>
                                        </td>

                                    </tr>
                                    <c:set var="total" value="${total+1}"/>  
                                </c:forEach>
                                <input type="checkbox" checked="" value="-1" name="categorias[${total}]"  style="display: none">      
                            </table>
                            <hr>
                            <p>Modo de seleção das questões</p>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opc" value="0" checked="">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Aleatório
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opc" value="1">
                                    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                    Manual
                                </label>
                            </div>
                            <div class="col-sm-3" style="" id="div1">
                                <div class="form-group row">
                                    <div class="col-xs-2">
                                        <label for="email" style="font-size:18px;font-weight: inherit">Numero de questoes:</label>
                                        <input type="number" class="form-control" id="email"  name="nmq" size="5" min="1">
                                        <br>
                                        <button type="submit" class="btn btn-info"  id="gerar" name="gerar" ><span class="glyphicon glyphicon-knight"></span> Proximo</button>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-3" style="display: none" id="div2">
                                <div class="form-group row">
                                    <div class="col-xs-2">
                                        <label for="email2" style="font-size:18px;font-weight: inherit" ><font style="color:graytext">Numero de questoes:</font></label>
                                        <input type="number" class="form-control" id="email2" size="5" disabled="" min="0">
                                        <br>
                                        <button type="submit" class="btn btn-info"  id="gerar" name="gerar" ><span class="glyphicon glyphicon-knight"></span> Proximo</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${empty usuario.categorias}">
                        <h4>Nenhuma categoria cadastrada.</h4>
                    </c:if> 
                </div>
                <br>

            </div>
            <!--<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
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
        <script>

        </script>
    </div>
</body>
</html>
