<%-- 
    Document   : Logout
    Created on : 02/07/2014, 07:18:10 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <style type="text/css">
        
        body {margin:0; padding:0; background:#fff;}
        #slidebox {position:relative; border:0px solid #ccc; margin:0px auto;overflow:hidden;}
        #slidebox, #slidebox ul {width:900px;height:100px;}
        #slidebox, #slidebox ul li {width:900px;height:100px;}
        #slidebox ul li {position:relative; left:0; background:#eee; float:left;list-style: none; padding:15px 28px;  font-family:Verdana, Geneva, sans-serif; font-size:13px;}
        #slidebox .next, #slidebox .previous {position:absolute; z-index:2; display:block; width:21px; height:21px;top:139px;}
        #slidebox .next {margin-right:10px; background:url(Imagen/1.png)no-repeat left top;}
        #slidebox .next:hover {background:url(Imagen/2.png)no-repeat left top;}
        #slidebox .previous{margin-left:10px; background:url(Imagen/3.png)no-repeat left top;}
        #slidebox .previous:hover {background:url(Imagen/4.png)no-repeat left top;}
        #slidebox .thumbs {position:absolute; z-index:2; bottom:10px; right:10px;}
        #slidebox .thumbs a {display:block; margin-left:5px; float:left; font-family:Verdana, Geneva, sans-serif; font-size:9px; text-decoration:none; padding:2px 4px; background:url(slidebox_thumb.png); color:#fff;}
        #slidebox .thumbs a:hover {background:#fff; color:#000;}
        #slidebox .thumbs .thumbActive {background:#fff; color:#000; display:block; margin-left:5px; float:left; font-family:Verdana, Geneva, sans-serif; font-size:9px; text-decoration:none; padding:2px 4px;}
        
        </style>

        <script src="JS/jquery-1.5.2.min.js" type="text/javascript"></script>
        <script src="JS/jcarousellite_1.0.1c5.js" type="text/javascript"></script>
        <script type="text/javascript">

        $(function() {
                $("#slidebox").jCarouselLite({
                        vertical: false,
                        hoverPause:true,
                        btnPrev: ".previous",
                        btnNext: ".next",
                        visible: 1,
                        start: 0,
                        scroll: 1,
                        circular: true,
                        auto:1000,
                        speed:500,				
                        btnGo:
                            [".1", ".2",
                            ".3", ".4"],

                        afterEnd: function(a, to, btnGo) {
                                        if(btnGo.length <= to){
                                                to = 0;
                                        }
                                        $(".thumbActive").removeClass("thumbActive");
                                        $(btnGo[to]).addClass("thumbActive");
                            }
                });
        });
        </script>
            </head>
   <body> 
        <div id="slidebox">
        <div class="next"></div>
        <div class="previous"></div>
        <div class="thumbs">
        <a href="#" onClick="" class="1 thumbActive">1</a> 
        <a href="#" onClick="" class="2">2</a> 
        <a href="#" onClick="" class="3 ">3</a> 
        <a href="#" onClick="" class="4">4</a> 
        </div>
                <ul>
                <li>content 1</li>
                <li>content 2</li>
                <li>content 3</li>
                <li>content 4</li>
                </ul>
        </div>
    </body>
</html>
