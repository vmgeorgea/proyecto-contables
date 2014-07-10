<%-- 
    Document   : Asiento
    Created on : 09/07/2014, 01:36:49 PM
    Author     : Leitos
--%>

<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asiento</title>
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
                <td class="estilo1">Id Asiento</td>
                <td class="estilo1">Número Diario</td>
                <td class="estilo1">Periodo Asiento</td>
                <td class="estilo1">Fecha Asiento</td>
                <td class="estilo1">Número de Asiento</td>
                <td class="estilo1">Concepto Asiento</td>
                <td class="estilo1">Debe Asiento</td>
                <td class="estilo1">Haber Asiento</td>
            </tr>
            <tr>
                <td class="estilo1"></td>
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
            LinkedList<AsientoClass> lista =new LinkedList<AsientoClass>();
            lista = AsientoDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdAsiento()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getNumeroDiario()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getPeriodoAsiento()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getFechaAsiento()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getNumeroAsiento()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getConceptoAsiento()+"</td>");
               out.println("<td id='g"+i+"'>"+lista.get(i).getDebeAsiento()+"</td>");
               out.println("<td id='h"+i+"'>"+lista.get(i).getHaberAsiento()+"</td>");
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
	<form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet" method="post" >
            
            <label for="NumeroCuenta">Numero Diario  </label>
		<input align='right' type="NumeroCuenta" id="numeroCuenta" name="numeroDiario" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    
	    <label for="PeriodoAsiento">Periodo Asiento</label>
                <select name="periodoAsiento" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    
                    for (int i=0;i<20;i++)
                    {
                        int p=2014-i;
                        out.println("<option value='"+p+"' selected>"+p+"</option>");
                        
                    }
                %>
                </select> 
		<br>
                
	    <label for="FechaAsiento">Fecha Asiento</label>
		<input type="FechaAsiento" id="SaldoInicialCuenta" name="fechaAsiento" class="txtingresar" required="required">
		<br>
                
	    <label for="NumeroAsiento">Numero Asiento</label>
		<input type="NumeroAsiento" id="SaldoFinalCuenta" name="numeroAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
	    <label for="ConceptoAsiento">Concepto Asiento</label>
		<input type="ConceptoAsiento" id="Cuenta_idCuenta" name="conceptoAsiento" class="txtingresar" required="required">
		<br>	
                
            <label for="DebeAsiento">Debe Asiento</label>
		<input type="DebeAsiento" id="Cuenta_idCuenta" name="debeAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <label for="HaberAsiento">Haber Asiento</label>
		<input type="HaberAsiento" id="Cuenta_idCuenta" name="haberAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
		<input type="submit" value="Ingresar" id="send">
	</form>
</div>  
                
    <!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="AsientoEliminarServlet" method="post">
		<label for="idAsiento">Desea eliminar el asiento con la siguienta id:</label>
		<input type="idAsiento" id="idAsiento" name="idAsiento" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
	</form>
</div>               
      
    
    <!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="AsientoModificarServlet" method="post">
            <label for="idAsiento">Numero Diario  </label>
		<input align='right' type="idAsiento" id="idAsiento" name="idAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>		
            <label for="numeroDiario">Numero Diario  </label>
		<input align='right' type="numeroDiario" id="numeroDiario" name="numeroDiario" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    
	    <label for="periodoAsiento">Periodo Asiento</label>
                <select name="periodoAsiento" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    
                    for (int i=0;i<20;i++)
                    {
                        int p=2014-i;
                        out.println("<option value='"+p+"' selected>"+p+"</option>");
                        
                    }
                %>
                </select> 
		<br>
                
	    <label for="fechaAsiento">Fecha Asiento</label>
		<input type="fechaAsiento" id="fechaAsiento" name="fechaAsiento" class="txtingresar" required="required">
		<br>
                
	    <label for="numeroAsiento">Numero Asiento</label>
		<input type="numeroAsiento" id="numeroAsiento" name="numeroAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
	    <label for="conceptoAsiento">Concepto Asiento</label>
		<input type="conceptoAsiento" id="conceptoAsiento" name="conceptoAsiento" class="txtingresar" required="required">
		<br>	
                
            <label for="debeAsiento">Debe Asiento</label>
		<input type="debeAsiento" id="debeAsiento" name="debeAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <label for="haberAsiento">Haber Asiento</label>
		<input type="haberAsiento" id="haberAsiento" name="haberAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
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
                
                $idAsiento=document.getElementById("a"+data.toString()).innerHTML;
                $numeroDiario=document.getElementById("b"+data.toString()).innerHTML;
                $periodoAsiento=document.getElementById("c"+data.toString()).innerHTML;
                $fechaAsiento=document.getElementById("d"+data.toString()).innerHTML;
                $numeroAsiento=document.getElementById("e"+data.toString()).innerHTML;
                $conceptoAsiento=document.getElementById("f"+data.toString()).innerHTML;
                $debeAsiento=document.getElementById("g"+data.toString()).innerHTML;
                $haberAsiento=document.getElementById("h"+data.toString()).innerHTML;
                document.modificarform.idAsiento.value=$idAsiento;
                document.eliminarform.idAsiento.value=$idAsiento;
                document.modificarform.numeroDiario.value=$numeroDiario;
                document.modificarform.periodoAsiento.value=$periodoAsiento;
                document.modificarform.fechaAsiento.value=$fechaAsiento;
                document.modificarform.numeroAsiento.value=$numeroAsiento;
                document.modificarform.conceptoAsiento.value=$conceptoAsiento;
                document.modificarform.debeAsiento.value=$debeAsiento;
                document.modificarform.haberAsiento.value=$haberAsiento;
                
            });
        });        
    </script>
    </body>
</html>
