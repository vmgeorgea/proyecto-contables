<%-- 
    Document   : Balanceresultados
    Created on : 21/07/2014, 03:18:43 AM
    Author     : Leitos
--%>
<%@page import="DAO.CuentaDAO"%>
<%@page import="Clases.CuentaClass"%>
<%@page import="DAO.TransaccionDAO"%>
<%@page import="Clases.TransaccionClass"%>
<%@page import="DAO.AsientoDAO"%>
<%@page import="Clases.AsientoClass"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance de Resultados</title>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/style.css">
        <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
        <script type="text/javascript" src="JS/ValidarJS.js"></script>
    </head>
    <body>
        <h1>Balance de Resultados</h1>
        <%  
            Date dNow = new Date();
   SimpleDateFormat ft = 
   new SimpleDateFormat ("MM/dd/yyyy");
   String currentDate = ft.format(dNow);
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
            
            <a class='modalbox' href='#ingresar'><img SRC="Imagen/LibroDiario.png" width="50" height="50"></a>
         <div id="ingresar">
	<h2>Balance General</h2>
	<form id="ingresarform" name="ingresarform" action="AsientoIngresarServlet1" method="post" >
            <center><table id="miTabla" border="1">
            
                    <tr align='center'>
                        <td class="estilo1" colspan='2'>Fecha: <% out.println(currentDate);%> </td>
                    </tr>
                    
                    <% 
                        LinkedList<TransaccionClass> listaTransaccion =new LinkedList<TransaccionClass>();
                        LinkedList<TransaccionClass> listaIngresos =new LinkedList<TransaccionClass>();
                        LinkedList<TransaccionClass> listaGastos =new LinkedList<TransaccionClass>();
                        
                        listaTransaccion=TransaccionDAO.consultar();
                        for(int i=1;i<listaTransaccion.size();i++){
                            int id=Integer.parseInt(listaTransaccion.get(i).getCuenta_idCuenta());
                            if(id > 103 && id < 118){
                                listaIngresos.add(listaTransaccion.get(i));
                            }
                            if(id > 117 && id < 171){
                                listaGastos.add(listaTransaccion.get(i));
                        }
                        }
                    %>
                    <tr>
                        <td class="estilo1"> INGRESOS OPERACIONALES </td>
                    
                          <%  
                            LinkedList<AsientoClass> listaAsi =new LinkedList<AsientoClass>();
                            //LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
                            LinkedList<CuentaClass> listaCue =new LinkedList<CuentaClass>();
                            CuentaDAO cue=new CuentaDAO();
                            listaCue=cue.consultar();
                             TransaccionDAO tra=new TransaccionDAO();
                            //listaTra=tra.consultar();
                            double totalD=0;
                            double totalH=0;
                            double saldoD=0;
                            double saldoA=0;
                            double totalIngresos=0;
                            
                            for(int i=0;i<listaCue.size();i++){
                            
                                CuentaClass c= new CuentaClass();
                                c=listaCue.get(i);
                                LinkedList<TransaccionClass> aux =new LinkedList<TransaccionClass>();
                                String nombre="";
                                String codigo="";
                                double td=0;
                                double th=0;

                                for(int j=0;j<listaIngresos.size();j++){
                                    if(listaIngresos.get(j).getCuenta_idCuenta().equals(c.getIdCuenta())){
                                        aux.add(listaIngresos.get(j));
                                        nombre=cue.consultarNombre(c.getIdCuenta());
                                        codigo=c.getNumeroCuenta();
                                    }
                                }
                                if(aux.size()>0){

                                    for(int k=0;k<aux.size();k++){

                                        if(aux.get(k).getHaberTransaccion().equals("0.0")){

                                            td=td+Double.parseDouble(aux.get(k).getDebeTransaccion());
                                        }
                                        if(aux.get(k).getDebeTransaccion().equals("0.0")){

                                            th=th+Double.parseDouble(aux.get(k).getHaberTransaccion());
                                        }

                                    }
                                    totalD=totalD+td;
                                    totalH=totalH+th;
                                    double sd=0;
                                    double sa=0;
                                    if(td>th){
                                        sd=td-th;
                                    }
                                    if(th>td){
                                        sa=th-td;
                                    }
                                    totalIngresos=totalIngresos+sd+sa;
                                    saldoD=saldoD+sd;
                                    saldoA=saldoA+sa;
                                    if(sa>0){
                                        out.println("<tr><td>"+nombre+"</td><td>"+sa+"</td></tr>");
                                    }
                                    if(sd>0){
                                        out.println("<tr><td>"+nombre+"</td><td>"+sd+"</td></tr>");
                                    }
                                    //out.println("<tr><td>"+codigo+"</td><td>"+nombre+"</td><td>"+td+"</td><td>"+th+"</td><td>"+sd+"</td><td>"+sa+"</td></tr>");

                                }
                            }
                            out.println("<tr><td>TOTALE INGRESOS</td><td>"+totalIngresos+"</td></tr>");
                %>
                            
                            
                <td class="estilo1"> (-)GASTOS DE OPERACIONALES </td>
                          <%  
                            listaAsi =new LinkedList<AsientoClass>();
                            //LinkedList<TransaccionClass> listaTra =new LinkedList<TransaccionClass>();
                            listaCue =new LinkedList<CuentaClass>();
                            cue=new CuentaDAO();
                            listaCue=cue.consultar();
                            tra=new TransaccionDAO();
                            //listaTra=tra.consultar();
                            totalD=0;
                            totalH=0;
                            saldoD=0;
                            saldoA=0;
                            double totalGastos=0;
                            
                            for(int i=0;i<listaCue.size();i++){
                                CuentaClass c= new CuentaClass();
                                c=listaCue.get(i);
                                LinkedList<TransaccionClass> aux =new LinkedList<TransaccionClass>();
                                String nombre="";
                                String codigo="";
                                double td=0;
                                double th=0;

                                for(int j=0;j<listaGastos.size();j++){
                                    if(listaGastos.get(j).getCuenta_idCuenta().equals(c.getIdCuenta())){
                                        aux.add(listaGastos.get(j));
                                        nombre=cue.consultarNombre(c.getIdCuenta());
                                        codigo=c.getNumeroCuenta();
                                    }
                                }
                                if(aux.size()>0){

                                    for(int k=0;k<aux.size();k++){

                                        if(aux.get(k).getHaberTransaccion().equals("0.0")){

                                            td=td+Double.parseDouble(aux.get(k).getDebeTransaccion());
                                        }
                                        if(aux.get(k).getDebeTransaccion().equals("0.0")){

                                            th=th+Double.parseDouble(aux.get(k).getHaberTransaccion());
                                        }

                                    }
                                    totalD=totalD+td;
                                    totalH=totalH+th;
                                    double sd=0;
                                    double sa=0;
                                    if(td>th){
                                        sd=td-th;
                                    }
                                    if(th>td){
                                        sa=th-td;
                                    }
                                    totalGastos=totalGastos+sd+sa;
                                    saldoD=saldoD+sd;
                                    saldoA=saldoA+sa;
                                    if(sa>0){
                                        out.println("<tr><td>"+nombre+"</td><td>"+sa+"</td></tr>");
                                    }
                                    if(sd>0){
                                        out.println("<tr><td>"+nombre+"</td><td>"+sd+"</td></tr>");
                                    }
                                    //out.println("<tr><td>"+codigo+"</td><td>"+nombre+"</td><td>"+td+"</td><td>"+th+"</td><td>"+sd+"</td><td>"+sa+"</td></tr>");

                                }
                            }
                            out.println("<tr><td>TOTALES GASTOS</td><td>"+totalGastos+"</td></tr>");
                %>
                            
                        
                    
                    
                    <tr>   
                        <td class="estilo1" align='center'>= UTILIDAD OPERACIONAL</td>
                        <td class="estilo1" align='center'><% out.println(totalIngresos-totalGastos); %></td>       
                    </tr> 
                    <tr>  
                        <td class="estilo1" align='center'>(+/-) Otras rentas y gastos</td>
                        <td class="estilo1" align='center'> 0.0 </td>  
                    </tr>
                    <tr>   
                        <td class="estilo1" align='center'>= UTILIDAD DEL EJERCICIO</td>
                        <td class="estilo1" align='center'><% out.println(totalIngresos-totalGastos); %></td>      
                    </tr>
                        

             </table></center>   
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
