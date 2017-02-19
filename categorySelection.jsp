<%-- 
    Document   : categorySelection
    Created on : Oct 6, 2016, 11:40:23 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
             function cat(){
                var aprl=document.getElementById("apparel").value;
               
                
                if(aprl!=="" /*&& shoe===""*/){
                       document.getElementById("apparel").style.display="block";
                       document.getElementById("shoe").style.display="none";
                }
            }
            function cat1(){
                 var shoe=document.getElementById("shoe").value;
                if(shoe!==""){
                    document.getElementById("apparel").style.display="none";
                    document.getElementById("shoe").style.display="block";
                }
            }
        </script>
    </head>
    <body>
        <form action="categorySelection_DB.jsp" method="post">
        <h2>Choose One You Want</h2>
         <table>
            <tr>
                <td>
        <input type="radio" name="category" value="apparel" onchange="return cat();"> Apparel: 
         <input type="radio" name="category" value="Shoe" onchange="return cat1();"> Shoe:
                </td>
            </tr>
        </table>
            <div id="apparel" style="display: none">
                <input type="radio" name="apparel" value="topWear"> Top Wear <br>
                <input type="radio" name="apparel" value="bottomWear"> Bottom Wear<br>
                <input type="radio" name="apparel" value="others"> Others Accessories
            </div>
            <div id="shoe" style="display: none">
                <input type="radio" name="apparel" value="sports"> Sports Shoes<br>
                <input type="radio" name="apparel" value="formal"> Formal Shoes<br>
                <input type="radio" name="apparel" value="casual"> Casual Shoes
            </div>
     
            <input type="submit" value="Submit">
    </form>
    </body>
</html>
