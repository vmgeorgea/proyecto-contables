<%-- 
    Document   : FacturaVentaGuardar
    Created on : Jul 12, 2014, 4:57:34 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <title>JSP Page</title>
    </head>
    <%
    java.util.Calendar fecha = java.util.Calendar.getInstance();
    String f=fecha.get(java.util.Calendar.DATE) + "/"+ fecha.get(java.util.Calendar.MONTH)+ "/"+ fecha.get(java.util.Calendar.YEAR);
    session.setAttribute("fechaFactura", f);
    %>
    <body>
 <center>
          <div>      
              
               <form name="Ingresar" id="Ingresar" action="FacturaVentaServlet"> 
                  <table id="miTabla">
                        <tr>                               
                           <td class="estilo1"><button name="boton" type="submit" style="background-color:white; border:none">Guardar</button><td>
                        </tr>                                               
                            
                </table>
                   
            </form>            
        </div>
     </center>
    </body>
</html>
