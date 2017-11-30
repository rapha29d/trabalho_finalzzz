<%-- 
    Document   : cadastro
    Created on : 09/11/2017, 17:33:59
    Author     : raphael
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap core CSS-->
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script> 


        <script src="${pageContext.request.contextPath}/assets/js/plugins/sortable.min.js"></script>
        <!-- purify plugin for safe rendering HTML content in preview -->
        <script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/purify.min.js"></script>
        <link href="${pageContext.request.contextPath}//assets/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator.js" type="text/javascript"></script>
        <title>Aplicação - Cadastro de Usuario</title>
        <script>
            $(document).ready(function () {
            ${mensagem}
            });

        </script>
    </head>
    <body class="bg-dark">



        <div class="container">
            <div class="card card-register mx-auto mt-5">
                <div class="card-header">Efetuar Cadastro</div>
                <div class="card-body">
                    <form  action="/aplicacao/usuarios/cadastrar" method="post"  role="form" method="post"  role="form" data-toggle="validator" data-disable="false" class="form-horizontal" id="cpf_form">
                        <div class="form-group">
                            <label for="exampleInputNome">Nome</label>
                            <input class="form-control" id="exampleInputNome" type="text" aria-describedby="emailHelp" placeholder="Nome completo" name="nome" value="${nome}" required="">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Digite o email" name="email" value="${email}" required="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputLogin">Usuario</label>
                            <input class="form-control" id="exampleInputLogin" type="text" aria-describedby="emailHelp" placeholder="Digite o Login" name="login" value="${login}" required="">
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="exampleInputPassword1">Senha</label>
                                    <input class="form-control" id="exampleInputPassword1" type="password" placeholder="Digite a senha" name="senha" value="${senha}" required="">
                                </div>
                                <div class="col-md-6">
                                    <label for="exampleConfirmPassword">Confirmar Senha</label>
                                    <input class="form-control" id="exampleConfirmPassword" type="password" placeholder="Confirme a senha digitada" value="${senha}" required="">
                                </div>
                            </div>
                        </div>
                        <input class="btn btn-primary btn-block" type="submit" value="Registrar">
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="/aplicacao/usuarios/login">Pagina de Login</a>

                    </div>
                </div>
            </div>
        </div> 

        <!-- <div class="container-fluid">
             <div class="row">
 
            color:#131313
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
                 <div class="col-sm-12"  style="" id="content">
                     <h3 style="text-align: center;">Cadastro de Novo Usuário</h3>
                     <hr>
                     <div class="col-sm-2 col-lg-3"></div>
                     <div class="col-sm-8 col-lg-6">
                         <h4>Dados Pessoais</h4>
 
                         <br>
                         <form action="/aplicacao/usuarios/cadastrar" method="post"  role="form" data-toggle="validator" data-disable="false" class="form-horizontal" id="cpf_form">
                             <div class="form-group">  <label class="control-label col-sm-2" for="inputName">Usuario: *</label>
 
                                 <div class="col-sm-10">
                                     <div class="input-group">
                                         <span class="input-group-addon glyphicon glyphicon-user" style="position:initial"></span> 
 
                                         <input type="text" name="login" class="form-control" placeholder="Entre com o login" value="${login}" id="inputName" required="">
                                     </div>
 
                                 </div> 
 
                             </div>
 
                             <div class="form-group">  <label class="control-label col-sm-2" for="inputColor">Senha: *</label>
                                 <div class="col-sm-10">
                                     <div class="input-group">
                                         <span class="input-group-addon glyphicon glyphicon-lock" style="position:initial"></span> 
                                         <input type="password" name="senha" class="form-control" placeholder="Digite a senha" value="${senha}" id="inputColor" required="">
                                     </div>
 
                                 </div>  
                             </div>
 
 
 
                             <div class="form-group">  <label class="control-label col-sm-2" for="inputFabricante">Nome: *</label>
                                 <div class="col-sm-10">
 
                                     <input type="text" name="nome" class="form-control" placeholder="Nome completo" value="${nome}" required="" id="inputFabricante">
 
                                 </div> 
                             </div>
 
 
 
                             <div class="form-group">   <label class="control-label col-sm-2" for="inputQtd">Email: *</label>
 
                                 <div class="col-sm-10">
 
 
                                     <input type="email" name="email" class="form-control" placeholder="Email valido" value="${email}"  id="inputQtd">
 
 
 
                                 </div>
                             </div>
                             <hr>
 
 
                             <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type="submit" value="cadastrar" class="btn btn-success"><input type="reset" value="limpar" class="btn btn-default" style="float: right"></div></div>
 
                         </form>
 
                     </div>
 
 
 
                 </div>
 
 
             </div>
        -->                       

        <!-- Bootstrap core JavaScript-->


    </body>
</html>
