<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.User" %>

<%
    String title = (String)session.getAttribute("title");
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    String product;
    if(request.getParameter("product") != null) {
        product = request.getParameter("product");
        c.setProduct(product);
        session.setAttribute("cart", c);
    }
    if(request.getParameter("remove") != null) {
        product = request.getParameter("remove");
        c.removeProduct(product);
        session.setAttribute("cart", c);
    }
%>

<html>
    <body>
        <aside>
            <h1 align="center">Cart</h1>
            <form action="country.jsp?title=<%= title %>" target="_parent" align="center">            <%
                if(c.getProducts().isEmpty()){
            %>
                <p> Your Cart is Empty! </p>
                </form>
            <%
                } else {

                Set set = c.getProducts().entrySet();
                Iterator i = set.iterator();
                String prod;
                Integer count;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   prod = (String)me.getKey();
                   count = (Integer)me.getValue();
            %>
                    <p>Remove: <input type="submit" name="remove" value="<%= prod %>"><br>
                        Quantity: <%= count %></p>
            <%
                    }
            %>
            </form>
            <form action="checkout.jsp">
                <input type="submit" value="Checkout">
            </form>
            <%
                }
            %>
        </aside>
    </body>
<html>
