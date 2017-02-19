<%-- 
    Document   : forgotPass_DB
    Created on : Sep 23, 2016, 4:44:14 PM
    Author     : subi
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
                     
            
            PreparedStatement ps=con.prepareStatement("update  CUSTOMER set PASS=? where EMAILID=?");           
         
            ps.setString(1, pass);
            ps.setString(2, email);
            
            int i =ps.executeUpdate();
            
            if(i>0){
                 
                out.println("Your password is changed");
                response.sendRedirect("login.jsp");
            }
            else{
                out.print("Wrong email");
            }
           }           
            
catch (Exception e){
        
        out.println(e);
        }
            %>
    </body>
</html>
