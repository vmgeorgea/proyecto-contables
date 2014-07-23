<%-- 
    Document   : FacturaVentaProductos
    Created on : Jul 12, 2014, 9:07:30 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "DAO.FormaspagoDAO"%> 
<%@ page import = "Clases.FormaspagoClass"%>
<%@ page import = "DAO.ProductoDAO"%> 
<%@ page import = "Clases.ProductoClass"%>
<%@ page import = "DAO.IVADAO"%> 
<%@ page import = "Clases.IVAClass"%> 
<%@ page import = "Clases.ProductoVentaClass"%> 
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
     <%
    java.util.Calendar fecha = java.util.Calendar.getInstance();
    String f;
        if((fecha.get(java.util.Calendar.MONTH)+1)<10){
        f=fecha.get(java.util.Calendar.DATE) + "/0"+ (fecha.get(java.util.Calendar.MONTH)+1)+ "/"+ fecha.get(java.util.Calendar.YEAR);
        }else{
        f=fecha.get(java.util.Calendar.DATE) + "/"+ (fecha.get(java.util.Calendar.MONTH)+1)+ "/"+ fecha.get(java.util.Calendar.YEAR);
        }
    session.setAttribute("fechaFactura", f);
    %>    
    <body>
       <center>
        <form action="FacturaVentaServlet" method="post" name="FacturaVentaProducto">
        <table id="miTabla">
        <tr>
        <td class="estilo1">Id Producto</td>
        <td class="estilo1">Nombre Productos</td>
        <td class="estilo1">Precio Productos</td>
        <td class="estilo1">Cantidad Productos</td>
        <td class="estilo1">Subtotal Productos</td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        </tr>
        <tr>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td class="estilo1"></td>
        <td><a class='modalbox' href='#ingresar'><img SRC="Imagen/Agregar.png"></a></td>
        <td class="estilo1"></td>
        <td></td>
        <td></td>
        </tr>        
        <%
         LinkedList<ProductoVentaClass> lista =new LinkedList<ProductoVentaClass>();
         HttpSession session1 = request.getSession();
               if(session1.getAttribute("productos")!=null){
                   lista = (LinkedList) session1.getAttribute("productos");
                }
          float subtotal=0;
          float total=0;
          String valiva;
          float subtotaldescuento;
         for (int i=0;i<lista.size();i++)
        {
           out.println("<tr data-valor='"+i+"' class='click'>" );
           out.println("<td id='a"+i+"'>"+lista.get(i).getIdProducto()+"</a></td>");
           out.println("<td id='b"+i+"'>"+lista.get(i).getNombreProducto()+"</a></td>");
           out.println("<td id='c"+i+"'>"+lista.get(i).getPrecioProducto()+"</td>");
           out.println("<td id='d"+i+"'>"+lista.get(i).getCantidadProducto()+"</td>");
           out.println("<td id='e"+i+"'>"+Float.parseFloat(lista.get(i).getCantidadProducto())*Float.parseFloat(lista.get(i).getPrecioProducto())+"</td>");
           out.println("<td></td>");
           out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
           out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
           out.println("</tr>");           
           subtotal=subtotal+Float.parseFloat(lista.get(i).getCantidadProducto())*Float.parseFloat(lista.get(i).getPrecioProducto());
        }
        %>
        <tr>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'>Subtotal</td>
        <td class='estilo1' id="cedldasubtotal"><%=subtotal%></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <tr>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1' >Descuento</td>   
        <td class='estilo1'>
           <select name="descuentoFactura" id="descuentoFactura" onchange="Descuento()" style="width:45px" value="1"> 
            <option value="0.0" selected>0.0</option>
            <option value="0.10" >0.10</option>
            <option value="0.20" >0.20</option>
            <option value="0.30" >0.30</option>
            <option value="0.40" >0.40</option>
            <option value="0.50" >0.50</option>
            <option value="0.60" >0.60</option>
            <option value="0.70" >0.70</option>
            <option value="0.80" >0.80</option>
            <option value="0.90" >0.90</option>                              
           </select>            
        </td>
        <td class='estilo1'></td>        
        <td class='estilo1'></td>
        <td class='estilo1'></td>        
        <tr>
        <%
        double b=subtotal+(subtotal*0.0);
        subtotaldescuento=(float)b;
        %>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1' >Subtotal Descuento</td>
        <td class='estilo1' id="cedldasubtotaldescuento"><%=subtotaldescuento%></td>
        <td class='estilo1'> </td>        
        <td class='estilo1'></td>
        <td class='estilo1'></td>        
        <tr>            
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'>IVA</td>
        <td class='estilo1'>
       <select id="ivaFactura" name="ivaFactura" onchange="Iva()" style="width:45px">                    
                    <%
                    LinkedList<IVAClass> lista2 =new LinkedList<IVAClass>();
                    lista2 = IVADAO.consultar();
                    for (int i=0;i<lista2.size();i++)
                    {
                    out.println("<option value='"+lista2.get(i).getIdIva()+"' selected>"+lista2.get(i).getValorIva()+"</option>");
                    }  
                    %>
        </select>         
        </td>    
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <tr>
        <%
        if(session1.getAttribute("IVA")!=null){
         valiva=(String)session1.getAttribute("IVA");        
        }else{
         valiva="0.0";
        }            
        double a= subtotaldescuento*Double.valueOf(valiva);
        float iva=(float)a;
        %>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'>Subtotal IVA</td> 
        <td class='estilo1' id="cedldasubtotaliva"><%=iva%></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>
        </tr>  
        <tr>   
        <td  class='estilo1'></td>
        <td  class='estilo1'></td>
        <td class='estilo1'></td>
        <td class='estilo1'>Total</td>
        <%
        total=(iva+subtotaldescuento);
        %>
        <td class='estilo1'><input style="width:45px" type="text" id="cedldatotal" name="cedldatotal" required="required" readonly="readonly" value=<%=total%>></td>
        <td class='estilo1'></td>
        <td class='estilo1'></td>                                                                         
      </table>          
                  <table>         
                        <tr>  
                        <td  class='estilo1'></td>
                        <td  class='estilo1'></td>
                        <td  class='estilo1'></td>
                        <td  class='estilo1'></td>
                        <td  class='estilo1'></td>
                        <td class='estilo1'></td> 
                        <td class='estilo1'></td> 
                            <select id="formaspagoFactura" name="formaspagoFactura" >                                  
                            <%
                            LinkedList<FormaspagoClass> lista3 =new LinkedList<FormaspagoClass>();
                            lista3 = FormaspagoDAO.consultar();
                            for (int i=0;i<lista3.size();i++)
                            {
                            out.println("<option value='"+lista3.get(i).getIdformaspago()+"-"+lista3.get(i).getIdcuenta()+"' selected>"+lista3.get(i).getDescripcionformaspago()+"</option>");
                            }  
                            %>
                            </select> 
                        </tr>                        
                        <tr>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td  class='estilo1'></td>
                            <td><button name="boton" type="submit" style="background-color:white; border:none">Guardar</button><td>
                        </tr>                                               
                            
                </table>  
         </form>
      </center>
    
<!-- hidden INGRESAR form -->
    <div id="ingresar">
	<h2>Agregar</h2>
	<form id="ingresarform" name="ingresarform" action="FacturaVentaAgregarServlet" method="post" >
	    <label for="NombreProducto">Tipo Cuenta</label>
                <select name="nombreProducto" class="combo"> 
                <option value="0" selected>SELECCIONAR</option>
                <%
                    LinkedList<ProductoClass> lista1 =new LinkedList<ProductoClass>();
                    lista1 = ProductoDAO.consultar();
                    for (int i=0;i<lista1.size();i++)
                    {
                    out.println("<option value='"+lista1.get(i).getIdProducto()+"-"+lista1.get(i).getNombreProducto()+"/"+lista1.get(i).getPrecioProducto()+"' selected>"+lista1.get(i).getIdProducto()+"-"+lista1.get(i).getNombreProducto()+"/"+lista1.get(i).getPrecioProducto()+"</option>");
                    }
                %>
                </select> 
		<br>	               
                <label for="cantidadProducto">Cantidad Producto</label>
		<input type="cantidadProducto" id="cantidadProducto" name="cantidadProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
		<input type="submit" value="Ingresar" id="send">            
	</form>
    </div>
<!-- hidden MODIFICAR form -->
<div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="FacturaVentaModificarServlet" method="post">
		<label for="idProducto">Id Prodcuto</label>
		<input type="idProducto" id="idProducto" name="idProducto" class="txtmodificar" required="required" readonly="readonly" >
		<br>
		<label for="cantidadProducto">Cantidad Producto</label>
		<input type="cantidadProducto" id="cantidadProducto" name="cantidadProducto" class="txtmodificar" required="required">
		<br>		
                <input type="submit" value="Modificar" id="send">
	</form>
</div>    

<!-- hidden ELIMINAR form -->
<div id="eliminar">
	<h2>Eliminar</h2>
	<form id="eliminarform" name="eliminarform" action="FacturaVentaRetirarServlet" method="post">
		<label for="idProducto">Desea retirar el producto con la siguienta id:</label>
		<input type="idProducto" id="idProducto" name="idProducto" class="txteliminar" readonly="readonly" >
                <br>
                <input type="submit" value="Eliminar" id="send">
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
                $idProducto=document.getElementById("a"+data.toString()).innerHTML;
                $cantidadProducto=document.getElementById("d"+data.toString()).innerHTML;
                document.modificarform.idProducto.value=$idProducto;  
                document.eliminarform.idProducto.value=$idProducto; 
                document.modificarform.cantidadProducto.value=$cantidadProducto;        
            });
        });              
      
            function Iva(){
                var subtotaldescuento=parseFloat(document.getElementById("cedldasubtotaldescuento").innerHTML);
                var posicion=document.getElementById("ivaFactura").options.selectedIndex;
                var iva=parseFloat(document.getElementById("ivaFactura").options[posicion].text);
                var subtotaliva=iva*subtotaldescuento;
                document.getElementById("cedldasubtotaliva").innerHTML = subtotaliva;
                var total=subtotaliva+subtotaldescuento;
                document.getElementById("cedldatotal").value  = total;                 
            }

            function Descuento() { 
                var subtotal=parseFloat(document.getElementById("cedldasubtotal").innerHTML);
                var posicion1=document.getElementById("descuentoFactura").options.selectedIndex;
                var descuento=parseFloat(document.getElementById("descuentoFactura").options[posicion1].text);
                document.getElementById("cedldasubtotaldescuento").innerHTML = subtotal-(subtotal*descuento);
                var subtotaldescuento=parseFloat(document.getElementById("cedldasubtotaldescuento").innerHTML);
                var posicion2=document.getElementById("ivaFactura").options.selectedIndex;
                var iva=parseFloat(document.getElementById("ivaFactura").options[posicion2].text);
                var subtotaliva=(iva*subtotaldescuento);
                document.getElementById("cedldasubtotaliva").innerHTML = subtotaliva;    
                var total=subtotaliva+subtotaldescuento;
                document.getElementById("cedldatotal").value = total;
            } 
           
</script>                          
    </body>
</html>
