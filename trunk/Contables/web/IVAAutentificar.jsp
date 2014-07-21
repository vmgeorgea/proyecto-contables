<%-- 
    Document   : IVAAutenficar
    Created on : Jul 18, 2014, 2:54:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>    
        <script type="text/javascript">
            $(document).ready(function() {
                    $(".modalbox").fancybox();
            });
        </script>        
    </head>
    <body>
        <center>
            <a class='modalbox' href='#ingresar'><img SRC='Imagen/Autentificar.png'></a>
             <div id="ingresar">
                <h2>Nuevo</h2>
                <form id="ingresarform" name="ingresarform" action="AutentificarIVAServlet" method="post" >
                    <label for="Usuario">Usuario  </label>
                    <input align='right' type="text" id="usuario" name="usuario" class="txtingresar" required="required">
                    <br>

                    <label for="Contrasenia">Contraseña  </label>
                    <input align='right' type="password" id="contrasenia" name="contrasenia" class="txtingresar" required="required">
                    <br>                       
                    <input type="submit" value="Ingresar" id="send">
                </form>
            </div>
        </center>    
    </body>
</html>
