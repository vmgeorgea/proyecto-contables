<%-- 
    Document   : FacturaVentaCabecera
    Created on : Jul 12, 2014, 9:07:10 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "Clases.FacturaVentaClass"%> 
<%@ page import = "DAO.FacturaVentaDAO"%> 
<%@ page import = "Clases.ClienteClass"%> 
<%@ page import = "DAO.ClienteDAO"%> 
<%@ page import = "java.util.LinkedList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cabecera</title>
    <script language="javascript" type="text/javascript" >
        function Datos(){
        var f = new Date();
            if((f.getMonth() +1)<10){
            var fecha=f.getDate() + "/0" + (f.getMonth() +1) + "/" + f.getFullYear(); 
            }else{
            var fecha=f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();     
            }
         document.Ingresar.fechaFactura.value=fecha;
        }      
    </script>        
    </head>
    <body onload="Datos()">
        <div>
                <table id="Ingresar">
                        <tr>
                        <th>Registro de Factura</th>
                        </tr>
                        <tr>
                                <td>Factura Nº:</td>
                                 <%
                                        LinkedList<FacturaVentaClass> lista1 =new LinkedList<FacturaVentaClass>();
                                        lista1 = FacturaVentaDAO.consultarfinal();
                                        boolean b=lista1.get(0).getIdFactura().equals("0");
                                        if(b){
                                            out.println("<td><input type='text' id='numeroFactura' name='numeroFactura' readonly='readonly' value='"+0+"'/></td>");
                                        }else{
                                            int a=Integer.parseInt(lista1.get(0).getIdFactura())+1;
                                            out.println("<td><input type='text' id='numeroFactura' name='numeroFactura' readonly='readonly' value='"+a+"'/></td>");
                                        }
                                %>                                       
                                <td>Fecha:</td>
                                <td><input type="text" id="fechaFactura" name="fechaFactura" readonly="readonly"/></td>
                        </tr>
               </table>
           </div>
    </body>
</html>
