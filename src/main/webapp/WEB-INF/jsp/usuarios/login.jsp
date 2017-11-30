<%-- 
    Document   : login
    Created on : 09/11/2017, 17:05:56
    Author     : raphael
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Aplicação - Autenticaçao</title>
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
        
        
    </head>

    <shiro:authenticated>
        <script>
            window.location.replace("/aplicacao");

        </script>
    </shiro:authenticated>
    
    
     <script>
            $(document).ready(function () {
               ${mensagem}
                       
               <c:if test="${shiroLoginFailure != null}">
        
                 bootbox.alert('Usuario ou senha incorreto!')
       
              </c:if>        
                    
            });

      </script>    
</head>


<body class="bg-dark">

    
    
    
    

     <div class="container"style="margin-top:17%">
    <div class="card card-login mx-auto mt-5">

      <div class="card-header">Login</div>
      <div class="card-body">
        <form name="loginform" action="" method="post"  role="form" data-toggle="validator" data-disable="false"  id="cpf_form">
          <div class="form-group">
            <label for="exampleInputEmail1" >Usuario</label>
            <input class="form-control" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="Entre com o Login" name="username">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Senha</label>
            <input class="form-control" id="exampleInputPassword1" type="password" placeholder="Entre com a senha" name="password">
          </div>
          
          <input type="submit" class="btn btn-primary btn-block" value="Entrar">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/aplicacao/usuarios/cadastro">Efetuar Registro</a>
          <p></p>
        </div>
      </div>
    </div>
  </div>
    <!--
    <div class="container-fluid " >
        <div class="row">
            <div class="col-lg-12" style="height:25%">

            </div>
        </div>
        <div class="row content teste">
            <div class="row">






















             
               <div class="col-sm-12"  style="" id="content">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color:#101010;color:white">Login</div>
                        <div class="panel-body">
                            <div class="col-sm-6" style="border-right:1px solid #b3b6bc;">
                                <form name="loginform" action="" method="post"  role="form" data-toggle="validator" data-disable="false"  id="cpf_form">
                                    <div class="form-group">  <label  for="inputName">Usuario</label>


                                        <div class="input-group">
                                            <span class="input-group-addon glyphicon glyphicon-user" style="position:initial"></span> 

                                            <input type="text" name="username" class="form-control" placeholder="Entre com o login" value="${login}" id="inputName" required="">
                                        </div>



                                    </div>

                                    <div class="form-group">  <label for="inputColor">Senha</label>

                                        <div class="input-group">
                                            <span class="input-group-addon glyphicon glyphicon-lock" style="position:initial"></span> 
                                            <input type="password" name="password" class="form-control" placeholder="Digite a senha" value="${senha}" id="inputColor" required="">
                                        </div>


                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Entrar" class="btn btn-primary" style="width:100px" onclick="">
                                    </div>       
                                </form>

                            </div>
                            <div class="col-sm-6">
                                <h4>CRIAR UMA CONTA</h4>

                                <p>
                                    Efetuar cadastro para desfrutar de todas as funcionalidade da aplicaçao
                                </p>
                                <a href="/aplicacao/usuarios/cadastro"> <input type="button" value="Continuar" class="btn btn-default" style="width:100px"></a>
                            </div>

                        </div>
                    </div>
                </div>
                <hr>



            </div>


        </div>




    </div>
    -->







 
</body>




</html>
