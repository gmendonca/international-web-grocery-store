<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.User" %>

<%
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");

%>

<html>
    <body>
        <aside>
            <form action="order.jsp">
                <h1 align="center">Checkout</h1>
                First name: <input type="text" name="firstname"><br>
                Last name: <input type="text" name="lastname"><br>

                Address Line 1: <input type="text" name="address1"><br>
                Address Line 2: <input type="text" name="address2"><br>
                City: <input type="text" name="city"><br>
                State: <input type="text" name="state"><br>
                Zip Code: <input type="text" name="zipcode"><br>
                Country: <input type="text" name="country"><br>

                Credit Card: <input type="text" name="creditcard"><br>
                Name Printed: <input type="text" name="nameprinted"><br>
                Expiration Date: <input type="text" name="expiration"><br>
                CVC: <input type="text" name="cvc"><br>
                <br>
                <input type="submit" value="Confirm">
            </form>
        </aside>
    </body>
<html>
