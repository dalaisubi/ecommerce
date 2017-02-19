<%-- 
    Document   : makePayment
    Created on : Nov 12, 2016, 4:17:52 AM
    Author     : subi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function cod(){
                var cod=document.getElementById("cod").value;
                if(cod!==""){
                    document.  
                }   
            }
      
        </script>
    </head>
    <body>
        <div>               
            <a href="CoD_DB.jsp">  <input type="button" id="cod" value="Cash on Delivery" onclick="return login2();"></a>
                <input type="button" id="on" value="Online Payment" onclick="return login1();">
        </div>
        <form action="onPayment_DB.jsp" method="post">
        <div>
            <h2>Pay using Debit Card</h2>
            
            <b>Card Number</b>  <input type="number" placeholder="Card Number" name="card_no"><br>
            <b>Expiry Date</b>  <select name="mm">
                <option>MM</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                
            </select>
            <select name="yy">
                <option>YY</option>
                <option>16</option>
                <option>17</option>
                <option>18</option>
                <option>19</option>
                <option>20</option>
                <option>21</option>
                <option>22</option>
                <option>23</option>
                <option>24</option>
                
            </select>
            CVV &nbsp;<input type="number" placeholder="CVV" name="cvv">
        </div>
        <input type="submit"  value="PAY">
        <h5>TrustPay: 100% Payment Protection, Easy Returns Policy</h5>
        </form>
         
        
    </body>
</html>
