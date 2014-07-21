<%-- 
    Document   : Asiento
    Created on : 09/07/2014, 01:36:49 PM
    Author     : Leitos
--%>


<%@page import="DAO.AsientoAuxDAO"%>
<%@page contentType="text/html" import="java.util.*" %>
<%@page import="DAO.CuentaDAO"%>
<%@page import="DAO.TransaccionDAO"%>
<%@page import="Clases.TransaccionClass"%>
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
        <script type="text/javascript" src="JS/ValidarJS.js"></script>>
        
        <link rel="stylesheet" type="text/css" href="CSS/tcal.css" />
	<script type="text/javascript" src="JS/tcal.js"></script>
        
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
        
       function Datos(){
        var f = new Date();
            if((f.getMonth() +1)<10)
            {
            var fecha=f.getDate() + "/0" + (f.getMonth() +1) + "/" + f.getFullYear(); 
            }else{
            var fecha=f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();     
            }
         document.ingresarform.fechaAsiento.value=fecha;
         
         function envia(z){
            form = document.getElementById("eliminarform");
            form.parametro1.value = z;
            form.submit();
        }
         
         
        }  
    </script>         
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
                <td><a href="IngresarAsiento.jsp" target="contenidoregistro"><img SRC="Imagen/Nuevo.png"></a></td>
                
                <td></td>
                <td></td>
            </tr>        
            <%
            LinkedList<AsientoClass> lista =new LinkedList<AsientoClass>();
            lista = AsientoDAO.consultar();
            for (int i=0;i<lista.size();i++){
                AsientoClass asito=new AsientoClass();
                AsientoDAO dao=new AsientoDAO();
                asito=lista.get(i);
                if(asito.getDebeAsiento().equals("0.0")&&asito.getHaberAsiento().equals("0.0")){
                    dao.eliminar(asito);
                }
                if(!asito.getDebeAsiento().equals(asito.getHaberAsiento())){
                    dao.eliminar(asito);
                }
                
                
            }
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
               
               //out.println("<td><input type='button' onclick='javaScript:envia('a');' href='#eliminar'></td>");
               //out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png' ></a></td>");
               out.println("</tr>");
            }
            %>
            </table>
      </center>
            
      <!-- hidden INGRESAR form -->
<div id="ingresar">
	<h2>Nuevo</h2>
	<form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet" method="post">
            
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
                <input type="FechaAsiento" id="fechaAsiento" name="fechaAsiento" class="txtingresar" required="required" readonly="readonly">
                
                <br>

                <label for="NumeroAsiento">Numero Asiento</label>
                <input type="NumeroAsiento" id="SaldoFinalCuenta" name="numeroAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                <br>

                <label for="ConceptoAsiento">Concepto Asiento</label>
                <input type="ConceptoAsiento" id="Cuenta_idCuenta" name="conceptoAsiento" class="txtingresar" required="required">
                <br>	

                <label for="DebeAsiento">Debe Asiento</label>
                <input type="DebeAsiento" id="Cuenta_idCuenta" name="debeAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)" readonly="readonly" value="0.0">
                <br>

                <label for="HaberAsiento">Haber Asiento</label>
                <input type="HaberAsiento" id="Cuenta_idCuenta" name="haberAsiento" class="txtingresar" required="required" onkeypress="return Numeros(event)" readonly="readonly" value="0.0">
                <br>
                
                <input type="submit" value="Ingresar" id="send">
	</form>
</div>  
                
    <!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Asiento</h2>
        <form id="eliminarform" action="eliminarform" name="eliminarform" method="post">
		<label for="IdAsiento">Asiento:</label>
		<input type="hidden" id="idAsiento" name="idAsiento" class="txteliminar" readonly="readonly" >
                <br>
                <input type="button" onclick="javaScript:envia('x');">
                <% 
                String id=request.getParameter("a");
                
              
                %>
            <center>
                <table>
                <tr> </tr>
                <tr>
                    <td class="estilo1">Fecha</td>
                    <td class="estilo1">Detalle</td>
                    <td class="estilo1">Debe</td>
                    <td class="estilo1">Haber</td>
                </tr>         
            <%
            LinkedList<AsientoClass> listaAsi =new LinkedList<AsientoClass>();
            LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
            listaAsi = AsientoDAO.consultar();
            double totalDebe=0;
            double totalHaber=0;
            
            
            for (int i=0;i<listaAsi.size();i++)
            {
                
               //if(fech.toString().equals(listaAsi.get(i).getNumeroDiario())){
                if(listaAsi.get(i).getIdAsiento().equals(id)){
                   out.println("<tr data-valor='"+i+"' class='click'>" );
                   out.println("</tr>"); 
                   out.println("<tr>");
                   out.println("<td>-"+listaAsi.get(i).getNumeroAsiento()+"-</td>");
                   out.println("</tr>");
                   out.println("<tr>");
                   out.println("<td id='a"+i+"'>"+listaAsi.get(i).getFechaAsiento()+"</a></td>");out.println("</tr>");
                   TransaccionDAO t=new TransaccionDAO();
                   listaTra=t.consultarTransaccion(listaAsi.get(i).getIdAsiento());
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getHaberTransaccion().equals("0.0")){
                            out.println("<tr>");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>"+nom+"</td>");
                            out.println("<td>"+listaTra.get(j).getDebeTransaccion()+"</td>");
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
                    out.println("<tr><td></td><td>Ref: "+listaAsi.get(i).getConceptoAsiento()+"</td><td></td></tr>");
                    totalDebe=totalDebe+Double.parseDouble(listaAsi.get(i).getDebeAsiento());
                    totalHaber=totalHaber+Double.parseDouble(listaAsi.get(i).getHaberAsiento()); 
               } 
            }
               out.println("<tr><td></td><td>TOTALES:</td><td>"+totalDebe+"</td><td>"+totalHaber+"</td></tr>");
            %>
            </table>
      </center>   
               
               
               
            
        </form>
    </div>  
                
                
	
</div>               
      
    
    <!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Ver</h2>
	<form id="modificarform" name="modificarform" action="AsientoModificarServlet1" method="post">
            <label for="idAsiento">Numero Diario  </label>
		<input align='right' type="idAsiento" id="idAsiento" name="idAsiento" class="txtingresar" required="required" readonly="readonly">
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
                <input type="submit" value="Ver" id="send">
	</form>
    </div>
    
    
                <%
                    LinkedList <AsientoClass> listaAsiento=new LinkedList<AsientoClass>();
                    listaAsiento=AsientoAuxDAO.consultar();
                    
                    for(int i=0;i<listaAsiento.size();i++){

                        AsientoAuxDAO asiAux=new AsientoAuxDAO();
                        asiAux.eliminar(listaAsiento.get(i));
                        
                    }
                %>
     
    </body>
</html>
