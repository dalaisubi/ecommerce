<%-- 
    Document   : makePayment_DB
    Created on : Nov 14, 2016, 12:09:25 AM
    Author     : subi
--%>

<%@page import="java.sql.ResultSet"%>
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
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");  
           String email=(String)session.getAttribute("key"); 
           //String email="ss@gmail.com";
           String card_no=request.getParameter("card_no");
           String mm=card_no.concat(request.getParameter("mm"));
           String yy=mm.concat(request.getParameter("yy"));
            
           String ProID="";
           PreparedStatement ps=con.prepareStatement("select * from CART where CUS_EMAIL=?");
           ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
                        {
                             ProID=ProID.concat(rs.getString(2));
                        }
            response.sendRedirect("");
                            %>
                            
                            <input type="text" value="<%=ProID %>" style="display: none" > 
                            
                            
         <% 
             PreparedStatement ps2=con.prepareStatement("insert into DELIVERY values(seq_DELIVERY.nextval,?,?,?)");
             ps2.setString(1, email);
             ps2.setString(2,yy);
             ps2.setString(3, ProID);
             
             int i=ps2.executeUpdate();
             if(i>0){
                 response.sendRedirect("");
             }
           } 
           catch(Exception e){
               out.print(e);
           }
        %>
       
    </body>
</html>
