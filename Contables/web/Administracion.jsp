<%-- 
    Document   : Factura
    Created on : Jul 11, 2014, 8:17:43 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <script type="text/javascript">

	$(document).ready(function() {
		$(".modalbox").fancybox();
	});
      </script>
         <style>
            frameset{
                background:#EEEEEE;
            }
        </style>        
    </head>
  
        <frameset cols="20%,80%" border="0" frameborder="0"  framespacing="0">
        <FRAME src="MenuAdministracion.jsp" name="menuadministracion">
        <FRAME name="contenidoadministracion">
        </frameset>     
</html>
