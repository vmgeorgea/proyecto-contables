<%-- 
    Document   : FacturaCompraCabecera
    Created on : Jul 12, 2014, 9:07:10 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "Clases.FacturaCompraClass"%> 
<%@ page import = "DAO.FacturaCompraDAO"%> 
<%@ page import = "Clases.ProveedorClass"%> 
<%@ page import = "DAO.ProveedorDAO"%> 
<%@ page import = "java.util.LinkedList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cabecera</title>
     <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
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
    <body onload="Datos()" >
     <center>
        <div>
            <form id="Ingresar" name="Ingresar">
                <table id="miTabla">
                        <tr>
                                <td class="estilo1">RUC:</td>
                                <td class="estilo1"><input type="text" id="rucFactura" name="rucFactura" readonly="readonly" value="7839489398001"></td>                            
                                <td class="estilo1">Autorizacion:</td>
                                <td class="estilo1"><input type="text" id="autorizacionFactura" name="autorizacionFactura" readonly="readonly" value="986789456734"></td>
                                 <td class="estilo1">Punto Emision:</td>
                                <td class="estilo1" ><input type="txt" id="punoemisionFactura" name="punoemisionFactura" readonly="readonly" value="001"></td>                            
                         </tr>
                        <tr>                                
                                <td class="estilo1">Establecimiento:</td>
                                <td class="estilo1"><input type="text" id="establecimientoFactura" name="establecimientoFactura" readonly="readonly" value="PARQUE INDUSTRIAL"></td>
                                <td class="estilo1" >Factura Nº:</td>
                                 <%
                                        LinkedList<FacturaCompraClass> lista1 =new LinkedList<FacturaCompraClass>();
                                        lista1 = FacturaCompraDAO.consultarfinal();
                                        boolean b=lista1.get(0).getIdFactura().equals("0");
                                        int a=0;
                                        if(b){                                           
                                            out.println("<td class='estilo1'><input type='text' id='numeroFactura' name='numeroFactura' readonly='readonly' value='"+1+"'/></td>");
                                        }else{
                                             a=Integer.parseInt(lista1.get(0).getIdFactura())+1;
                                            out.println("<td class='estilo1'><input type='text' id='numeroFactura' name='numeroFactura' readonly='readonly' value='"+a+"'/></td>");
                                        }
                                        session.setAttribute("idFactura", a);
                                %>                                       
                                <td class="estilo1">Fecha:</td>
                                <td class="estilo1"><input type="text" id="fechaFactura" name="fechaFactura" readonly="readonly"/></td>
                        </tr>
               </table>
              </form>                                   
           </div>
        </center>
    </body>
</html>
