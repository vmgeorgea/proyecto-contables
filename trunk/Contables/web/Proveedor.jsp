<%-- 
    Document   : Proveedor
    Created on : 12/07/2014, 12:33:03 AM
    Author     : Leitos
--%>

<%@page import="DAO.ProveedorDAO"%>
<%@page import="Clases.ProveedorClass"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedor</title>
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
                <td class="estilo1">Id Proveedor</td>
                <td class="estilo1">Identificacion Proveedor</td>
                <td class="estilo1">Nombre Proveedor</td>
                <td class="estilo1">Direccion Proveedor</td>
                <td class="estilo1">Telefono Proveedor</td>
                <td class="estilo1">Autorizacion Proveedor</td>
                <td class="estilo1">Fech Cadu Auto Proveedor</td>
                <td class="estilo1">Tipo Proveedor</td>
                
                
                
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
            LinkedList<ProveedorClass> lista =new LinkedList<ProveedorClass>();
            
            lista = ProveedorDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdProveedor()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getIdentificacionProveedor()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getNombreProveedor()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getDireccionProveedor()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getTelefonoProveedor()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getAutorizacionProveedor()+"</td>");
               out.println("<td id='g"+i+"'>"+lista.get(i).getFechaCaducidadAutorizacionProveedor()+"</td>");
               out.println("<td id='h"+i+"'>"+lista.get(i).getTipoProveedor()+"</td>");
               out.println("<td></td>");
               out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a></td>");
               //out.println("<td><a class='modalbox' href='#eliminar'><img SRC='Imagen/Eliminar.png'></a></td>");
               out.println("</tr>");
            }
            %>
            </table>
      </center>
          
        <div id="ingresar">
                <h2>Nuevo</h2>
                <form id="ingresarform" name="ingresarform" action="ProveedorIngresarServlet" method="post" >


                    <label for="IdentificacionProveedor">Identificacion Proveedor  </label>
                        <input align='right' type="IdentificacionProveedor" id="identificacionProveedor" name="identificacionProveedor" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                        <br>

                    <label for="NombreProveedor">Nombre Proveedor  </label>
                        <input align='right' type="NombreProveedor" id="nombreProveedor" name="nombreProveedor" class="txtingresar" required="required">
                        <br>

                    <label for="DireccionProveedor">Direccion Proveedor  </label>
                        <input align='right' type="DireccionProveedor" id="direccionProveedor" name="direccionProveedor" class="txtingresar" required="required">
                        <br>

                    <label for="TelefonoProveedor">Telefono Proveedor  </label>
                        <input align='right' type="TelefonoProveedor" id="telefonoProveedor" name="telefonoProveedor" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                        <br>

                    <label for="AutorizacionProveedor">Autorizacion Proveedor  </label>
                        <input align='right' type="AutorizacionProveedor" id="autorizacionProveedor" name="autorizacionProveedor" class="txtingresar" required="required" >
                        <br>

                    <label for="FechaCaducidadAutorizacionProveedor">Fech Cadu Auto Proveedor  </label>
                        <input align='right' type="FechaCaducidadAutorizacionProveedor" id="fechaCaducidadAutorizacionProveedor" name="fechaCaducidadAutorizacionProveedor" class="txtingresar" required="required" >
                        <br>
                        
                    <label for="TipoProveedor">Tipo Proveedor</label>
                        <select name="tipoProveedor" class="combo">  
                        <option  selected>SELECCIONAR</option>  
                        <%
                            out.println("<option value='CEDULA' selected> CEDULA </option>");
                            out.println("<option value='RUC' selected> RUC </option>");
                            out.println("<option value='PASAPORTE' selected> PASAPORTE </option>"); 
                        %>
                        </select> 
                        <br>

                    <input type="submit" value="Ingresar" id="send">
                </form>
        </div>
            
        <div id="modificar">
            <h2>Modificar</h2>
            <form id="modificarform" name="modificarform" action="ProveedorModificarServlet" method="post">

                <label for="IdProveedor">Id Proveedor  </label>
                        <input align='right' type="IdProveedor" id="idProveedor" name="idProveedor" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                        <br>
                        
                <label for="IdentificacionProveedor">Identificacion Proveedor  </label>
                        <input align='right' type="IdentificacionProveedor" id="identificacionProveedor" name="identificacionProveedor" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                        <br>

                    <label for="NombreProveedor">Nombre Proveedor  </label>
                        <input align='right' type="NombreProveedor" id="nombreProveedor" name="nombreProveedor" class="txtingresar" required="required">
                        <br>

                    <label for="DireccionProveedor">Direccion Proveedor  </label>
                        <input align='right' type="DireccionProveedor" id="direccionProveedor" name="direccionProveedor" class="txtingresar" required="required">
                        <br>

                    <label for="TelefonoProveedor">Telefono Proveedor  </label>
                        <input align='right' type="TelefonoProveedor" id="telefonoProveedor" name="telefonoProveedor" class="txtingresar" required="required" onkeypress="return Numeros(event)">
                        <br>

                    <label for="AutorizacionProveedor">Autorizacion Proveedor  </label>
                        <input align='right' type="AutorizacionProveedor" id="autorizacionProveedor" name="autorizacionProveedor" class="txtingresar" required="required" >
                        <br>

                    <label for="FechaCaducidadAutorizacionProveedor">Fech Cadu Auto Proveedor  </label>
                        <input align='right' type="FechaCaducidadAutorizacionProveedor" id="fechaCaducidadAutorizacionProveedor" name="fechaCaducidadAutorizacionProveedor" class="txtingresar" required="required" >
                        <br>
                        
                    <label for="TipoProveedor">Tipo Proveedor</label>
                        <select name="tipoProveedor" class="combo">  
                        <option  selected>SELECCIONAR</option>  
                        <%
                            out.println("<option value='CEDULA' selected> CEDULA </option>");
                            out.println("<option value='RUC' selected> RUC </option>");
                            out.println("<option value='PASAPORTE' selected> PASAPORTE </option>"); 
                        %>
                        </select> 
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
                
                $idProveedor=document.getElementById("a"+data.toString()).innerHTML;
                $identificacionProveedor=document.getElementById("b"+data.toString()).innerHTML;
                $nombreProveedor=document.getElementById("c"+data.toString()).innerHTML;
                $direccionProveedor=document.getElementById("d"+data.toString()).innerHTML;
                $telefonoProveedor=document.getElementById("e"+data.toString()).innerHTML;
                $autorizacionProveedor=document.getElementById("f"+data.toString()).innerHTML;
                $fechaCaducidadAutorizacionProveedor=document.getElementById("g"+data.toString()).innerHTML;
                $tipoProveedor=document.getElementById("a"+data.toString()).innerHTML;
                
                document.modificarform.idProveedor.value=$idProveedor;
                document.modificarform.identificacionProveedor.value=$identificacionProveedor;
                document.modificarform.nombreProveedor.value=$nombreProveedor;
                document.modificarform.direccionProveedor.value=$direccionProveedor;
                document.modificarform.telefonoProveedor.value=$telefonoProveedor;
                document.modificarform.autorizacionProveedor.value=$autorizacionProveedor;
                document.modificarform.fechaCaducidadAutorizacionProveedor.value=$fechaCaducidadAutorizacionProveedor;
                document.modificarform.tipoProveedor.value=$tipoProveedor;
                
            });
        });        
    </script>                        
    </body>
</html>
