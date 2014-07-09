<%-- 
    Document   : Menu
    Created on : 02/07/2014, 03:16:28 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href=CSS/MenuCSS.css rel="stylesheet" type="text/css"/>
        <script src=JS/MenuJS.js type="text/javascript"></script>
    </head>
        <style>
            body{
                background:#A0A4AB;
            }
        </style>
        
     <script type="text/javascript">
         function salir(){
        self.close(this.window);
        <a href="index.jsp"/a>
         }
      </script>

    <body>
        <div id="sse2">
          <div id="sses2">
            <ul>
              <li><a href="Tipo.jsp" onclick="?menu=2&skin=1&p=Horizontal-Menus" target="contenido">Tipo</a></li>
              <li><a href="Cuenta.jsp" onclick="?menu=2&skin=1&p=Horizontal-Menus" target="contenido">Cuenta</a></li>              
              <li><a href="Asiento.jsp" onclick="?menu=2&skin=1&p=Horizontal-Menus" target="contenido">Asiento</a></li>              
            </ul>
          </div>
        </div>

</html>
