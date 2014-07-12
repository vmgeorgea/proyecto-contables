<%-- 
    Document   : FacturaVentaProductos
    Created on : Jul 12, 2014, 9:07:30 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <div>
                    Productos
                    <table>

                            <tr>
                                    <td>Producto:</td>
                                    <td><input type="text" id="idproducto" name="idproducto" readonly="readonly"></td>
                                    <td><input type="text" id="nombreproducto" name="nombreproducto" readonly="readonly" ></td>
                                    <td><input type="button" value="Buscar producto" onclick="buscarproducto();"> 
                                    </td>
                            </tr>
                            <tr>
                                    <td>Cantidad:</td>
                                    <td><input type="text" id="txtxcantidad" name="txtxcantidad" maxlength="5" onkeypress="javascript:return solonumbers(event);"></td>
                                    <td>Precio:</td>
                                    <td><input type="text" id="txtprecio" name="txtprecio" readonly="readonly"></td>
                            </tr>
                            <tr>
                                    <td><input type="submit" value="Agregar" onclick="return detalle();"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>
                    </table>
            </div>
            <div>
                    <table id="gradient-style" summary="Meeting Results">
                    <thead>
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Precio</th>
                    </tr>
            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.model.detalle}" var="prod" varStatus="i">
                    <tr>
                            <td width="100">${prod.codProducto}</td>
                            <td>${prod.producto}</td>
                            <td>${prod.qtCantidad}</td>
                            <td>${prod.precio}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                    </table>
            </div>
        <tr>
        <td colspan=4><input type="submit" value="Grabar" onclick="return grabar();">
        <input type="hidden" id="Hiddenaccion" name="Hiddenaccion" value="<%=request.getAttribute("accion")%>"></td>
        </tr>   
    </center>
    </body>
</html>
