<%-- 
    Document   : sellerReg
    Created on : Sep 22, 2016, 2:39:27 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="sellerReg_DB.jsp" method="post">
            <table>
                <tr>
                    <td>
                        <b>Seller Name:</b>
                        <input type="text" name="name" placeholder="Enter your name">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Email:</b>
                        <input type="email" placeholder="Enter your email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Password:</b>
                        <input type="password" placeholder="Enter your password" name="pass">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Company Name:</b>
                        <input type="text" placeholder="Company name" name="compName">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Company ID:</b>
                        <input type="text" placeholder="Enter your Comp ID" name="compID">
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Company Address:</b>
                        <textarea name="compAdd" placeholder="Enter your address"></textarea>
                    </td>             
                <tr>
                    <td>
                        <b>Contact No:</b>
                        <input type="number" name="contact">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Next">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
