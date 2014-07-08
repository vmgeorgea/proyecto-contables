<%-- 
    Document   : Contenido
    Created on : 02/07/2014, 07:56:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <style>
            body{
                background:#EEEEEE;
            }
        </style>    
        
    <body>
            <center>
                <h3>Login successful!!!</h3>
                <h4>
                    Hello,
                    <%=session.getAttribute("id")%>
                </h4>                       
            </center>

    </body>
</html>
