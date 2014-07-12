<%-- 
    Document   : MenuFactura
    Created on : Jul 11, 2014, 8:12:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src=JS/jquery-1.3.1.min.js></script>
<script type="text/javascript" src=JS/jquery.easing.1.3.js></script>
<script type="text/javascript" src=JS/jquery.color.js></script>

<script type="text/javascript">


$(document).ready(function() {	

	//Background color, mouseover and mouseout
        
	var colorOver = '#003366';
	var colorOut = '#1f1f1f';

	//Padding, mouseover
	var padLeft = '30px';
	var padRight = '30px';
	
	//Default Padding
	var defpadLeft = $('#menu li a').css('paddingLeft');
	var defpadRight = $('#menu li a').css('paddingRight');
		
	//Animate the LI on mouse over, mouse out
	$('#menu li').click(function () {	
		//Make LI clickable
		//window.location = $(this).find('a').attr('href');
		
	}).mouseover(function (){
		
		//mouse over LI and look for A element for transition
		$(this).find('a')
		.animate( { paddingLeft: padLeft, paddingRight: padRight}, { queue:false, duration:100 } )
		.animate( { backgroundColor: colorOver }, { queue:false, duration:200 });

	}).mouseout(function () {
	
		//mouse oout LI and look for A element and discard the mouse over transition
		$(this).find('a')
		.animate( { paddingLeft: defpadLeft, paddingRight: defpadRight}, { queue:false, duration:100 } )
		.animate( { backgroundColor: colorOut }, { queue:false, duration:200 });
	});	
	
	//Scroll the menu on mouse move above the #sidebar layer
	$('#sidebar').mousemove(function(e) {

		//Sidebar Offset, Top value
		var s_top = parseInt($('#sidebar').offset().top);		
		
		//Sidebar Offset, Bottom value
		var s_bottom = parseInt($('#sidebar').height() + s_top);
	
		//Roughly calculate the height of the menu by multiply height of a single LI with the total of LIs
		var mheight = parseInt($('#menu li').height() * $('#menu li').length);
	
		//I used this coordinate and offset values for debuggin
			
		//Calculate the top value
		//This equation is not the perfect, but it 's very close	
		var top_value = Math.round(( (s_top - e.pageY) /100) * mheight / 2);
		
		//Animate the #menu by chaging the top value
		$('#menu').animate({top: top_value}, { queue:false, duration:500});
	});

	
});
	
</script>
<style>
body {
padding:0;
margin:0 20px;
background: #EEEEEE;
}

#sidebar {
height:80%;
width:100%;
overflow:hidden;
position:relative;
}	

#menu {
width:100%;
list-style:none;
padding:0;
margin:0;
top:0;
position:relative;
height:100%;
width:300px;
}

#menu li {
padding:10px 0;
text-align:left;
display:block;
cursor:hand;
cursor:pointer;
}

#menu li a {
background:url() repeat #1f1f1f;
color:#ddd;
font-family:helvetica, arial, verdana;
font-size:20px;
font-weight:900;
display:inline;
padding:20px 8px 5px 20px;
text-decoration:none;
}

#menu li span {
font-family:georgia, arial;
font-size:9px;
color:#464646;
}

</style>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="debugging_mouse_axis"></div>
        <div id="debugging_status"></div>
        <div id="sidebar">
        <ul id="menu">
        <li><a href="#"> <span> / </span></a></li>
        <li><a href="Producto.jsp" target="contenidofactura">Producto</a></li>
        <li><a href="#"> </a></li>
        <li><a href="Cliente.jsp" target="contenidofactura">Cliente</a></li>
        <li><a href="#"> </a></li>
        <li><a href="FacturaCompra.jsp" target="contenidofactura">Factura Compra</a></li>
        <li><a href="#"></a></li>
        <li><a href="Libromayor.jsp" target="contenidofactura">Factura Venta</a></li>
        <li><a href="#"> </a></li>       
        </ul>
        </div>
    </body>
</html>
