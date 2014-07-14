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
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <script type="text/javascript" src="JS/ValidarJS.js"></script>
        <title>Proveedor</title>
    </head>
    <body>
        <center>
          <div>                                                                              
               <form name="Ingresar" id="Ingresar" action="BuscarProveedorServlet"> 
                  <table id="miTabla">
                        <tr>
                        Registro de Proveedor
                        </tr>
                        <tr>
                        <td class="estilo1">Proveedor:</td>
                        <td class="estilo1"><input type="text" id="identificacionProveedor" name="identificacionProveedor" required="required" onkeypress="return Numeros(event)"></td>                                
                        <td class="estilo1"><button name="boton" type="submit" style="background-color:white; border:none"><img src="Imagen/Agregar.png" align="left"></button><td>
                        </tr>                                               
                            
                </table>
                   
            </form>            
        </div>
     </center>
    </body>
</html>
