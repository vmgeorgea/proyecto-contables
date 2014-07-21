<%-- 
    Document   : IngresarAsiento
    Created on : 17/07/2014, 12:55:53 PM
    Author     : Leitos
--%>

<%@page import="DAO.TransaccionDAO"%>
<%@page import="DAO.CuentaDAO"%>
<%@page import="Clases.CuentaClass"%>
<%@page import="DAO.AsientoAuxDAO"%>
<%@page import="Clases.TransaccionClass"%>
<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Asiento</title>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
        <script type="text/javascript" src="JS/ValidarJS.js"></script>
        
        <link rel="stylesheet" type="text/css" href="CSS/tcal.css" />
	<script type="text/javascript" src="JS/tcal.js"></script>
        <%
            String ref="";
          String ban="0"; 
          String mens="El Asiento esta guardado";
          
          AsientoClass asiento=new AsientoClass();
          LinkedList<TransaccionClass> listaTransaccion =new LinkedList<TransaccionClass>();
            LinkedList<AsientoClass> lista1 =new LinkedList<AsientoClass>();
            lista1 = AsientoDAO.consultar();
            String num=String.valueOf(lista1.size()+1);
            ban="0";
            
            LinkedList<AsientoClass> listaAsi =new LinkedList<AsientoClass>();
                lista1 = AsientoAuxDAO.consultar();
                AsientoClass asieAux= new AsientoClass();
                asiento.setHaberAsiento("0.0");
                asiento.setDebeAsiento("0.0");
                if(lista1.size()>0){
                    listaAsi = AsientoDAO.consultar();
                    asiento=listaAsi.getLast();
                    //asiento=lista1.getLast();
                    //asiento.setIdAsiento(asieAux.getIdAsiento());
                }
            
        %>
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
                document.modificarform.Asiento_idAsiento.value=$Asiento_idAsiento;
                document.modificarform.Cuenta_idCuenta.value=$Cuenta_idCuenta;
                document.modificarform.debeTransaccion.value=$debeTransaccion;
                document.modificarform.haberTransaccion.value=$haberTransaccion;
                document.modificarform.referenciaTransaccion.value=$referenciaTransaccion;
                
                document.modificarform.documentoTransaccion.value=$documentoTransaccion;
              
                
        
                
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
         
         
        }
        
        function Eliminar(){
            
            <%
                   if(!mens.equals("El Asiento esta guardado")){
                       AsientoDAO aux2=new AsientoDAO();
                       aux2.eliminar(asiento);
                   
                   }
                       
            %>
        }
        
        function Guardar(){
        
         <%
                   
                   
          ban="1";  
        
               
                   if(ban.equals("1")){
                       if(asiento.getDebeAsiento().equals("0.0") && asiento.getHaberAsiento().equals("0.0")){
                        mens="El Asiento esta vacio no puede ser guardado";
                        AsientoDAO aux2=new AsientoDAO();
                        //aux2.eliminar(asiento);
                    }
                    else{
                        if(!asiento.getDebeAsiento().equals(asiento.getHaberAsiento())){
                            mens="El Asiento esta descuadrado no puede ser guardado";
                            AsientoDAO aux2=new AsientoDAO();
                            //aux2.eliminar(asiento);
                        }
                        else{
                            mens="El Asiento esta guardado";
                        }
                    }
                   ban="0";
                   }
                   ban="0";    
                    
           %>
         
        }
        
    </script>      
         
    </head>
    <body>
        <%   
            
            //LinkedList<TransaccionClass> listaTransaccion =new LinkedList<TransaccionClass>();
            //LinkedList<AsientoClass> lista1 =new LinkedList<AsientoClass>();
            //lista1 = AsientoDAO.consultar();
            //String num=String.valueOf(lista1.size()+1);
            //ban="0";
        %>
        <h1>Asiento</h1>
        
            
            <center>
            <table id="miTabla">
            <tr align="center">
                <td class="estilo1" colspan="5" >Asiento</td>
            </tr>
            <tr align="center">
                <td class="estilo1" colspan="4">-<%=num %>- </td>
                <td class="estilo1">Nueva Transaccion</td>
            </tr>
            <tr align="center">
                <td class="estilo1">Fecha</td>
                <td class="estilo1">Detalle</td>
                <td class="estilo1">Debe</td>
                <td class="estilo1">Haber</td>
                <td><a value="Nuevo Asiento"  class="modalbox" href='#eliminar' onclick="javaScript:Datos();"><img SRC='Imagen/Agregar.png'></a></td>
                <td></td>
            </tr>
             
            <%
               // LinkedList<AsientoClass> listaAsi =new LinkedList<AsientoClass>();
               // lista1 = AsientoAuxDAO.consultar();
               // AsientoClass asieAux= new AsientoClass();
               // asiento.setHaberAsiento("0.0");
              //  asiento.setDebeAsiento("0.0");
              //  if(lista1.size()>0){
              //      listaAsi = AsientoDAO.consultar();
              //      asiento=listaAsi.getLast();
                    //asiento=lista1.getLast();
                    //asiento.setIdAsiento(asieAux.getIdAsiento());
              //  }
                
            %>
            <tr>
                <td class="estilo1" colspan="5"><% out.print( asiento.getFechaAsiento()); %></td>
                    
            </tr>  
            <%    
                
                LinkedList<AsientoClass> listaAsiento =new LinkedList<AsientoClass>();
            LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
            listaAsiento = AsientoDAO.consultar();
            double totalDebe=0;
            double totalHaber=0;
              
                        
               
                   TransaccionDAO t=new TransaccionDAO();
                   listaTra=t.consultarTransaccion(asiento.getIdAsiento());
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getHaberTransaccion().equals("0.0")){
                            out.println("<tr data-valor='"+j+"' class='click'>");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>"+nom+"</td>");
                            out.println("<td>"+listaTra.get(j).getDebeTransaccion()+"</td> <td></td> ");
                            out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a> <a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                            //out.println("<td></td>");
                            out.println("<td style = 'visibility : hidden' id='a"+j+"'>"+listaTra.get(j).getIdTransaccion()+"</a></td>");
                            out.println("<td style = 'visibility : hidden' id='b"+j+"'>"+listaTra.get(j).getAsiento_idAsiento()+"</a></td>");
                            out.println("<td style = 'visibility : hidden' id='c"+j+"'>"+listaTra.get(j).getCuenta_idCuenta()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='d"+j+"'>"+listaTra.get(j).getDebeTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='e"+j+"'>"+listaTra.get(j).getHaberTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='f"+j+"'>"+listaTra.get(j).getReferenciaTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='g"+j+"'>"+listaTra.get(j).getDocumentoTransaccion()+"</td>");
                            
                            out.println("</tr>");
                       }
                   }
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getDebeTransaccion().equals("0.0")){
                            out.println("<tr data-valor='"+j+"' class='click'>");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>-"+nom+"</td>");
                            out.println("<td></td><td>"+listaTra.get(j).getHaberTransaccion()+"</td>");
                            out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a> <a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                            //out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                            
                            out.println("<td style = 'visibility : hidden' id='a"+j+"'>"+listaTra.get(j).getIdTransaccion()+"</a></td>");
                            out.println("<td style = 'visibility : hidden' id='b"+j+"'>"+listaTra.get(j).getAsiento_idAsiento()+"</a></td>");
                            out.println("<td style = 'visibility : hidden' id='c"+j+"'>"+listaTra.get(j).getCuenta_idCuenta()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='d"+j+"'>"+listaTra.get(j).getDebeTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='e"+j+"'>"+listaTra.get(j).getHaberTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='f"+j+"'>"+listaTra.get(j).getReferenciaTransaccion()+"</td>");
                            out.println("<td style = 'visibility : hidden' id='g"+j+"'>"+listaTra.get(j).getDocumentoTransaccion()+"</td>");
                       
                            out.println("</tr>");
                       }
                   }  
            %>
            <tr align="center">
                <td class="estilo1" colspan="2">TOTAL</td>
                <td class="estilo1"><% out.print(asiento.getDebeAsiento()); %></td>
                <td class="estilo1"><% out.print(asiento.getHaberAsiento()); %></td>
                <td></td>
            </tr>
            <tr align="center">
                <td class="estilo1" >Ref:</td>
                <td class="estilo1" colspan="2"><% out.print(asiento.getConceptoAsiento()); %></td>
                <td class="estilo1"><a value="Nuevo Asiento"  class="modalbox" href='#ingresar' onclick="javaScript:Datos();"><img SRC="Imagen/Nuevo.png"></a></td>
                <td></td>
            </tr>
            </table>
      </center>
                           
    <!Boton de guardar asiento*********************************>      
      <a value="Guardar Asiento" class="modalbox" href='#guardarAsiento' onclick="javaScript:Guardar(); javaScript:Eliminar();" ><img SRC="Imagen/botonGuardar.gif"></a>
            
      <div id="ingresar">
                <h2>Nuevo Asiento</h2>
                    <form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet1" method="post">

                            <label for="NumeroCuenta">Numero Diario  </label>
                            <input align='right' type="NumeroCuenta" id="numeroCuenta" name="numeroDiario" class="txtingresar" value="1" readonly="readonly" required="required" onkeypress="return Numeros(event)">
                            
                            <br>	

                            <label for="PeriodoAsiento">Periodo Asiento</label>
                            <input align='right' type="NumeroCuenta" id="periodoAsiento" name="periodoAsiento" class="txtingresar" value="2014" readonly="readonly" required="required" onkeypress="return Numeros(event)">
                            <br>

                            <label for="FechaAsiento">Fecha Asiento</label>
                            <input type="FechaAsiento" id="fechaAsiento" name="fechaAsiento" class="txtingresar" required="required" readonly="readonly">

                            <br>

                            <label for="NumeroAsiento">Numero Asiento</label>
                            <input type="NumeroAsiento" id="SaldoFinalCuenta" name="numeroAsiento" class="txtingresar" required="required" value="<%=num %>" readonly="readonly">
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
                            <%
                                //asiento.setDebeAsiento("0.0");
                                //asiento.setHaberAsiento("0.0");
                                //asiento.setNumeroAsiento(num);
                                //asiento.setNumeroDiario("1");
                                //asiento.setConceptoAsiento(ref);
                            %>
                            <input type="submit" value="Ingresar" id="send">
                            
                    </form>
            </div> 
                    <!-- hidden INGRESAR form -->
            <div id="eliminar">
                <h2>Nuevo</h2>
                <form id="imgresarTransaccionform" name="imgresarTransaccionform" action="TransaccionIngresarServlet1" method="post" >

                    <label for="Asiento_idAsiento">Id Asiento</label>
                    <input align='right' type="asiento_idAsiento" id="asiento_idAsiento" name="Asiento_idAsiento" class="txtingresar" value="<%out.print(asiento.getIdAsiento());%>" required="required" onkeypress="return Numeros(event)">

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
                    <input align='right' type="debeTransaccion" id="debeTransaccion" name="debeTransaccion"  class="txtingresar" required="required" value="0.0" onkeypress="return Numeros(event)">
                        <br>	

                    <label for="HaberTransaccion">Haber Transaccion</label>
                        <input align='right' type="haberTransaccion" id="haberTransaccion" name="haberTransaccion"  class="txtingresar" required="required" value="0.0" onkeypress="return Numeros(event)">
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
                        
        <div id="modificar">
	
            <h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="TransaccionModificarServlet" method="post">
            <label for="idTransaccion">Id Transaccion</label>
		<input align='right' type="idTransaccion" id="idTransaccion" name="idTransaccion" class="txtingresar" required="required" readonly="readonly" onkeypress="return Numeros(event)">
		<br>		
            <label for="Asiento_idAsiento">Id Asiento</label>
                <input align='right' type="Asiento_idAsiento" id="Asiento_idAsiento" name="Asiento_idAsiento" class="txtingresar" required="required" readonly="readonly" onkeypress="return Numeros(event)">
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
                        
       <div id="guardarAsiento">
           
           
           
           
           
           <form id="guardarAsientoform" name="guardarAsientoform" action="Asiento.jsp" method="post">
               
              <%
               
                   if(ban.equals("1")){
                       if(asiento.getDebeAsiento().equals("0.0") && asiento.getHaberAsiento().equals("0.0")){
                        mens="El Asiento esta vacio no puede ser guardado";
                        AsientoDAO aux2=new AsientoDAO();
                        //aux2.eliminar(asiento);
                    }
                    else{
                        if(asiento.getDebeAsiento().equals(asiento.getHaberAsiento())){
                            mens="El Asiento esta descuadrado no puede ser guardado";
                            AsientoDAO aux2=new AsientoDAO();
                            aux2.eliminar(asiento);
                        }
                        else{
                            mens="El Asiento esta guardado";
                        }
                    }
                   ban="0";
                   }
                   ban="0";
                   
                    
           %> 
                
            <h2><% out.print(mens); %></h2>
            
            <input type="submit" value="Aceptar" id="send" onclick="javaScript:Eliminar();">
           </form>
        </div>
                
    </body>
</html>