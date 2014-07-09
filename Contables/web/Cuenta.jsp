<%-- 
    Document   : Cuenta
    Created on : Jul 8, 2014, 1:28:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.CuentaDAO"%> 
<%@ page import = "Clases.CuentaClass"%> 
<%@ page import = "DAO.TipoDAO"%> 
<%@ page import = "Clases.TipoClass"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuenta</title>
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
        <td class="estilo1"></td>
        <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
        <td></td>
        <td></td>
        </tr>        
        <%
         LinkedList<CuentaClass> lista =new LinkedList<CuentaClass>();
        lista = CuentaDAO.consultar();
        for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getIdCuenta()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getNumeroCuenta()+"</a></td>");
           out.println("<td id='c"+i+"'>"+lista.get(i).getTipo_idTipo()+"</td>");
           out.println("<td id='d"+i+"'>"+lista.get(i).getDescripcionCuenta()+"</td>");
           out.println("<td id='e"+i+"'>"+lista.get(i).getSaldoInicialCuenta()+"</td>");
           out.println("<td id='f"+i+"'>"+lista.get(i).getSaldoFinalCuenta()+"</td>");
           out.println("<td id='g"+i+"'>"+lista.get(i).getCuenta_idCuenta()+"</td>");
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
	<form id="ingresarform" name="ingresarform" action="CuentaIngresarServlet" method="post" >
		<label for="NumeroCuenta">Numero Cuenta  </label>
		<input align='right' type="NumeroCuenta" id="NumeroCuenta" name="numeroCuenta" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    <label for="DescripcionCuenta">Descripcion Cuenta</label>
		<input type="DescripcionCuenta" id="DescripcionCuenta" name="descripcionCuenta" class="txtingresar" required="required">
                <br>
	    <label for="TipoCuenta">Tipo Cuenta</label>
                <select name="Tipo_idTipo" class="combo">  
                <option value="0" selected>SELECCIONAR</option>  
                <%
                    LinkedList<TipoClass> lista1 =new LinkedList<TipoClass>();
                    lista1 = TipoDAO.consultar();
                    for (int i=0;i<lista1.size();i++)
                    {
                    out.println("<option value='"+lista1.get(i).getIdTipo()+"' selected>"+lista1.get(i).getIdTipo()+"-"+lista1.get(i).getNombreTipo()+"</option>");
                    }
                %>
                </select> 
		<br>	               
	    <label for="SaldoInicialCuenta">Saldo Inicial</label>
		<input type="SaldoInicialCuenta" id="SaldoInicialCuenta" name="saldoInicialCuenta" class="txtingresar" required="required">
		<br>
	    <label for="SaldoFinalCuenta">Saldo Final</label>
		<input type="SaldoFinalCuenta" id="SaldoFinalCuenta" name="saldoFinalCuenta" class="txtingresar" required="required">
		<br>
	    <label for="Cuenta_idCuenta">Cuenta padre</label>
		<input type="Cuenta_idCuenta" id="Cuenta_idCuenta" name="Cuenta_idCuenta" class="txtingresar" required="required">
		<br>		
		<input type="submit" value="Ingresar" id="send">
	</form>
</div>
                
<!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="CuentaEliminarServlet" method="post">
		<label for="idCuenta">Desea eliminar la cuenta con la siguienta id:</label>
		<input type="idCuenta" id="idCuenta" name="idCuenta" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
	</form>
</div>                  
                
<!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="CuentaModificarServlet" method="post">
		<label for="idCuenta">Id Cuenta</label>
		<input type="idCuenta" id="idCuenta" name="idCuenta" class="txtmodificar" required="required" readonly="readonly" >
		<br>
		<label for="NumeroCuenta">Numero Cuenta</label>
		<input type="NumeroCuenta" id="NumeroCuenta1" name="numeroCuenta" class="txtmodificar" required="required">
		<br>	
                <label for="DescripcionCuenta">Descripcion Cuenta</label>
		<input type="DescripcionCuenta" id="DescripcionCuenta" name="descripcionCuenta" class="txtmodificar" required="required">
		<br>
                <label for="TipoCuenta">Tipo Cuenta</label>
                <select name="Tipo_idTipo" class="combo">  
                <option value="0" selected>SELECCIONAR</option>  
                <%
                    LinkedList<TipoClass> lista2 =new LinkedList<TipoClass>();
                    lista2 = TipoDAO.consultar();
                    for (int i=0;i<lista2.size();i++)
                    {
                    out.println("<option value='"+lista2.get(i).getIdTipo()+"' selected>"+lista2.get(i).getIdTipo()+"-"+lista2.get(i).getNombreTipo()+"</option>");
                    }
                %>
                </select>  
		<br>		
	    <label for="SaldoInicialCuenta">Saldo Inicial</label>
		<input type="SaldoInicialCuenta" id="SaldoInicialCuenta" name="saldoInicialCuenta" class="txtmodificar" required="required" >
		<br>
	    <label for="SaldoFinalCuenta">Saldo Final</label>
		<input type="SaldoFinalCuenta" id="SaldoFinalCuenta" name="saldoFinalCuenta" class="txtmodificar" required="required">
		<br>
	    <label for="Cuenta_idCuenta">Cuenta padre</label>
		<input type="Cuenta_idCuenta" id="Cuenta_idCuenta" name="Cuenta_idCuenta" class="txtmodificar" required="required">
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
                $idCuenta=document.getElementById("a"+data.toString()).innerHTML;
                $numeroCuenta=document.getElementById("b"+data.toString()).innerHTML;
                $descripcionCuenta=document.getElementById("c"+data.toString()).innerHTML;
                $Tipo_idTipo=document.getElementById("d"+data.toString()).innerHTML;
                $saldoInicialCuenta=document.getElementById("e"+data.toString()).innerHTML;
                $saldoFinalCuenta=document.getElementById("f"+data.toString()).innerHTML;
                $Cuenta_idCuenta=document.getElementById("g"+data.toString()).innerHTML;
                document.modificarform.idCuenta.value=$idCuenta;  
                document.eliminarform.idCuenta.value=$idCuenta; 
                document.modificarform.numeroCuenta.value=$numeroCuenta;        
                document.modificarform.descripcionCuenta.value=$descripcionCuenta;
                document.modificarform.Tipo_idTipo.value=$Tipo_idTipo;
                document.modificarform.saldoInicialCuenta.value=$saldoInicialCuenta;
                document.modificarform.saldoFinalCuenta.value=$saldoFinalCuenta;
                document.modificarform.Cuenta_idCuenta.value=$Cuenta_idCuenta;
            });
        });        
                        
</script>          
    </body>
</html>
