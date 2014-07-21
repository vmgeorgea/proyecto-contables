<%-- 
    Document   : VentanaFormaspago
    Created on : Jul 8, 2014, 1:28:18 PM
    Author     : User
--%>

<%@page import="Clases.CuentaClass"%>
<%@page import="DAO.CuentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.FormaspagoDAO"%> 
<%@ page import = "Clases.FormaspagoClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
    <link href="CSS/base.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formaspago</title>
          <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
          <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
          <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
          <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
          <script type="text/javascript" src="JS/ValidarJS.js"></script>
    </head>
    <body>
 <center>
        <table id="miTabla">
        <tr>
        <td class="estilo1">Id Formas de Pago</td>
        <td class="estilo1">Descripcion Formas de Pago</td>
        <td class="estilo1">Id Cuenta</td>
        </tr>
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
        <td></td>
        <td></td>
        </tr>        
        <%
         LinkedList<FormaspagoClass> lista =new LinkedList<FormaspagoClass>();
        lista = FormaspagoDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getIdformaspago()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getDescripcionformaspago()+"</a></td>");
           out.println("<td id='c"+i+"'>"+lista.get(i).getIdcuenta()+"</a></td>");
           out.println("<td></td>");
           out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
           out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
           out.println("</tr>");
        }
        %>
        </table>
      </center>
   
<!-- hidden INGRESAR form -->
<div id="ingresar">
	<h2>Nuevo</h2>
	<form id="ingresarform" name="ingresarform" action="FormaspagoIngresarServlet" method="post" >
		<label for="descripcionFormaspago">Descripcion Formas de Pago  </label>
		<input align='right' type="text" id="descripcionFormaspago" name="descripcionFormaspago" class="txtingresar" required="required" onkeypress="return Letras(event)">
		<br>
                <label for="idcuentaFormaspago">Descripcion Formas de Pago  </label>
                            <select id="idcuentaFormaspago" name="idcuentaFormaspago" >                                  
                            <%
                            LinkedList<CuentaClass> lista3 =new LinkedList<CuentaClass>();
                            lista3 = CuentaDAO.consultar();
                            for (int i=0;i<lista3.size();i++)
                            {
                            out.println("<option value='"+lista3.get(i).getIdCuenta()+"' selected>"+lista3.get(i).getDescripcionCuenta()+"</option>");
                            }  
                            %>
                            </select> 
                <br>
		<input type="submit" value="Ingresar" id="send">
	</form>
</div>
                
<!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="FormaspagoEliminarServlet" method="post">
		<label for="idFormaspago">Desea eliminar la forma de pago de cuenta con la siguienta id:</label>
		<input type="text" id="idFormaspago" name="idFormaspago" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
	</form>
</div>                  
                
<!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="FormaspagoModificarServlet" method="post">
		<label for="idFormaspago">Id Formas de Pago</label>
		<input type="text" id="idFormaspago" name="idFormaspago" class="txtmodificar" required="required" readonly="readonly" >
		<br>
		<label for="descripcionFormaspago">Descripcion Formas de Pago</label>
		<input type="text" id="descripcionFormaspago" name="descripcionFormaspago" class="txtmodificar" required="required" onkeypress="return Letras(event)">
		<br>               
                <input type="submit" value="Modificar" id="send">
	</form>
</div>
              
<!-- basic fancybox setup -->
<script type="text/javascript">

	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
        
        $(function(){
            $(".click").click(function(e) {
                e.preventDefault();
                var data = $(this).attr("data-valor");
                $idFormaspago=document.getElementById("a"+data.toString()).innerHTML;
                $nombreFormaspago=document.getElementById("b"+data.toString()).innerHTML;
                document.modificarform.idFormaspago.value=$idFormaspago;  
                document.eliminarform.idFormaspago.value=$idFormaspago; 
                document.modificarform.descripcionFormaspago.value=$nombreFormaspago;         
            });
        });        
                        
</script>  
    </body>
</html>
