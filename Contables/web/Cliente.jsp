<%-- 
    Document   : Cliente
    Created on : 11/07/2014, 09:19:31 PM
    Author     : Leitos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page import = "Clases.ClienteClass"%>
<%@page import = "DAO.ClienteDAO"%>
<%@page import = "java.util.LinkedList"%> 
<%@page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
        <script type="text/javascript" src="JS/ValidarJS.js"></script>
        <script type="text/javascript" src="JS/ValidarCedulaJS.js"></script>
    </head>
    <body>
        <center>
            <table id="miTabla">
            <tr>
                <td class="estilo1">Id Cliente</td>
                <td class="estilo1">Identificación</td>
                <td class="estilo1">Nombre</td>
                <td class="estilo1">Apellido</td>
                <td class="estilo1">Direccion</td>
                <td class="estilo1">Telefono</td>
                <td class="estilo1">Tipo</td>
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
            LinkedList<ClienteClass> lista =new LinkedList<ClienteClass>();
            
            lista = ClienteDAO.consultar();
            for (int i=0;i<lista.size();i++)
            {
               out.println("<tr data-valor='"+i+"' class='click'>" );
               
               out.println("<td id='a"+i+"'>"+lista.get(i).getIdCliente()+"</a></td>");
               out.println("<td id='b"+i+"'>"+lista.get(i).getCedula()+"</a></td>");
               out.println("<td id='c"+i+"'>"+lista.get(i).getNombre()+"</td>");
               out.println("<td id='d"+i+"'>"+lista.get(i).getApellido()+"</td>");
               out.println("<td id='e"+i+"'>"+lista.get(i).getDireccion()+"</td>");
               out.println("<td id='f"+i+"'>"+lista.get(i).getTelefono()+"</td>");
               out.println("<td id='g"+i+"'>"+lista.get(i).getTipo()+"</td>");
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
	<form id="ingresarform" name="ingresarform" action="ClienteIngresarServlet" method="post" >
            
            
            <label for="Cedula">Identificación Cliente  </label>
		<input align='right' type="text" id="cedulax" name="cedulax" class="txtingresar" required="required" onkeydown="return cedula(event);" maxlength="10">
		<br>
            
            <label for="Nombre">Nombre Cliente  </label>
		<input align='right' type="Nombre" id="nombre" name="nombre" class="txtingresar" required="required">
		<br>
	    
            <label for="Apellido">Apellido Cliente  </label>
		<input align='right' type="Apellido" id="apellido" name="apellido" class="txtingresar" required="required">
		<br>
            
            <label for="Direccion">Dirección Cliente  </label>
		<input align='right' type="Direccion" id="stockProducto" name="direccion" class="txtingresar" required="required" >
		<br>
            
            <label for="Telefono">Telefono Cliente  </label>
		<input align='right' type="Telefono" id="telefono" name="telefono" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Tipo">Tipo Cliente</label>
                <select id="tipox" name="tipox" class="combo">  
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
	<form id="modificarform" name="modificarform" action="ClienteModificarServlet" method="post">
            
            <label for="IdCliente">Id Cliente  </label>
            <input align='right' type="text" id="idCliente" name="idCliente" class="txtingresar" required="required" readonly="readonly">
		<br>
            <label for="Cedula">Identificación Cliente  </label>
		<input align='right' type="text" id="cedula" name="cedula" class="txtingresar" required="required" readonly="readonly" >
		<br>
            
            <label for="Nombre">Nombre Cliente  </label>
		<input align='right' type="text" id="nombre" name="nombre" class="txtingresar" required="required">
		<br>
	    
            <label for="Apellido">Apellido Cliente  </label>
		<input align='right' type="text" id="apellido" name="apellido" class="txtingresar" required="required">
		<br>
            
            <label for="Direccion">Dirección Cliente  </label>
		<input align='right' type="text" id="stockProducto" name="direccion" class="txtingresar" required="required" >
		<br>
            
            <label for="Telefono">Telefono Cliente  </label>
		<input align='right' type="text" id="telefono" name="telefono" class="txtingresar" required="required" onkeypress="return Numeros(event)">
		<br>
            
            <label for="Tipo">Tipo Cliente</label>
                <select name="tipo" class="combo">  
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
                
                $idCliente=document.getElementById("a"+data.toString()).innerHTML;
                $cedula=document.getElementById("b"+data.toString()).innerHTML;
                $nombre=document.getElementById("c"+data.toString()).innerHTML;
                $apellido=document.getElementById("d"+data.toString()).innerHTML;
                $direccion=document.getElementById("e"+data.toString()).innerHTML;
                $telefono=document.getElementById("f"+data.toString()).innerHTML;
                $tipo=document.getElementById("g"+data.toString()).innerHTML;
                
                document.modificarform.idCliente.value=$idCliente;
                document.modificarform.cedula.value=$cedula;
                document.modificarform.nombre.value=$nombre;
                document.modificarform.apellido.value=$apellido;
                document.modificarform.direccion.value=$direccion;
                document.modificarform.telefono.value=$telefono;
                document.modificarform.tipo.value=$tipo;
                
            });
        });   
        
        function cedula(e) {
             tecla = (document.all) ? e.keyCode : e.which;
            if (tecla==8) return true; 
            patron =/^[0-9]*[.]?[0-9]*$/; 
            te = String.fromCharCode(tecla);
                var textBox = document.getElementById("cedulax");
                var textLength = textBox.value.length;
                if(textLength==10){
                a(textBox.value);                     
                }
            return patron.test(te);
        }
        
    function a(c){
        var cedula = c;
 
     //Preguntamos si la cedula consta de 10 digitos
     if(cedula.length == 10){
        
        //Obtenemos el digito de la region que sonlos dos primeros digitos
        var digito_region = cedula.substring(0,2);
        
        //Pregunto si la region existe ecuador se divide en 24 regiones
        if( digito_region >= 1 && digito_region <=24 ){
          
          // Extraigo el ultimo digito
          var ultimo_digito   = cedula.substring(9,10);
 
          //Agrupo todos los pares y los sumo
          var pares = parseInt(cedula.substring(1,2)) + parseInt(cedula.substring(3,4)) + parseInt(cedula.substring(5,6)) + parseInt(cedula.substring(7,8));
 
          //Agrupo los impares, los multiplico por un factor de 2, si la resultante es > que 9 le restamos el 9 a la resultante
          var numero1 = cedula.substring(0,1);
          var numero1 = (numero1 * 2);
          if( numero1 > 9 ){ var numero1 = (numero1 - 9); }
 
          var numero3 = cedula.substring(2,3);
          var numero3 = (numero3 * 2);
          if( numero3 > 9 ){ var numero3 = (numero3 - 9); }
 
          var numero5 = cedula.substring(4,5);
          var numero5 = (numero5 * 2);
          if( numero5 > 9 ){ var numero5 = (numero5 - 9); }
 
          var numero7 = cedula.substring(6,7);
          var numero7 = (numero7 * 2);
          if( numero7 > 9 ){ var numero7 = (numero7 - 9); }
 
          var numero9 = cedula.substring(8,9);
          var numero9 = (numero9 * 2);
          if( numero9 > 9 ){ var numero9 = (numero9 - 9); }
 
          var impares = numero1 + numero3 + numero5 + numero7 + numero9;
 
          //Suma total
          var suma_total = (pares + impares);
 
          //extraemos el primero digito
          var primer_digito_suma = String(suma_total).substring(0,1);
 
          //Obtenemos la decena inmediata
          var decena = (parseInt(primer_digito_suma) + 1)  * 10;
 
          //Obtenemos la resta de la decena inmediata - la suma_total esto nos da el digito validador
          var digito_validador = decena - suma_total;
 
          //Si el digito validador es = a 10 toma el valor de 0
          if(digito_validador == 10)
            var digito_validador = 0;
 
          //Validamos que el digito validador sea igual al de la cedula
          if(digito_validador == ultimo_digito){
              document.ingresarform.nombre.focus();
              document.getElementById("tipox").value="CEDULA";
          }else{
            alert('Cedula incorrecta');
            document.getElementById("cedulax").value="";
          }
          
        }else{
          // imprimimos en consola si la region no pertenece
          alert('Cedula incorrecta');
        }
     }else{
        //imprimimos en consola si la cedula tiene mas o menos de 10 digitos
        alert('Cedula incorrecta');
     }    
 
}

    </script>          
                
    </body>
</html>
