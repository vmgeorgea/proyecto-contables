<%-- 
    Document   : LibroMayor
    Created on : 12/07/2014, 11:36:54 AM
    Author     : Leitos
--%>

<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@page import="DAO.CuentaDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Clases.CuentaClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libro Diario</title>
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
   
                <td class="estilo1">Fecha</td>
                <td class="estilo1">Detalle</td>
                <td class="estilo1">Debe</td>
                <td class="estilo1">Haber</td>
                
            </tr>
            <tr>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                <td class="estilo1"></td>
                
                <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Nuevo.png"></a></td>
                <td></td>
                
            </tr>     
 
            
            
            </table>
      </center>
        
          <!-- hidden INGRESAR form -->
<div id="ingresar">
	<h2>Nuevo</h2>
        <form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet" method="post" >
            
            <center>
            <table>
            <tr>
                <td><label for="NumeroCuenta">Numero Diario  </label></td>
                <td><label for="periodoAsiento">Periodo Asiento</label></td>
                <td><label for="FechaAsiento">Fecha Asiento</label></td>
                     
            </tr>
            <tr>
                <td><input type="NumeroCuenta" id="numeroCuenta" name="numeroDiario" class="txtingresar1" required="required" onkeypress="return Numeros(event)"></td>
                <td>
                    
                    <select name="periodoAsiento" class="combo1">  
                    <option  selected>SELECCIONAR</option>  
                        <%
                            for (int i=0;i<20;i++)
                                {
                                int p=2014-i;
                                out.println("<option value='"+p+"' selected>"+p+"</option>");
                                }
                        %>
                    </select>    
                </td>
                <td><label for="FechaAsiento">Fecha Asiento</label></td>
                
            </tr>     
 
            
            
            </table>
      </center>
            
            
            
            
            
            
            
            
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
    
    <script type="text/javascript">

	$(document).ready(function() {
		$(".modalbox").fancybox();
	});            
    </script>
    </body>
</html>
