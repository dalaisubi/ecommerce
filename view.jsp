<%-- 
    Document   : view
    Created on : Feb 20, 2015, 12:37:03 PM
    Author     : NIVT
--%>

<%@page import="java.beans.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Image Page</title>
         <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
        <script type="text/javascript" src="jquery-1.2.3.min.js"></script>
        <script type="text/javascript">
                $(document).ready(function(){
                    $('#img_car').width(200);
                    $('#img_car').mouseover(function()
                    {
                        $(this).css("cursor","pointer");
                        $(this).animate({width: "360px"}, 'slow');
                    });

                    $('#img_car').mouseout(function()
                    {   
                        $(this).animate({width: "200px"}, 'slow');
                    });
                });
        </script>
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
                <td>
                     <%  
                         
                           Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                        String email=(String)session.getAttribute("key");
                 PreparedStatement ps2=con.prepareStatement("SELECT COUNT(*) AS rowcount FROM cart where cus_email=?");
                 ps2.setString(1, email);
         ResultSet r = ps2.executeQuery();
        r.next();
        int count = r.getInt("rowcount");
        r.close();
       // out.println("MyTable has " + count);
                     %>
                     <span style="padding-left: 1000px" ><a href="Cart.jsp" class="btn btn-primary">Cart <span class="badge">&nbsp; <%=count%>&nbsp; </span></a></span>  
                </td>
                
              
            </tr>
            <tr>
                
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
        <div>
            <div>
       
        <!-- main content -->
                <%
                   //  String h=(String)session.getAttribute("abc");
                
                    String fl;
                    ResultSet rs;
                    try
                      {
                        PreparedStatement ps= con.prepareStatement("select * from FILE2");
                     //   ps.setString(1, h);
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                           
                            String image= rs.getString(1);
                             
                %>
               <center> 
                   <form action="CartCount.jsp" method="post">      
                <!-- <h1> 
                    <b>
                        <u> <input type="text" name="Brand" value="<!--%= rs.getString(2) %>" ></u>
                
                    </b>
                </h1>-->
                <hr>
                <table align="center" border="1" bgcolor="E8B3B3"> 
                <TR>
                    <td>
                         <img src="file//<%=rs.getString(2)%>"  width="117" height="100" id="img_car">
                        
                    </td>
                   
                </TR>
                <tr>
                    <td>
                      
                <center>
                  
                   
                  <%= rs.getString(3) %>  <input type="text" name="id" value="<%=rs.getString(1)%>" style="display:none">
                  <%= rs.getString(4) %>  <input type="text" name="proName"  value="<%= rs.getString(4) %>" style="display: none"> <br>
                  <%= rs.getString(5) %>  <input type="text" name="ModelNo" value="<%= rs.getString(5) %>" style="display: none"><br>
                                          <input type="text" name="CATEGORY" value="<%= rs.getString(6) %>" style="display: none">
                                          <input type="text" name="APPAREL" value="<%= rs.getString(7) %>" style="display: none">
                                          <input type="text" name="email" value="<%=(String)session.getAttribute("key")%>" style="display: none">
                                          
                </center>
                        
                    </td>
                </tr>
               
                </table>  
                                          <a href="paymentDetails.jsp?info1=<%= rs.getString(1)%>&info2=<%= rs.getString(3)%>">Buy Now</a>    
                <input type="submit" value="Add to cart" id="cart" onclick="return cart();">
                </form>
                    
    </center>
                
                <%
                        } 
%>
                 
                   
        <%

                      }
                    catch(Exception e)
                        {
                            out.print(""+e.getMessage());
                        }
                %>
               
            </div>
        </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
        
    </body>
</html>
