<%-- 
    Document   : LibroMayor
    Created on : 14/07/2014, 07:22:22 AM
    Author     : Leitos
--%>

<%@page import="DAO.TransaccionDAO"%>
<%@page import="DAO.CuentaDAO"%>
<%@page import="Clases.CuentaClass"%>
<%@page import="Clases.TransaccionClass"%>
<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libro Mayor</title>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
        <script type="text/javascript" src="JS/ValidarJS.js"></script>
    </head>
    <body>
        <h1>Libro Mayor</h1>
        <%                
            java.util.Date fecha = new Date();
            String anio=Integer.toString(fecha.getYear());
            String mes=Integer.toString(fecha.getMonth());
            String dia=Integer.toString(fecha.getDay());
            String fech= "1";
         %>
         <center>
            <table id="miTabla">
            <tr >
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
  
      
      <a class='modalbox' href='#ingresar'><img SRC="Imagen/LibroDiario.png" width="50" height="50"></a>
      
      <div id="ingresar">
	<h2>Libro Mayor</h2>
	<form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet1" method="post" >
            
            <% 
                LinkedList<AsientoClass> listaAsi =new LinkedList<AsientoClass>();
                LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
                LinkedList<CuentaClass> listaCue =new LinkedList<CuentaClass>();
                CuentaDAO cue=new CuentaDAO();
                listaCue=cue.consultar();
                TransaccionDAO tra=new TransaccionDAO();
                listaTra=tra.consultar();
                
                for(int i=0;i<listaCue.size();i++){
                    CuentaClass c= new CuentaClass();
                    c=listaCue.get(i);
                    LinkedList<TransaccionClass> aux =new LinkedList<TransaccionClass>();
                    String nombre="";
                    double td=0;
                    double th=0;
                    for(int j=0;j<listaTra.size();j++){
                        if(listaTra.get(j).getCuenta_idCuenta().equals(c.getIdCuenta())){
                            aux.add(listaTra.get(j));
                            nombre=cue.consultarNombre(c.getIdCuenta());
                        }
                    }
                    if(aux.size()>0){
                        out.println("<center><table border='1'>");
                        out.println("<tr bgcolor='gray'>");
                        out.println("<td>DEBE</td>"+"<td>"+nombre+"</td><td>HABER</td>");
                        out.println("</tr>");
                        for(int k=0;k<aux.size();k++){
                            out.println("<tr>");
                            if(aux.get(k).getHaberTransaccion().equals("0.0")){
                                out.println("<td>"+aux.get(k).getDebeTransaccion()+"</td><td></td><td>");
                                td=td+Double.parseDouble(aux.get(k).getDebeTransaccion());
                            }
                            if(aux.get(k).getDebeTransaccion().equals("0.0")){
                                out.println("<td></td><td></td><td>"+aux.get(k).getHaberTransaccion()+"</td>");
                                th=th+Double.parseDouble(aux.get(k).getHaberTransaccion());
                            }
                            out.println("</tr>");
                        }
                        out.println("<tr bgcolor='gray' align='center'><td>"+td+"</td><td>TOTAL</td><td>"+th+"</td></tr>");
                        out.println("</table></center>");
                        out.println("<br>");
                        out.println("<br>");
                    }
                }
            %>
                
                
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
