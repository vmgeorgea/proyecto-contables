<%-- 
    Document   : Kardex
    Created on : Jul 15, 2014, 9:22:00 AM
    Author     : User
--%>

<%@page import = "DAO.ProductoDAO"%>
<%@page import = "Clases.ProductoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.KardexDAO"%> 
<%@ page import = "Clases.KardexClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
          <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
          <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
          <script type="text/javascript" src="JS/ValidarJS.js"></script>  
          <style>
            body{
                background:#EEEEEE;
            }
            #miTabla tr:nth-child(odd) {
               background-color: #DDD;
               color:#777;
               font-size: 9px; 
            }
            #miTabla td {
            padding: 6px;
            font-size: 9px; 
            }    
            tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
            font-size: 9px; 
            }            
            td, th {
            display: table-cell;
            vertical-align: inherit;
            font-size: 9px; 
            }
            #miTabla tr:nth-child(even) {
               background-color: #666;
               color:#FFF;
               font-size: 9px; 
            }        
            #miTabla {
            border-collapse: collapse;
            width: 100%;
            }
            table {
            display: table;
            border-collapse: separate;
            border-spacing: 2px;
            border-color: gray;
            }
            .estilo1 { 
                font-weight: bold; 
                font-size: 9px; 
            }
            
        </style>     
          
    </head>
    <body>
<center>
    <form action="KardexServlet" method="post">
       <table id="miTabla">
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>        
        <td class="estilo1"></td>
        
        <td class="estilo1">
           <select id="productoKardex" name="productoKardex">                    
                        <%
                        LinkedList<ProductoClass> lista2 =new LinkedList<ProductoClass>();
                        lista2 = ProductoDAO.consultar();
                        out.println("<option selected></option>");
                        for (int i=0;i<lista2.size();i++)
                        {
                        out.println("<option value='"+lista2.get(i).getIdProducto()+"'>"+lista2.get(i).getNombreProducto()+"</option>");
                        }  
                        %>
           </select>
        </td>
        <td class="estilo1"><input type="submit" value="Consultar"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>             
        </tr>   

        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>        
        <td class="estilo1">Entradas/Salida</td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1">Saldo</td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>             
        </tr>            
        <tr>
        <td class="estilo1">Fecha</td>
        <td class="estilo1">Detalle</td>
        <td class="estilo1">Cantidad</td>
        <td class="estilo1">Valor Unitario</td>
        <td class="estilo1">Valor Total</td>
        <td class="estilo1">Cantidad</td>
        <td class="estilo1">Valor Unitario</td>
        <td class="estilo1">Valor Total</td>
        <td class="estilo1"></td>
        </tr>
        <tr>
        </tr>        
        <%
         LinkedList<KardexClass> lista =new LinkedList<KardexClass>();
         HttpSession session1 = request.getSession();
         if(session1.getAttribute("productoskardex")!=null){
         lista = (LinkedList) session1.getAttribute("productoskardex");                
                    float precioventa = 0;
                    float totalventa = 0;
                    float cantidadventa = 0;     
                    int bandera = 0;
            for (int i = 0; i < lista.size(); i++) {
                    out.println("<tr data-valor='" + i + "' class='click'>");
                    out.println("<td id='a" + i + "'>" + lista.get(i).getFecha() + "</td>");
                    out.println("<td id='b" + i + "'>Factura " + lista.get(i).getIdfactura() + " " + lista.get(i).getDetalle() + "</td>");                    
                    
                    if (lista.get(i).getDetalle().toString().equals("compra")) {
                            if(bandera==1){
                                
                            out.println("<td id='b" + i + "'>" + lista.get(i).getCantidad() + "</td>");
                            out.println("<td id='b" + i + "'>" + precioventa + "</td>");
                            out.println("<td id='b" + i + "'>" + (Float.parseFloat(lista.get(i).getCantidad()) * precioventa) + "</td>");                        

                            cantidadventa=cantidadventa+Float.valueOf(lista.get(i).getCantidad());
                            totalventa=totalventa+(Float.valueOf(lista.get(i).getCantidad())*Float.valueOf(lista.get(i).getPrecio()));
                            precioventa=totalventa/cantidadventa;

                            out.println("<td id='b" + i + "'>" + cantidadventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + precioventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + totalventa + "</td>");
                            out.println("<td id='b" + i + "'>Compra</td>");
                            }  
                            
                            if(bandera==0){
                            out.println("<td id='b" + i + "'>" + lista.get(i).getCantidad() + "</td>");
                            out.println("<td id='b" + i + "'>" + lista.get(i).getPrecio() + "</td>");
                            out.println("<td id='b" + i + "'>" + Float.parseFloat(lista.get(i).getCantidad()) * Float.parseFloat(lista.get(i).getPrecio()) + "</td>");                        

                            cantidadventa=cantidadventa+Float.valueOf(lista.get(i).getCantidad());
                            totalventa=totalventa+(Float.valueOf(lista.get(i).getCantidad())*Float.valueOf(lista.get(i).getPrecio()));
                            precioventa=totalventa/cantidadventa;

                            out.println("<td id='b" + i + "'>" + cantidadventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + precioventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + totalventa + "</td>");
                            out.println("<td id='b" + i + "'>Compra</td>");
                            bandera=1;
                            }                          

                    }
                    if (lista.get(i).getDetalle().toString().equals("venta")) {
                                                
                            if(bandera==1){
                                
                            out.println("<td id='b" + i + "'>" + lista.get(i).getCantidad() + "</td>");
                            out.println("<td id='b" + i + "'>" + precioventa + "</td>");
                            out.println("<td id='b" + i + "'>" + (Float.parseFloat(lista.get(i).getCantidad()) * precioventa) + "</td>");                        

                            cantidadventa=cantidadventa-Float.valueOf(lista.get(i).getCantidad());
                            totalventa=totalventa-(Float.valueOf(lista.get(i).getCantidad())*Float.valueOf(lista.get(i).getPrecio()));
                            precioventa=totalventa/cantidadventa;

                            out.println("<td id='b" + i + "'>" + cantidadventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + precioventa + "</td>");                        
                            out.println("<td id='b" + i + "'>" + totalventa + "</td>");
                            out.println("<td id='b" + i + "'>Venta</td>");
                            } 
                    }
                    out.println("</tr>");
                }
        }else{
               
        }
        %>
        </table>
       </form>
      </center>
    </body>
</html>
