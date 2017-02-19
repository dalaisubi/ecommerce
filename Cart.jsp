<%-- 
    Document   : Cart
    Created on : Oct 27, 2016, 2:45:11 AM
    Author     : subi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                   //  String h=(String)session.getAttribute("abc");
                
                    String fl;
                    ResultSet rs;
                    try
                      {
                           Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                        String email=(String)session.getAttribute("key");
                        PreparedStatement ps= con.prepareStatement("select * from cart inner join file2 on cart.ID=file2.ID where cus_email=?");
                        ps.setString(1, email);
                        rs=ps.executeQuery();
                        while(rs.next())
                        {
                           
                            String image= rs.getString("ITEMNAME");
                             
                %>
        <center> 
                        
                <!-- <h1> 
                    <b>
                        <u> <input type="text" name="Brand" value="<!--%= rs.getString(2) %>" ></u>
                
                    </b>
                </h1>-->
                <form action="remove.jsp" method="post">
                
                <table align="center" border="1" bgcolor="E8B3B3"> 
                <TR>
                    <td>
                         <img src="file//<%=rs.getString("ITEMNAME")%>"  width="117" height="100" id="img_car">
                        
                    </td>
                   
                </TR>
                <tr> 
                    <td>
                      
                <center>
                  
                   
                    <%= rs.getString("BRAND") %> &nbsp; 
                    <%= rs.getString("PRONAME") %>  <br>
                    <%= rs.getString("MODELNO") %> <br> 
                  <input type="text" name="ID" value="<%=rs.getString("ID")%>" style="display: none">
                  <input type="submit" value="Remove">
                  &nbsp;<a href="paymentDetails.jsp?info1=<%= rs.getString("ID")%>&info2=<%= rs.getString("ID")%>">Buy Now</a>
                  
                                          
                                          
                </center>
                <% }
                     

                      }
                    catch(Exception e)
                        {
                            out.print(""+e.getMessage());
                        }
                %>
                        
                    </td>
                </tr>
               
                </table>  
              
                </form>  
                    
    </center>
    </body>
</html>
