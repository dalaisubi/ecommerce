<%-- 
    Document   : login_DB
    Created on : Sep 22, 2016, 11:13:03 AM
    Author     : subi
--%>

<%@page import="java.sql.ResultSet"%>
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
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            PreparedStatement ps=con.prepareStatement("select * from CUSTOMER  where emailid=? and pass=?");
            
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();
           if(rs.next()){
               out.print("log in sucessfull");
              session.setAttribute("key", email);
             response.sendRedirect("view.jsp");
             
            }
            else{
                          // response.sendRedirect("loginPage.jsp");
                        }   
            }
            catch(Exception e){
                out.print(e);
            }           
         %>
    </body>
</html>
