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

    <body class="fixed-nav sticky-footer bg-dark" id="page-top" >
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
                            <a href="#">Prova</a>
                        </li>
                        <li class="breadcrumb-item active">Correção</li>
                    </ol>
                    <h4>Resultado</h4>
                    <br>
                    <br>
                    Tempo gasto na resolução: ${time} 
                    <br><br>
                    Numero total de questões: ${nmq}<br><br>
                    Quantidade de questoes respondida: ${respe+respc}/${nmq}<br>


                    <div class="progress" style="text-align:center">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="4" aria-valuemin="width:${((respe+respc)*100)/nmq}" aria-valuemax="100" style="width:${((respe+respc)*100)/nmq}%">

                            (
                            <fmt:formatNumber type = "percent" 
                                              maxIntegerDigits="3" value = "${((respe+respc))/nmq}"   minFractionDigits = "0"/>)
                        </div>
                    </div>
                    <br>

                    Quantidade de respostas certas: ${respc}/${nmq}
                    <div class="progress" style="text-align:center">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="4" aria-valuemin="width:${(respc*100)/nmq}" aria-valuemax="100" style="width:${(respc*100)/nmq}%;background-color: #5cb85c;">
                            (
                            <fmt:formatNumber type = "percent" 
                                              maxIntegerDigits="3" value = "${respc/nmq}"   minFractionDigits = "0"/>)
                        </div>
                    </div>
                    <br>

                    Quantidade de respostas erradas: ${respe+(nmq-(respe+respc))}/${nmq}

                    <div class="progress" style="text-align:center">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="4" aria-valuemin="width:${(respe+(nmq-(respe+respc)))*100/nmq}" aria-valuemax="100" style="width:${(respe+(nmq-(respe+respc)))*100/nmq}%;background-color: #d9534f">

                            (
                            <fmt:formatNumber type = "percent" 
                                              maxIntegerDigits="3" value = "${(respe+(nmq-(respe+respc)))/nmq}"   minFractionDigits = "0"/>)
                        </div>
                    </div> 
                    <br>
                    <a data-toggle="collapse" data-target="#gabarito" style="margin-left:2%" href="#"><b><i class="fa fa-commenting"></i> Gabarito</b></a>
                    <div class="col-sm-3 collapse" id="gabarito" >
                        <table class="table table-hover table-bordered">
                            <thead>
                            <th>
                                Numero
                            </th>
                            <th>
                                Correta
                            </th>
                            <th>
                                Marcada
                            </th>
                            <th>
                                Resultado
                            </th>
                            </thead>
                            <tbody>
                                <c:forEach items="${usuario.prova.questao}" var="questao" varStatus="i">


                                    <tr>
                                        <td>${i.count}</td>
                                        <td>
                                            <c:forEach items="${questao.alternativas}" var="alternativa" varStatus="j">
                                                <c:if test="${alternativa.valor==1}">
                                                    <b>${alternativa.alphabet[j.index]}</b>
                                                </c:if>

                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:set var="result" value="${0}"/>
                                            <c:forEach items="${questr}" var="v" varStatus="j">
                                                <c:if test="${i.index==v}">
                                                  
                                                    <c:forEach items="${questao.alternativas}" var="alternativa" varStatus="k">
                                                        <c:if test="${alternativa.codigo==respmarc[j.index]}">
                                                            <b>${alternativa.alphabet[k.index]}</b>
                                                            <c:if test="${alternativa.valor==1}">
                                                                <c:set var="result" value="${1}"/>
                                                            </c:if>
                                                        </c:if>

                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:if test="${result==1}">
                                                <i class="fa fa-check" style="color:#5cb85c">
                                                    
                                                </i>
                                            </c:if>
                                             <c:if test="${result==0}">
                                                <i class="fa fa-times" style="color:#d9534f">
                                                    
                                                </i>
                                            </c:if>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    / <a href="/aplicacao/adm/prova_criada"><i class="fa fa-refresh"></i> Refazer</a><c:if test="${usuario.prova.codigo==0}"> / <a href="/aplicacao/adm/prova_salvar"><i class="fa fa-save"></i> Salvar</a> /  <a href="/aplicacao/adm/prova_selecionarc"><i class="fa fa-recycle"></i> Descartar</a></c:if><c:if test="${usuario.prova.codigo!=0}"> / <a href="/aplicacao/adm/prova_salvas"><i class="fa fa-reply"></i> Voltar</a></c:if>
                </div> 

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


</div>
</body>
</html>
