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
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js" type="text/javascript"></script>
         <script src="${pageContext.request.contextPath}/assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/purify.min.js"></script>

        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height:50%}

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;}
            }
            .teste{
                
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    border: 3px solid black;
                    width: 500px;
                    height: 400px;
                    margin-left: -200px;
                    margin-top: -150px;
                
            }
        </style>
       

        <shiro:authenticated>
            <script>
                window.location.replace("/aplicacao");
                
            </script>
        </shiro:authenticated>
          
    </head>


    <body 
          >


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










    </body>

    


</html>
