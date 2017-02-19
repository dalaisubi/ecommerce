<%-- 
    Document   : forgotPass
    Created on : Sep 22, 2016, 2:47:49 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function match(){
                var e=document.getElementById("e").value;
                var n=document.getElementById("new").value;
                var con=document.getElementById("confirm").value;
                
                if(e===""){
                    document.getElementById("e").style.border="1px solid red";
                    document.getElementById("sp1").innerHTML="*Enter your email first";
                    document.getElementById("sp1").style.color="red";
                    return false;
                }
                if(e!=="" && n===""){
                    document.getElementById("sp1").innerHTML="";
                    document.getElementById("e").style.border="";
                    document.getElementById("new").style.border="1px solid red";
                    document.getElementById("sp2").innerHTML="*Enter password";
                    document.getElementById("sp2").style.color="red";
                    return false;                    
                }
                if(e!=="" && n!=="" && con===""){
                    document.getElementById("sp1").innerHTML="";
                    document.getElementById("e").style.border="";
                     document.getElementById("sp2").innerHTML="";
                    document.getElementById("new").style.border="";
                    document.getElementById("confirm").style.border="1px solid red";
                    document.getElementById("sp3").innerHTML="*Re-enter password";
                    document.getElementById("sp3").style.color="red";
                    return false;                    
                }
                if(n!==con){
                    confirm("Please enter correct password");
                    return false;
                }
                
                return true;
            }
        </script>
    </head>
    <body>
        <form action="CustomerForgotPass_DB.jsp" method="post">
            <table>
                <tr>
                    <td>
                        <b>Email:</b>
                        <input type="email" placeholder="Enter your email" name="email" id="e">
                         <span id="sp1"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>New Password:</b>
                        <input type="password" placeholder="Plzz enter new password" name="pass" id="new">
                         <span id="sp2"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Confirm Password:</b>
                        <input type="password" placeholder="Re-enter password" id="confirm">
                        <span id="sp3"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Change" onclick="return match();">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
