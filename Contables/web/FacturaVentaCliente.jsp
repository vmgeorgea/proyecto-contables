<%-- 
    Document   : FacturaVentaCliente
    Created on : Jul 12, 2014, 9:06:55 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
          <div>                                                                              
               <form name="Ingresar" id="Ingresar" action="BuscarClienteServlet"> 
                  <table>
                        <tr>
                                <td>Cliente:</td>
                                <td><input type="text" id="cedulaCliente" name="cedulaCliente" required="required" value="trolo"></td>
                                <td><a><img SRC='Imagen/Agregar.png' onclick="document.forms.submit();"></a></td>
                        </tr>                                               
                            <td><input type="submit" NAME="submit" VALUE="Button 1"></td>
            </table>
            </form>            
        </div>
    </body>
</html>
