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
          <meta name="author" content="Jake Rocheleau">
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
           out.println("<tr>");
           out.println("<td>"+lista.get(i).getIdCuenta()+"</a></td>");
           out.println("<td>"+lista.get(i).getNumeroCuenta()+"</a></td>");
           out.println("<td>"+lista.get(i).getTipo_idTipo()+"</td>");
           out.println("<td>"+lista.get(i).getDescripcionCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getSaldoInicialCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getSaldoFinalCuenta()+"</td>");
           out.println("<td>"+lista.get(i).getCuenta_idCuenta()+"</td>");
           out.println("<td></td>");
           out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
           out.println("<td><a><img SRC='Imagen/Eliminar.png'></a></td>");
           out.println("</tr>");
        }
        %>
        </table>
      </center>
   
<!-- hidden INGRESAR form -->
<div id="ingresar">
	<h2>Nuevo</h2>

	<form id="contact" name="contact" action="CuentaServlet" method="post">

		<label for="NumeroCuenta">Numero Cuenta  </label>
		<input type="NumeroCuenta" id="NumeroCuenta" name="numeroCuenta" class="txt" required="required" onkeyUp="return ValidarNumeros(this);" align="right">
		<br>	
	    <label for="DescripcionCuenta">Descripcion Cuenta</label>
		<input type="DescripcionCuenta" id="DescripcionCuenta" name="descripcionCuenta" class="txt" required="required" align="right">
		<br>
	    <label for="TipoCuenta">Tipo Cuenta</label>
                <select name="Tipo_idTipo" align="right">  
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
		<input type="SaldoInicialCuenta" id="SaldoInicialCuenta" name="saldoInicialCuenta" class="txt" required="required" onkeyUp="return ValidarNumeros(this);" align="right">
		<br>
	    <label for="SaldoFinalCuenta">Saldo Final</label>
		<input type="SaldoFinalCuenta" id="SaldoFinalCuenta" name="saldoFinalCuenta" class="txt" required="required" onkeyUp="return ValidarNumeros(this);" align="right">
		<br>
	    <label for="Cuenta_idCuenta">Cuenta padre</label>
		<input type="Cuenta_idCuenta" id="Cuenta_idCuenta" name="Cuenta_idCuenta" class="txt" required="required" onkeyUp="return ValidarNumeros(this);" align="right">
		<br>		
		<button id="send">Ingresar</button>
	</form>
</div>
<!-- hidden INGRESAR form -->
<div id="modificar">
	<h2>Modificar</h2>

	<form id="contact" name="contact" action="CuentaServlet" method="get">

		<label for="NumeroCuenta">Numero Cuenta</label>
		<input type="NumeroCuenta" id="NumeroCuenta" name="numeroCuenta" class="txt" required="required">
		<br>	
	    <label for="DescripcionCuenta">Descripcion Cuenta</label>
		<input type="DescripcionCuenta" id="DescripcionCuenta" name="descripcionCuenta" class="txt" required="required">
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
		<input type="SaldoInicialCuenta" id="SaldoInicialCuenta" name="saldoInicialCuenta" class="txt" required="required">
		<br>
	    <label for="SaldoFinalCuenta">Saldo Final</label>
		<input type="SaldoFinalCuenta" id="SaldoFinalCuenta" name="saldoInicialCuenta" class="txt" required="required">
		<br>
	    <label for="Cuenta_idCuenta">Cuenta padre</label>
		<input type="Cuenta_idCuenta" id="Cuenta_idCuenta" name="cuenta_idCuenta" class="txt" required="required">
		<br>		
		<input type="submit"   name="Ingresar" />
	</form>
</div>
<!-- basic fancybox setup -->
<script type="text/javascript">

	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
</script>        
        
        
    </body>
</html>
