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
                    String ImageFile="";
                    String brand = "";
                    String proName = "";
                    
                    String  modelNo="";
                    String category="";
                    String apparel="";
                    String itemName="";
                    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (!isMultipart)
                    {
                        
                    }
                    else
                    {
                        FileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload upload = new ServletFileUpload(factory);
                        List items = null;
                        try
                            {
                                items = upload.parseRequest(new ServletRequestContext(request));
                            }
                        catch(FileUploadException e)
                            {
                                e.getMessage();
                            }
 
                        Iterator itr = items.iterator();        
                        while (itr.hasNext())
                        {
                            FileItem item = (FileItem) itr.next();
                            if (item.isFormField())
                            {
                                String name = item.getFieldName();
                                String value = item.getString();
                                if(name.equals("ImageFile"))
                                {
                                    ImageFile=value;
                                }
                                if(name.equals("brand"))
                                {
                                    brand = value;
                                }
                                
                                if(name.equals("proName"))
                                {
                                    proName = value;    
                                }
                                 if(name.equals("modelNo"))
                                {
                                    modelNo = value;    
                                }
                                 if(name.equals("category"))
                                 {
                                     category=value;
                                 }
                                 if(name.equals("apparel"))
                                 {
                                     apparel=value;
                                 }
 
                             }
                             else
                               {
                                try
                                    {
                                        itemName = item.getName();
                                        boolean folderMade = (new File("C:\\Users\\subi\\Downloads\\Compressed\\Project\\web\\file")).mkdirs();
                                        File savedFile = new File("C:\\Users\\subi\\Downloads\\Compressed\\Project\\web\\file\\"+itemName);
                                        item.write(savedFile);
                                    }
                                catch (Exception e)
                                    {
                                        out.println("Error"+e.getMessage());
                                    }
                               }
                         }
                         try
                            {
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
                                PreparedStatement ps = con.prepareStatement("insert into FILE2 values(seq_person.nextval,?,?,?,?,?,?)");
                                ps.setString(1, itemName);
                                ps.setString(2, brand);
                                ps.setString(3, proName);
                                ps.setString(4, modelNo);
                                ps.setString(5,category );
                                ps.setString(6, apparel);
                                
                                
                                int i = ps.executeUpdate();
                                if(i>0)
                                {
                                    session.setAttribute("abc", brand);
                                    //response.sendRedirect("view.jsp");
                                   //out.print("hi");
                                }
                                else
                                {
                                    out.println("Not Successfully Inserted");
                                }
 
                            }
                        catch(Exception el)
                            {
                                out.println("Inserting error"+el.getMessage());
                            }
                     }
               }
               catch (Exception e)
               {
                    out.println(e.getMessage());
               }
%>
    </body>
</html>
