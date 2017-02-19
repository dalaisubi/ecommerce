<%-- 
    Document   : loginPage
    Created on : Sep 15, 2016, 9:53:00 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function login1(){
                var sl=document.getElementById("sl");
                
                if(sl!=""){
                    document.getElementById("c").style.display="none";
                    document.getElementById("s").style.display="block";
                    }
            }
             function login2(){
                var cl=document.getElementById("cl");
                
                if(cl!=""){
                    document.getElementById("c").style.display="block";
                    document.getElementById("s").style.display="none";
                }
              
            }
          function valid(){
                var e=document.getElementById("e").value;
                var p=document.getElementById("p").value;
                
                   if(e==""){
                        document.getElementById("e").style.border="1px solid red";
               document.getElementById("sp1").innerHTML="*Enter your email first..";
               document.getElementById("sp1").style.color="red";
                return false;
                   }
                   if(e!="" && p==""){
                       document.getElementById("e").style.border="";
                       document.getElementById("sp1").innerHTML="";
                       document.getElementById("p").style.border="1px solid red";
               document.getElementById("sp2").innerHTML="*Enter your password";
               document.getElementById("sp2").style.color="red";
                return false;
                   } 
            } 
             function valid2(){
                var e=document.getElementById("e2").value;
                var p=document.getElementById("p2").value;
                
                   if(e==""){
                        document.getElementById("e2").style.border="1px solid red";
               document.getElementById("sp11").innerHTML="*Enter your email first..";
               document.getElementById("sp11").style.color="red";
                return false;
                   }
                   if(e!="" && p==""){
                       document.getElementById("e2").style.border="";
                       document.getElementById("sp11").innerHTML="";
                       document.getElementById("p2").style.border="1px solid red";
               document.getElementById("sp22").innerHTML="*Enter your password";
               document.getElementById("sp22").style.color="red";
                return false;
                   } 
            } 
            
        </script>
        <style>
           /*div{
                
                display: inline-table;
            }*/
           .submit{
               padding-left: 50px;
           }  
           .email{
               padding-left: 25px;
           }
           a:link{
           color:blue;
           text-decoration: none;
           
            }
            a:hover{
           color: blueviolet;
           font-size: larger;
           }     
           
        </style>
    </head>
    <body>
             <div>
               
                <input type="button" id="cl" value="Customer Login" onclick="return login2();">
                <input type="button" id="sl" value="Seller Login  " onclick="return login1();">
            </div> 
        <form action="customerLogin_DB.jsp" method="post">
        <div class="model" id="c" >
            <h2>Login as customer only</h2>
            
            <table>
                <tr>
                    <td>
                        <b> Email:</b>
                        <span class="email"><input  type="text" placeholder="Enter your email here" id="e" name="email" ></span>   
                        <span id="sp1"></span>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b> Password:</b>
                        <input type="password" placeholder="Enter your password" id="p" name="pass">
                        <span id="sp2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="submit">
                        <input type="submit" value="login" onclick="return valid();">
                    </td>
                </tr>
                <tr>
                    <td>
                        New user?Register <a href="customerReg.jsp">Here</a><br>
                        Forgot <a href="customerForgotPass.jsp" >password?</a>
                    </td>
                </tr>
            </table>            
        </div> 
             <% 
            session.setAttribute("tab", "customer"); %> 
                
        </form>
        <form action="sellerLogin_DB.jsp" method="post">
        <div id="s" style="display: none">
            <h2>Login as seller only</h2>
            <table>
                <tr>
                    <td>
                        <b> Email:</b>
                        <span class="email"><input  type="text" placeholder="Enter your email here" id="e2" name="email" ></span>   
                        <span id="sp11"></span>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b> Password:</b>
                        <input type="password" placeholder="Enter your password" id="p2" name="pass">
                        <span id="sp22"></span>
                    </td>
                </tr>
                <tr>
                    <td class="submit">
                        <input type="submit" value="login" onclick="return valid2();">
                    </td>
                </tr>
                <tr>
                    <td>
                        New user?Register <a href="sellerReg.jsp">Here</a><br>
                        Forgot <a href="sellerForgotPass.jsp" >password?</a>
                    </td>
                </tr>
            </table> 
            <div>  
            </div>
           </div>
             <% 
            session.setAttribute("tab", "seller"); %> 
        </form>    
    </body>
</html>
