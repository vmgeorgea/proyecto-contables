<%-- 
    Document   : LibroMayor
    Created on : 12/07/2014, 11:36:54 AM
    Author     : Leitos
--%>

<%@page import="DAO.TransaccionDAO"%>
<%@page import="Clases.TransaccionClass"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Date"%>
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
        
        <!-- link calendar resources -->
	<link rel="stylesheet" type="text/css" href="CSS/tcal.css" />
	<script type="text/javascript" src="JS/tcal.js"></script>
    </head>
    <body>
        <h1>Libro Diario</h1>
        <%                
            java.util.Date fecha = new Date();
            
            String anio=Integer.toString(fecha.getYear());
            String mes=Integer.toString(fecha.getMonth());
            String dia=Integer.toString(fecha.getDay());
            //String fech= dia+"/"+mes+"/"+anio;
            String fech= "1";
         %>
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
                
                <td></td>
                <td></td>
            </tr>        
            <%
            LinkedList<AsientoClass> lista =new LinkedList<AsientoClass>();
            lista = AsientoDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               if(fech.toString().equals(lista.get(i).getNumeroDiario())){
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
                   //out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
                   //out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
                   out.println("</tr>");}
            }
            %>
            </table>
      </center>
            
           
      <!Boton de libro diario*********************************>      
  
      
      <a class='modalbox' href='#eliminar'><img SRC="Imagen/LibroDiario.png" width="50" height="50"></a>  
      
      
      <div id="ingresar">
	<h2>Nuevo</h2>
	<form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet1" method="post" >
            
            
                <label for="NumeroCuenta">Numero Diario  </label>
                <input align='right' type="NumeroCuenta" id="numeroCuenta" name="numeroDiario" class="txtingresar" required="required" value="<% out.print(fech); %>" onkeypress="return Numeros(event)">
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
                <input type="DebeAsiento" id="Cuenta_idCuenta" name="debeAsiento" value="0" class="txtingresar" required="required" onkeypress="return Numeros(event)"  readonly="readonly">                      >
                <br>

                <label for="HaberAsiento">Haber Asiento</label>
                <input type="HaberAsiento" id="Cuenta_idCuenta" name="haberAsiento" value="0" class="txtingresar" required="required" onkeypress="return Numeros(event)" readonly="readonly">
                <br>
                
                <input type="submit" value="Ingresar" id="send">
                
	</form>
</div>  
       
                
        <!-- hidden INGRESAR form -->
<div id="modificar">
	<h2>Nuevo</h2>
	<form id="modificarform" name="modificarform" action="TransaccionIngresarServlet1" method="post" >
            
            <label for="Asiento_idAsiento">Id Asiento</label>
                <input align='right' type="asiento_idAsiento" id="asiento_idAsiento" name="Asiento_idAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                 
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
                        
                        out.println("<option value='"+aux.getIdCuenta()+"' selected>"+aux.getNumeroCuenta()+" "+aux.getDescripcionCuenta()+"</option>");            
                    }
                %>
                </select> 
		<br>
            
            <label for="DebeTransaccion">Debe Transaccion</label>
		<input align='right' type="debeTransaccion" id="debeTransaccion" name="debeTransaccion"  class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>	
	    
	    <label for="HaberTransaccion">Haber Transaccion</label>
		<input align='right' type="haberTransaccion" id="haberTransaccion" name="haberTransaccion"  class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <label for="ReferenciaTransaccion">Referencia Transaccion</label>
		<input align='right' type="referenciaTransaccion" id="referenciaTransaccion" name="referenciaTransaccion" class="txtingresar" required="required">
		<br>
            
            <label for="DocumentoTransaccion">Documento Transaccion</label>
		<input align='right' type="documentoTransaccion" id="documentoTransaccion" name="documentoTransaccion" class="txtingresar" required="required">
		<br>    
		<input type="submit" value="Ingresar" id="send">
	</form>
                
    </div>
    
                
    <div id="eliminar">
	<h2>Libro Diario</h2>
        <form id="eliminarrform" name="eliminarform"  method="post" >
        
            <%
                    LinkedList <AsientoClass> lista3=new LinkedList<AsientoClass>();
                    lista3 = AsientoDAO.consultar();
                    
                    for (int i=0;i<lista3.size();i++)
                    {
                        AsientoClass aux=lista3.get(i);
                        if(fech.toString().equals(lista3.get(i).getNumeroDiario())){
                            if (!aux.getDebeAsiento().equals(aux.getHaberAsiento())){
                                %>
                                <script type="text/javascript"> alert("El Asiento <% out.print(aux.getIdAsiento()); %> esta descuadrado")</script>
                                <%
                            }
                        }
                        
                        //out.println("<option value='"+aux.getIdCuenta()+"' selected>"+aux.getNumeroCuenta()+" "+aux.getDescripcionCuenta()+"</option>");            
                    }
               %>
            
            
            <center>
                <table id="miTabla" border="1">
                <tr> </tr>
                <tr>
                    <td class="estilo1">Fecha</td>
                    <td class="estilo1">Detalle</td>
                    <td class="estilo1">Debe</td>
                    <td class="estilo1">Haber</td>
                </tr>        
            <%
            LinkedList<AsientoClass> listaAsiento =new LinkedList<AsientoClass>();
            LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
            listaAsiento = AsientoDAO.consultar();
            double totalDebe=0;
            double totalHaber=0;
            for (int i=0;i<listaAsiento.size();i++)
            {
               if(fech.toString().equals(listaAsiento.get(i).getNumeroDiario())){
                   out.println("<tr data-valor='"+i+"' class='click'>" );
                   out.println("</tr>"); 
                   out.println("<tr align='center'>");
                   out.println("<td colspan='4'>-"+listaAsiento.get(i).getNumeroAsiento()+"-</td>");
                   out.println("</tr>");
                   out.println("<tr>");
                   out.println("<td id='a"+i+"'>"+listaAsiento.get(i).getFechaAsiento()+"</a></td><td></td><td></td><td></td>");
                   out.println("</tr>");
                   TransaccionDAO t=new TransaccionDAO();
                   listaTra=t.consultarTransaccion(listaAsiento.get(i).getIdAsiento());
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getHaberTransaccion().equals("0.0")){
                            out.println("<tr>");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>"+nom+"</td>");
                            out.println("<td>"+listaTra.get(j).getDebeTransaccion()+"</td><td></td>");
                            out.println("</tr>");
                       }
                   }
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getDebeTransaccion().equals("0.0")){
                            out.println("<tr>");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>-"+nom+"</td>");
                            out.println("<td></td><td>"+listaTra.get(j).getHaberTransaccion()+"</td>");
                            out.println("</tr>");
                       }
                   }
                    out.println("<tr><td></td><td>Ref: "+listaAsiento.get(i).getConceptoAsiento()+"</td><td></td><td></td></tr>");
                    totalDebe=totalDebe+Double.parseDouble(listaAsiento.get(i).getDebeAsiento());
                    totalHaber=totalHaber+Double.parseDouble(listaAsiento.get(i).getHaberAsiento());
                    out.println("<tr><td></td><td></td><td></td><td></td></tr>");
                    
               }
               
               
            }
               out.println("<tr><td></td><td>TOTALES:</td><td>"+totalDebe+"</td><td>"+totalHaber+"</td></tr>");
            %>
            </table>
      </center>   
               
               
               
            
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
                $asiento_idAsiento=document.getElementById("a"+data.toString()).innerHTML;
                document.modificarform.asiento_idAsiento.value=$asiento_idAsiento;
            });
        });
    </script>
    </body>
</html>
