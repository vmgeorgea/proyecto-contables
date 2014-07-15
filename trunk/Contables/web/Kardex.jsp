<%-- 
    Document   : Kardex
    Created on : Jul 15, 2014, 9:22:00 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
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
        <table id="miTabla">
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>        
        <td class="estilo1">Entradas</td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1">Salidas</td>
        <td class="estilo1"></td>
        <td class="estilo1">Saldo</td>
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
        <td class="estilo1">Cantidad</td>
        <td class="estilo1">Valor Unitario</td>
        <td class="estilo1">Valor Total</td>        
        </tr>
        <tr>
        </tr>        
        <%
         LinkedList<KardexClass> lista =new LinkedList<KardexClass>();
        lista = KardexDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getFecha()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getIdfactura()+" "+lista.get(i).getDetalle()+"</a></td>");
           float precioventa=0;
           float totalventa=0;
           float cantidadventa=0;
           float preciocompra=0;
           float totalcompra=0;
           float cantidadcompra=0;   
           int bandera=0;
                if(lista.get(i).getDetalle().toString().equals("compra"))
                {   
                    bandera=1;
                    if(i==0){                    
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*Float.parseFloat(lista.get(i).getPrecio())+"</a></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getPrecio())/Float.parseFloat(lista.get(i).getCantidad())+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    totalventa=Float.parseFloat(lista.get(i).getPrecio())*Float.parseFloat(lista.get(i).getCantidad());
                    cantidadventa=Float.parseFloat(lista.get(i).getCantidad());
                    precioventa=Float.parseFloat(lista.get(i).getPrecio());
                    }
                    if (i>0 && bandera==1){
                    totalventa=totalventa + (Float.parseFloat(lista.get(i).getPrecio())*preciocompra);
                    cantidadventa=cantidadventa+Float.parseFloat(lista.get(i).getCantidad());
                    precioventa=Float.parseFloat(lista.get(i).getPrecio());
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*preciocompra+"</a></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+cantidadventa+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+totalventa+"</a></td>");                    
                    }  
                    if (i>0 &&bandera==2){
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*preciocompra+"</a></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getPrecio())/Float.parseFloat(lista.get(i).getCantidad())+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");                    
                    }                      
                }
                if(lista.get(i).getDetalle().toString().equals("venta"))
                {    
                    bandera=2;
                    if(i==0){                    
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*precioventa+"</a></td>");                                    
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getPrecio())/Float.parseFloat(lista.get(i).getCantidad())+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    }
                    if (i>0 && bandera==1){
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*preciocompra+"</a></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getPrecio())/Float.parseFloat(lista.get(i).getCantidad())+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");                    
                    }  
                    if (i>0 && bandera==2){
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getCantidad())*preciocompra+"</a></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td></td>");
                    out.println("<td id='b"+i+"'>"+lista.get(i).getCantidad()+"</a></td>");
                    out.println("<td id='b"+i+"'>"+Float.parseFloat(lista.get(i).getPrecio())/Float.parseFloat(lista.get(i).getCantidad())+"</a></td>");;
                    out.println("<td id='b"+i+"'>"+lista.get(i).getPrecio()+"</a></td>");                    
                    }  
                }                
           
           out.println("</tr>");
        }
        %>
        </table>
      </center>
    </body>
</html>
