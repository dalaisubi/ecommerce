<%-- 
    Document   : payment
    Created on : Oct 6, 2016, 1:07:18 PM
    Author     : subi
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
             function Change(){
                var c=document.getElementById("c");
                
                if(c!==""){
                    
                    document.getElementById("c").style.display="block";
                    }
                }
        </script>
    </head>
    <body>
        <%
             String fl;
                     
                   
                           Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                        String info1=request.getParameter("info1");
                        String info2=request.getParameter("info2");
                        PreparedStatement ps = con.prepareStatement("select * from FILE2 where ID=?");
                         String email=(String)session.getAttribute("key");
                       //out.println("  " +email);
                        PreparedStatement ps2 = con.prepareStatement("select * from CUSTOMER where EMAILID=?");
                        ps2.setString(1,email );
 
                        
                        
                        ps.setString(1,info1 );
                      //ps.setString(2, info2);
                      ResultSet rs=ps.executeQuery();
                      ResultSet rs1=ps2.executeQuery();
                      
                        while(rs.next())
                        {
                           //  rs.getString(1);
                        
                           session.setAttribute("pro_id", info1);
        %>
                       
        <form action="makePayment.jsp" method="post">
                <!-- <h1> 
                    <b>
                        <u> <%=rs.getString(3) %> </u>
                    </b>
                </h1>-->
                <hr>
                <table > 
              
                
                <tr>
                    <td>
                
                        <b> BRAND: </b> <%= rs.getString(3) %><br>
                        <b> Product Name:</b>   <%= rs.getString(4) %> <br>
                        <b>MODELNO:</b> <%= rs.getString(5) %><br>
                        <b>Cost:</b><%=rs.getString(8)%>/-
                
                    </td>
                </tr>
               
                </table>
                
                        <%
                                       while(rs1.next())
                        {                  
                        %>
                   
             

                     <table>
                    <tr>
                        
                         <td>
                            <b> Name:</b> <%=rs1.getString(1)%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b> Address:</b> <%= rs1.getString(4) %>,
                                     <%= rs1.getString(6) %>,
                                     <%= rs1.getString(7) %> <br>
                                     <%= rs1.getString(5) %>
                                     <input type="text" value="<%=rs1.getString(4)%>, <%=rs1.getString(6)%>, <%=rs1.getString(7)%>" style="display: none">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b> Phone:</b> <%= rs1.getString(9) %>
                        </td>
                    </tr>
                   
                        <tr>
                            <td>
                                <input type="button" value="Change address" onclick="return Change();">
                            </td>
                        </tr>
                     </table>  
                        <input type="submit" value="Make Payment" >
                        
                 </form>    
    <!----------------------------------------------------------------------------------------------------------------------------->               
                <!-- Change Address -->
                <form action="changeAddr ess_DB.jsp" method="post">
                
                <table style="display: none" id="c">
                     <tr>
                    <td >
                        <b>Address:</b>
                        <textarea placeholder="Enter your address" id="ad" name="add"></textarea>
                        <span id="sp4"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>PIN:</b>
                        <input type="text" minlength="2" maxlength="6" size="2" id="pin" name="pin">
                        <span id="sp5"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>State:</b>
                        <select name="state" id="st">
                            <option>Select</option>
                            <option>West Bengal</option>
                            <option>Karnatak</option>
                            <option>Dehli</option>
                        </select>
                        <span id="sp6"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Change">
                    </td>
                </tr>
                </table>
                </form>
               
                          
                         <%
                        }
                        %>
 
                 <%
                   }  
                %>
    </body>
</html>
