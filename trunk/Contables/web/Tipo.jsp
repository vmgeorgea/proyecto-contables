<%-- 
    Document   : VentanaTipo
    Created on : Jul 8, 2014, 1:28:18 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.TipoDAO"%> 
<%@ page import = "Clases.TipoClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
    <link href="CSS/base.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo</title>
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
        <td class="estilo1">Id Cuenta</td>
        <td class="estilo1">Nombre Tipo</td>

        </tr>
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
        <td></td>
        <td></td>
        </tr>        
        <%
         LinkedList<TipoClass> lista =new LinkedList<TipoClass>();
        lista = TipoDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getIdTipo()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getNombreTipo()+"</a></td>");
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
	<form id="ingresarform" name="ingresarform" action="TipoIngresarServlet" method="post" >
		<label for="nombreTipo">Nombre Tipo  </label>
		<input align='right' type="nombreTipo" id="nombreTipo" name="nombreTipo" class="txtingresar" required="required" onkeypress="return Letras(event)">
		<br>		
		<input type="submit" value="Ingresar" id="send">
	</form>
</div>
                
<!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="TipoEliminarServlet" method="post">
		<label for="idTipo">Desea eliminar el tipo de cuenta con la siguienta id:</label>
		<input type="idTipo" id="idTipo" name="idTipo" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
	</form>
</div>                  
                
<!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="TipoModificarServlet" method="post">
		<label for="idTipo">Id Tipo</label>
		<input type="idTipo" id="idTipo" name="idTipo" class="txtmodificar" required="required" readonly="readonly" >
		<br>
		<label for="nombreTipo">Nombre Tipo</label>
		<input type="nombreTipo" id="nombreTipo" name="nombreTipo" class="txtmodificar" required="required" onkeypress="return Letras(event)>
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
                $idTipo=document.getElementById("a"+data.toString()).innerHTML;
                $nombreTipo=document.getElementById("b"+data.toString()).innerHTML;
                document.modificarform.idTipo.value=$idTipo;  
                document.eliminarform.idTipo.value=$idTipo; 
                document.modificarform.nombreTipo.value=$nombreTipo;        
            });
        });        
                        
</script>  
    </body>
</html>
