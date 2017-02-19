<%-- 
    Document   : view
    Created on : Feb 20, 2015, 12:37:03 PM
    Author     : NIVT
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Image Page</title>
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
         
        <div>
            <div>
       
        <!-- main content -->
                <%
                   //  String h=(String)session.getAttribute("abc");
                
                    String fl;
                    ResultSet rs;
                    try
                      {
                           Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                        
                        String category=request.getParameter("apparel");
                        PreparedStatement ps = con.prepareStatement("select * from FILE2 where APPAREL=?");
                         ps.setString(1, category );
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                             rs.getString(1);
                %>
               <center> 
                <!-- <h1> 
                    <b>
                        <u> <%=rs.getString(2) %> </u>
                    </b>
                </h1>-->
                <hr>
                <table align="center" border="1" bgcolor="E8B3B3"> 
                <TR>
                   
                </TR>
                <tr>
                  <td>
                       <img src="file//<%=rs.getString(1)%>" width="117" height="100" id="img_car">
                  </td>
                </tr>
                <tr>
                    <td>
                <center>
                         <%= rs.getString(2) %>
                        <%= rs.getString(3) %> <br>
                        <%= rs.getString(4) %><br>
                </center>
                    </td>
                </tr>
               
                </table>
                   
                       
                        <a href="#">Buy Now</a>
                    
    </center>
                
                <%
                        }
                      }
                    catch(Exception e)
                        {
                            out.print(""+e.getMessage());
                        }
                %>
            </div>
        </div>
        
    </body>
</html>
