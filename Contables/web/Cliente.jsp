<%-- 
    Document   : Cliente
    Created on : 11/07/2014, 09:19:31 PM
    Author     : Leitos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page import = "Clases.ClienteClass"%>
<%@page import = "DAO.ClienteDAO"%>
<%@page import = "java.util.LinkedList"%> 
<%@page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
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
                <td class="estilo1">Id Cliente</td>
                <td class="estilo1">Identificación</td>
                <td class="estilo1">Nombre</td>
                <td class="estilo1">Apellido</td>
                <td class="estilo1">Direccion</td>
                <td class="estilo1">Telefono</td>
                <td class="estilo1">Tipo</td>
            </tr>
            <tr>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
                
                <td></td>
                <td></td>
            </tr>        
            <%
            LinkedList<ClienteClass> lista =new LinkedList<ClienteClass>();
            
            lista = ClienteDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdCliente()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getCedula()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getNombre()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getApellido()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getDireccion()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getTelefono()+"</td>");
               out.println("<td id='g"+i+"'>"+lista.get(i).getTipo()+"</td>");
               out.println("<td></td>");
               out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
               //out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
               out.println("</tr>");
            }
            %>
            </table>
      </center>
            
      
      <div id="ingresar">
	<h2>Nuevo</h2>
	<form id="ingresarform" name="ingresarform" action="ClienteIngresarServlet" method="post" >
            
            
            <label for="Cedula">Identificación Cliente  </label>
		<input align='right' type="Cedula" id="cedula" name="cedula" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Nombre">Nombre Cliente  </label>
		<input align='right' type="Nombre" id="nombre" name="nombre" class="txtingresar" required="required">
		<br>
	    
            <label for="Apellido">Apellido Cliente  </label>
		<input align='right' type="Apellido" id="apellido" name="apellido" class="txtingresar" required="required">
		<br>
            
            <label for="Direccion">Dirección Cliente  </label>
		<input align='right' type="Direccion" id="stockProducto" name="direccion" class="txtingresar" required="required" >
		<br>
            
            <label for="Telefono">Telefono Cliente  </label>
		<input align='right' type="Telefono" id="telefono" name="telefono" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Tipo">Tipo Cliente</label>
                <select name="tipo" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    out.println("<option value='CEDULA' selected> CEDULA </option>");
                    out.println("<option value='RUC' selected> RUC </option>");
                    out.println("<option value='PASAPORTE' selected> PASAPORTE </option>"); 
                %>
                </select> 
		<br>
                            
            <input type="submit" value="Ingresar" id="send">
	</form>
</div>
            
    
    <div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="ClienteModificarServlet" method="post">
            
            <label for="IdCliente">Id Cliente  </label>
            <input align='right' type="IdCliente" id="idCliente" name="idCliente" class="txtingresar" required="required" readonly="readonly">
		<br>
            <label for="Cedula">Identificación Cliente  </label>
		<input align='right' type="Cedula" id="cedula" name="cedula" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Nombre">Nombre Cliente  </label>
		<input align='right' type="Nombre" id="nombre" name="nombre" class="txtingresar" required="required">
		<br>
	    
            <label for="Apellido">Apellido Cliente  </label>
		<input align='right' type="Apellido" id="apellido" name="apellido" class="txtingresar" required="required">
		<br>
            
            <label for="Direccion">Dirección Cliente  </label>
		<input align='right' type="Direccion" id="stockProducto" name="direccion" class="txtingresar" required="required" >
		<br>
            
            <label for="Telefono">Telefono Cliente  </label>
		<input align='right' type="Telefono" id="telefono" name="telefono" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Tipo">Tipo Cliente</label>
                <select name="tipo" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    out.println("<option value='CEDULA' selected> CEDULA </option>");
                    out.println("<option value='RUC' selected> RUC </option>");
                    out.println("<option value='PASAPORTE' selected> PASAPORTE </option>"); 
                %>
                </select> 
		<br>
            <input type="submit" value="Modificar" id="send">
	</form>      
      </div>
      <script type="text/javascript">

	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
        
        $(function(){
            $(".click").click(function(e) {
                e.preventDefault();
                var data = $(this).attr("data-valor");
                
                $idCliente=document.getElementById("a"+data.toString()).innerHTML;
                $cedula=document.getElementById("b"+data.toString()).innerHTML;
                $nombre=document.getElementById("c"+data.toString()).innerHTML;
                $apellido=document.getElementById("d"+data.toString()).innerHTML;
                $direccion=document.getElementById("e"+data.toString()).innerHTML;
                $telefono=document.getElementById("f"+data.toString()).innerHTML;
                $tipo=document.getElementById("g"+data.toString()).innerHTML;
                
                document.modificarform.idCliente.value=$idCliente;
                document.modificarform.cedula.value=$cedula;
                document.modificarform.nombre.value=$nombre;
                document.modificarform.apellido.value=$apellido;
                document.modificarform.direccion.value=$direccion;
                document.modificarform.telefono.value=$telefono;
                document.modificarform.tipo.value=$tipo;
                
            });
        });        
    </script>          
                
    </body>
</html>
