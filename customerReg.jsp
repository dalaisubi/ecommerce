<%-- 
    Document   : customerReg
    Created on : Sep 22, 2016, 1:27:07 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function valid(){
                var name=document.getElementById("name").value;
                var eml=document.getElementById("eml").value;
                 var pass=document.getElementById("pass").value;
                  var ad=document.getElementById("ad").value;
                   var pin=document.getElementById("pin").value;
                    var st=document.getElementById("st").value;
                     var con=document.getElementById("con").value;
                     var dob=document.getElementById("dob").value;
                     var mob=document.getElementById("mob").value;
                     
                
                   if(name==""){
                        document.getElementById("name").style.border="1px solid red";
               document.getElementById("sp1").innerHTML="*Enter your name first..";
               document.getElementById("sp1").style.color="red";
                return false;
                   }
                   if(name!="" && eml==""){
                       document.getElementById("name").style.border="";
                       document.getElementById("sp1").innerHTML="";
                       document.getElementById("eml").style.border="1px solid red";
               document.getElementById("sp2").innerHTML="*Enter your email";
               document.getElementById("sp2").style.color="red";
                return false;
                   } 
                   if(eml!="" && pass==""){
                       document.getElementById("eml").style.border="";
                       document.getElementById("sp2").innerHTML="";
                       document.getElementById("pass").style.border="1px solid red";
               document.getElementById("sp3").innerHTML="*Enter your password";
               document.getElementById("sp3").style.color="red";
                return false;
                   } 
                   if(pass!="" && ad==""){
                       document.getElementById("pass").style.border="";
                       document.getElementById("sp3").innerHTML="";
                       document.getElementById("ad").style.border="1px solid red";
               document.getElementById("sp4").innerHTML="*Enter your Address";
               document.getElementById("sp4").style.color="red";
                return false;
                   } 
                   if(ad!="" && pin==""){
                       document.getElementById("ad").style.border="";
                       document.getElementById("sp4").innerHTML="";
                       document.getElementById("pin").style.border="1px solid red";
               document.getElementById("sp5").innerHTML="*Enter your pin";
               document.getElementById("sp5").style.color="red";
                return false;
                   } 
                   if(pin!="" && st=="Select"){
                       document.getElementById("pin").style.border="";
                       document.getElementById("sp5").innerHTML="";
                       document.getElementById("st").style.border="1px solid red";
               document.getElementById("sp6").innerHTML="*Select State";
               document.getElementById("sp6").style.color="red";
                return false;
                   } 
                   if(st!="" && con==""){
                       document.getElementById("st").style.border="";
                       document.getElementById("sp6").innerHTML="";
                       document.getElementById("con").style.border="1px solid red";
               document.getElementById("sp7").innerHTML="*Enter your email";
               document.getElementById("sp7").style.color="red";
                return false;
                   } 
            } 
        </script>
        
    </head>
    <body>
        <form action="customerReg_DB.jsp" method="post">
            <table>
                <tr>
                    <td >
                        <b>Name:</b>
                        <input type="text" name="name" id="name" placeholder="Enter your name">
                        <span id="sp1"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>Email:</b>
                        <input type="email" placeholder="Enter your email" id="eml" name="email">
                        <span id="sp2"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>Password:</b>
                        <input type="password" id="pass" placeholder="Enter your password" name="pass">
                        <span id="sp3"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>Address:</b>
                        <textarea placeholder="Enter your address" id="ad"  name="add"></textarea>
                        <span id="sp4"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>PIN:</b>
                        <input type="text" minlength="2" maxlength="6" size="2" id="pin" name="pin" >
                        <span id="sp5"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>State:</b>
                        <select name="state" id="st">
                            <option>Select</option>
                            <option>West Bengal</option>
                            <option>Karnatak</option>
                            <option>Dehli</option>
                        </select>
                        <span id="sp6"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Country:</b>
                         <select name="country" id="con">
                            <option>India</option>
                            <option>German</option>
                            <option>Denmark</option>
                        </select>
                        <span id="sp7"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>DoB</b>
                        <input type="date" name="dob" id="dob">
                        <span id="sp8"></span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <b>Mobile No:</b>
                        <input type="number" name="mob" placeholder="10 digit mob no" id="mob">
                        <span id="sp9"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit" onlclick="return valid();">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
