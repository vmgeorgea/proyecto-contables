<%-- 
    Document   : Producto
    Created on : 10/07/2014, 04:52:17 AM
    Author     : Leitos
--%>

<%@page import="DAO.ProductoDAO"%>
<%@page import="Clases.ProductoClass"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
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
                <td class="estilo1">Id Producto</td>
                <td class="estilo1">Nombre Producto</td>
                <td class="estilo1">Costo Producto</td>
                <td class="estilo1">Precio Prducto</td>
                <td class="estilo1">Stock Producto</td>
                <td class="estilo1">Impuesto Producto</td>
            </tr>
            <tr>
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
            LinkedList<ProductoClass> lista =new LinkedList<ProductoClass>();
            lista = ProductoDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdProducto()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getNombreProducto()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getCostoProducto()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getPrecioProducto()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getStockProducto()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getImpuestoProducto()+"</td>");
               out.println("<td></td>");
               out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
               //out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
               out.println("</tr>");
            }
            %>
            </table>
      </center>
            
      <!-- hidden INGRESAR form -->
<div id="ingresar">
	<h2>Nuevo</h2>
	<form id="ingresarform" name="ingresarform" action="ProductoIngresarServlet" method="post" >
            
            <label for="NombreProducto">Nombre Producto  </label>
		<input align='right' type="NombreProducto" id="nombreProducto" name="nombreProducto" class="txtingresar" required="required">
		<br>
                
            <label for="CostoProducto">Costo Producto  </label>
		<input align='right' type="CostoProducto" id="costoProducto" name="costoProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
	    
            <label for="PrecioProducto">Precio Producto  </label>
		<input align='right' type="PrecioProducto" id="precioProducto" name="precioProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="StockProducto">Stock Producto  </label>
		<input align='right' type="StockProducto" id="stockProducto" name="stockProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="ImpuestoProducto">Impuesto Producto  %</label>
		<input align='right' type="ImpuestoProducto" id="impuestoProducto" name="impuestoProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
                
            <input type="submit" value="Ingresar" id="send">
            
	</form>
</div>
      
      <div id="modificar">
	<h2>Modificar</h2>
	<form id="modificarform" name="modificarform" action="ProductoModificarServlet" method="post">
            
            <label for="IdProducto">Id Producto  </label>
		<input align='right' type="IdProducto" id="idProducto" name="idProducto" class="txtingresar" required="required" readonly="readonly">
		<br>
            
            <label for="NombreProducto">Nombre Producto  </label>
		<input align='right' type="NombreProducto" id="nombreProducto" name="nombreProducto" class="txtingresar" required="required">
		<br>
                
            <label for="CostoProducto">Costo Producto  </label>
		<input align='right' type="CostoProducto" id="costoProducto" name="costoProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
	    
            <label for="PrecioProducto">Precio Producto  </label>
		<input align='right' type="PrecioProducto" id="precioProducto" name="precioProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="StockProducto">Stock Producto  </label>
		<input align='right' type="StockProducto" id="stockProducto" name="stockProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="ImpuestoProducto">Impuesto Producto  %</label>
		<input align='right' type="ImpuestoProducto" id="impuestoProducto" name="impuestoProducto" class="txtingresar" required="required" onkeypress="return Numeros(event)">
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
                
                $idProducto=document.getElementById("a"+data.toString()).innerHTML;
                $nombreProducto=document.getElementById("b"+data.toString()).innerHTML;
                $costoProducto=document.getElementById("c"+data.toString()).innerHTML;
                $precioProducto=document.getElementById("d"+data.toString()).innerHTML;
                $stockProducto=document.getElementById("e"+data.toString()).innerHTML;
                $impuestoProducto=document.getElementById("f"+data.toString()).innerHTML;
                
                document.modificarform.idProducto.value=$idProducto;
                document.modificarform.nombreProducto.value=$nombreProducto;
                document.modificarform.costoProducto.value=$costoProducto;
                document.modificarform.precioProducto.value=$precioProducto;
                document.modificarform.stockProducto.value=$stockProducto;
                document.modificarform.impuestoProducto.value=$impuestoProducto;
                
            });
        });        
    </script>
      
    </body>
</html>
