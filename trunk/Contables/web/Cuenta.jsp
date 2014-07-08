<%-- 
    Document   : Cuenta
    Created on : Jul 8, 2014, 1:28:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.CuentaDAO"%> 
<%@ page import = "Clases.CuentaClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuenta</title>
    </head>  
        <style>
            body{
                background:#EEEEEE;
            }
            #miTabla tr:nth-child(odd) {
               background-color: #DDD;
               color:#777
            }
            #miTabla td {
            padding: 6px;
            }    
            tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
            }            
            td, th {
            display: table-cell;
            vertical-align: inherit;
            }
            #miTabla tr:nth-child(even) {
               background-color: #666;
               color:#FFF;
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
            }
            
        </style>    
    <body>
 <center>
        <table id="miTabla">
        <tr>
        <td class="estilo1">Numero Cuenta</td>
        <td class="estilo1">Tipo Cuenta</td>
        <td class="estilo1">Descripcion Cuenta</td>
        <td class="estilo1">Saldo Inicial Cuenta</td>
        <td class="estilo1">Saldo Final Cuenta</td>
        <td class="estilo1">Cuenta Padre</td>
        </tr>
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td><a href='NuevoCuenta.jsp'>Nuevo</a></td>
        <td><a href='ModificarCuenta.jsp'>Modificar</a></td>
        <td><a href='EliminarCuenta.jsp'>Eliminar</a></td>
        </tr>        
        <%
         LinkedList<CuentaClass> lista =new LinkedList<CuentaClass>();
         ArrayList a = new ArrayList();
        lista = CuentaDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr>");
           out.println("<td>"+lista.get(i).getNumeroCuenta()+"</a></td>");
           out.println("<td>"+lista.get(i).getTipo_idTipo()+"</td>");
           out.println("<td>"+lista.get(i).getDescripcionCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getSaldoInicialCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getSaldoFinalCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getCuenta_idCuenta()+"</td>");
           out.println("<td><a href='NuevoCuenta.jsp'>Nuevo</a></td>");
           out.println("<td><a href='ModificarCuenta.jsp'>Modificar</a></td>");
           out.println("<td><a href='EliminarCuenta.jsp'>Eliminar</a></td>");
           out.println("</tr>");
        }
        %>
        </table>
      </center>
    </body>
</html>
