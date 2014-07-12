<%-- 
    Document   : Transaccion
    Created on : 09/07/2014, 08:26:30 PM
    Author     : Leitos
--%>

<%@page import="DAO.CuentaDAO"%>
<%@page import="Clases.CuentaClass"%>
<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@page import="DAO.TransaccionDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Clases.TransaccionClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaccion</title>
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
   
                <td class="estilo1">Id Transaccion</td>
                <td class="estilo1">Id Asiento</td>
                <td class="estilo1">Id Cuenta</td>
                <td class="estilo1">Debe Transaccion</td>
                <td class="estilo1">Haber Transaccion</td>
                <td class="estilo1">Referencia Transaccion</td>
                <td class="estilo1">Documento Transaccion</td>
                
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
            LinkedList <TransaccionClass> lista=new LinkedList<TransaccionClass>();
            lista = TransaccionDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdTransaccion()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getAsiento_idAsiento()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getCuenta_idCuenta()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getDebeTransaccion()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getHaberTransaccion()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getReferenciaTransaccion()+"</td>");
               out.println("<td id='g"+i+"'>"+lista.get(i).getDocumentoTransaccion()+"</td>");
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
	<form id="ingresarform" name="ingresarform" action="TransaccionIngresarServlet" method="post" >
            
            <label for="Asiento_idAsiento">Id Asiento</label>
                <select name="Asiento_idAsiento" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    LinkedList <AsientoClass> lista1=new LinkedList<AsientoClass>();
                    lista1 = AsientoDAO.consultar();
                    
                    for (int i=0;i<lista1.size();i++)
                    {
                        AsientoClass aux=lista1.get(i);
                        
                        out.println("<option value='"+aux.getIdAsiento()+"' selected>"+aux.getIdAsiento()+"</option>");            
                    }
                %>
                </select> 
		<br>
            
                <label for="Cuanta_idCuenta">Id Cuenta</label>
                <select name="Cuenta_idCuenta" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    LinkedList <CuentaClass> lista2=new LinkedList<CuentaClass>();
                    lista2 = CuentaDAO.consultar();
                    
                    for (int i=0;i<lista2.size();i++)
                    {
                        CuentaClass aux=lista2.get(i);
                        
                        out.println("<option value='"+aux.getIdCuenta()+"' selected>"+aux.getDescripcionCuenta()+"</option>");            
                    }
                %>
                </select> 
		<br>
            
            <label for="DebeTransaccion">Debe Transaccion</label>
		<input align='right' type="debeTransaccion" id="debeTransaccion" name="debeTransaccion" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    
	    <label for="HaberTransaccion">Haber Transaccion</label>
		<input align='right' type="haberTransaccion" id="haberTransaccion" name="haberTransaccion" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <label for="ReferenciaTransaccion">Referencia Transaccion</label>
		<input align='right' type="referenciaTransaccion" id="referenciaTransaccion" name="referenciaTransaccion" class="txtingresar" required="required">
		<br>
            
            <label for="DocumentoTransaccion">Documento Transaccion</label>
		<input align='right' type="documentoTransaccion" id="documentoTransaccion" name="documentoTransaccion" class="txtingresar" required="required">
		<br>    
		<input type="submit" value="Ingresar" id="send">
	</form>
                
                
        <!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="TransaccionModificarServlet" method="post">
            <label for="idTransaccion">Id Transaccion</label>
		<input align='right' type="idTransaccion" id="idTransaccion" name="idTransaccion" class="txtingresar" required="required" readonly="readonly" onkeypress="return Numeros(event)">
		<br>		
            <label for="Asiento_idAsiento">Id Asiento</label>
                <select name="Asiento_idAsiento" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    LinkedList <AsientoClass> lista3=new LinkedList<AsientoClass>();
                    lista3 = AsientoDAO.consultar();
                    
                    for (int i=0;i<lista3.size();i++)
                    {
                        AsientoClass aux=lista3.get(i);
                        
                        out.println("<option value='"+aux.getIdAsiento()+"' selected>"+aux.getIdAsiento()+"</option>");            
                    }
                %>
                </select> 
		<br>
            
                <label for="Cuenta_idCuenta">Id Cuenta</label>
                <select name="Cuenta_idCuenta" class="combo">  
                <option  selected>SELECCIONAR</option>  
                <%
                    LinkedList <CuentaClass> lista4=new LinkedList<CuentaClass>();
                    lista4 = CuentaDAO.consultar();
                    
                    for (int i=0;i<lista4.size();i++)
                    {
                        CuentaClass aux=lista4.get(i);
                        
                        out.println("<option value='"+aux.getIdCuenta()+"' selected>"+aux.getDescripcionCuenta()+"</option>");            
                    }
                %>
                </select> 
		<br>
            
            <label for="debeTransaccion">Debe Transaccion</label>
		<input align='right' type="debeTransaccion" id="debeTransaccion" name="debeTransaccion" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    
	    <label for="haberTransaccion">Haber Transaccion</label>
		<input align='right' type="haberTransaccion" id="haberTransaccion" name="haberTransaccion" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <label for="referenciaTransaccion">Referencia Transaccion</label>
		<input align='right' type="referenciaTransaccion" id="referenciaTransaccion" name="referenciaTransaccion" class="txtingresar" required="required">
		<br>
            
            <label for="documentoTransaccion">Documento Transaccion</label>
		<input align='right' type="documentoTransaccion" id="documentoTransaccion" name="documentoTransaccion" class="txtingresar" required="required">
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
                
                $idTransaccion=document.getElementById("a"+data.toString()).innerHTML;
                $Asiento_idAsiento=document.getElementById("b"+data.toString()).innerHTML;
                $Cuenta_idCuenta=document.getElementById("c"+data.toString()).innerHTML;
                $debeTransaccion=document.getElementById("d"+data.toString()).innerHTML;
                $haberTransaccion=document.getElementById("e"+data.toString()).innerHTML;
                $referenciaTransaccion=document.getElementById("f"+data.toString()).innerHTML;
                $documentoTransaccion=document.getElementById("g"+data.toString()).innerHTML;
                document.modificarform.idTransaccion.value=$idTransaccion;
                document.eliminarform.idTransaccion.value=$idTransaccion;
                document.modificarform.Asiento_idAsiento.value=$Asiento_idAsiento;
                document.modificarform.Cuenta_idCuenta.value=$Cuenta_idCuenta;
                document.modificarform.debeTransaccion.value=$debeTransaccion;
                document.modificarform.haberTransaccion.value=$haberTransaccion;
                document.modificarform.referenciaTransaccion.value=$referenciaTransaccion;
                document.modificarform.documentoTransaccion.value=$documentoTransaccion;
                
            });
        });      
        
    </script>    
    </body>
</html>
