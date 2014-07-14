<%-- 
    Document   : FacturaVenta
    Created on : Jul 11, 2014, 8:54:09 PM
    Author     : User
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import = "Clases.FacturaCompraClass"%> 
<%@ page import = "DAO.FacturaCompraDAO"%> 
<%@ page import = "Clases.ProveedorClass"%> 
<%@ page import = "DAO.ProveedorDAO"%> 
<%@ page import = "java.util.LinkedList"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="JS/ValidarJS.js"></script>   
<title>Facturación</title>
                                       
</head>


     <center>                                       
         <frameset rows="25%,20%,80%" border="0" frameborder="0" y framespacing="0">
                <frame src="FacturaCompraCabecera.jsp">
                <frame src="FacturaCompraProveedor.jsp">             
                <frame src="FacturaCompraProductos.jsp">
                <!frame src="FacturaVentaGuardar.jsp">
         </frameset>        

    </center>

</html>
