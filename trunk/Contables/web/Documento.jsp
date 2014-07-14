<%-- 
    Document   : VentanaTipo
    Created on : Jul 8, 2014, 1:28:18 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.DocumentoDAO"%> 
<%@ page import = "Clases.DocumentoClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
    <link href="CSS/base.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documento</title>
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
        <td class="estilo1">Id Documento</td>
        <td class="estilo1">Descripicion Documento</td>

        </tr>
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
        <td></td>
        <td></td>
        </tr>        
        <%
         LinkedList<DocumentoClass> lista =new LinkedList<DocumentoClass>();
        lista = DocumentoDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getIddocumento()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getDescripciondocumento()+"</a></td>");
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
	<form id="ingresarform" name="ingresarform" action="DocumentoIngresarServlet" method="post" >
		<label for="descripicionDocumento">Descripicion Documento  </label>
		<input align='right' type="descripicionDocumento" id="descripicionDocumento" name="descripicionDocumento" class="txtingresar" required="required" onkeypress="return Letras(event)">
		<br>		
		<input type="submit" value="Ingresar" id="send">
	</form>
</div>
                
<!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="DocumentoEliminarServlet" method="post">
		<label for="idDocumento">Desea eliminar el documento de cuenta con la siguienta id:</label>
		<input type="idDocumento" id="idDocumento" name="idDocumento" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
	</form>
</div>                  
                
<!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="DocumentovModificarServlet" method="post">
		<label for="idDocumento">Id Documento</label>
		<input type="idDocumento" id="idDocumento" name="idDocumento" class="txtmodificar" required="required" readonly="readonly" >
		<br>
		<label for="descripicionDocumento">Nombre Documento</label>
		<input type="descripicionDocumento" id="descripicionDocumento" name="descripicionDocumento" class="txtmodificar" required="required" onkeypress="return Letras(event)>
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
                $idDocumento=document.getElementById("a"+data.toString()).innerHTML;
                $nombreDocumento=document.getElementById("b"+data.toString()).innerHTML;
                document.modificarform.idDocumento.value=$idDocumento;  
                document.eliminarform.idDocumento.value=$idDocumento; 
                document.modificarform.nombreDocumento.value=$nombreDocumento;        
            });
        });        
                        
</script>  
    </body>
</html>
