<%-- 
    Document   : remove
    Created on : Oct 27, 2016, 1:06:11 PM
    Author     : subi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
          String email=(String)session.getAttribute("key");
          
            String ID=request.getParameter("ID");
            PreparedStatement ps=con.prepareStatement("delete from  cart  where cus_email=? and ID=?");
        
            ps.setString(1, email);
            ps.setString(2, ID);
            int i =ps.executeUpdate();
            if(i>0){
                
                //out.println("delete successfull");
                response.sendRedirect("Cart.jsp");
            }
          

            }
            
catch (Exception e){
        
        out.println(e);
        }
            %>
    </body>
</html>
