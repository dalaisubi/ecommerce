   <%-- 
    Document   : insertimage
    Created on : Feb 20, 2015, 12:08:07 PM
    Author     : NIVT
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext" %>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                         try
                            {
                                String i1=request.getParameter("id");
                             //  String ID=request.getParameter("ID2");
                               
                                //String ID=(String) session.getAttribute("ID");
                                String email=(String) session.getAttribute("key");
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                                PreparedStatement ps = con.prepareStatement("insert into CART values(seq_cart.nextval,?,?)");
                                ps.setString(1, i1);
                                ps.setString(2, email);
                               
                                int i = ps.executeUpdate();
                                if(i>0)
                                {
                                   // session.setAttribute("abc", brand);
                                    response.sendRedirect("View.jsp");
                                    //out.print(i1);
                                  // out.print("hi " +ID);
                                }
                                
                            }
                        catch(Exception el)
                            {
                                out.println("Inserting error"+el.getMessage());
                            }
                   
%>
    </body>
</html>
