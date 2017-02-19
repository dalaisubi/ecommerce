    <%-- 
    Document   : customerReg_DB
    Created on : Sep 22, 2016, 12:36:56 PM
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
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String add=request.getParameter("add");
            String pin=request.getParameter("pin");
            String state=request.getParameter("state");
            String country=request.getParameter("country");
            String dob=request.getParameter("dob");
            String mob=request.getParameter("mob");
            
            PreparedStatement ps=con.prepareStatement("insert into CUSTOMER values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, add);
            ps.setString(5, pin);
             ps.setString(6, state); 
              ps.setString(7,country);
               ps.setString(8, dob);
               ps.setString(9, mob);
            int i=ps.executeUpdate();
            out.print("i  "+i);
            if(i>0){ 
                out.print("sucessfully insert");
              //response.sendRedirect("loginPage.jsp");
            }
         %>
    </body>
</html>
