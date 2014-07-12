<%-- 
    Document   : FacturaVenta
    Created on : Jul 11, 2014, 8:54:09 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura Venta</title>
    </head>
    <body>
	<form id="ingresarform" name="ingresarform" action="CuentaIngresarServlet" method="post" >
		<label for="NumeroFactura">Numero Factura </label>
		<input align='right' type="NumeroFactura" id="NumeroCuenta" name="numeroFactura" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    <label for="DescripcionCuenta">Descripcion Cuenta</label>
		<input type="DescripcionCuenta" id="DescripcionCuenta" name="descripcionCuenta" class="txtingresar" required="required" onkeypress="return Letras(event)">
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
                <label for="categoriaCuenta">Categoria Cuenta</label>
                <select name="categoriaCuenta" class="combo">  
                <option value="0" selected>SELECCIONAR</option> 
                <option value="GRUPO" selected>GRUPO</option> 
                <option value="DETALLE" selected>DETALLE</option> 
                </select> 
		<br>	               
	    <label for="SaldoInicialCuenta">Saldo Inicial</label>
		<input type="SaldoInicialCuenta" id="SaldoInicialCuenta" name="saldoInicialCuenta" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
	    <label for="SaldoFinalCuenta">Saldo Final</label>
		<input type="SaldoFinalCuenta" id="SaldoFinalCuenta" name="saldoFinalCuenta" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
	    <label for="Cuenta_idCuenta">Cuenta padre</label>
		<input type="Cuenta_idCuenta" id="Cuenta_idCuenta" name="Cuenta_idCuenta" class="txtingresar" required="required"onkeypress="return Numeros(event)">
		<br>		
		<input type="submit" value="Ingresar" id="send">
	</form>        
    </body>
</html>
