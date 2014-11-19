<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>
<%@ page import="beans.Order" %>
<%@ page import="beans.User" %>
<%@ page import="beans.Clients" %>

<%
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    Order o = new Order();
    o.setFirst(request.getParameter("firstname"));
    o.setLast(request.getParameter("lastname"));
    o.setAddress(request.getParameter("address1") + " - " +request.getParameter("address2") + ", " + request.getParameter("city") + " - " + request.getParameter("state") + ", " + request.getParameter("country") + ", " + request.getParameter("zipcode"));
    o.setCard(request.getParameter("creditcard"));
    o.setName(request.getParameter("nameprinted"));
    o.setDate(request.getParameter("expiration"));
    o.setCvc(request.getParameter("cvc"));
    o.setProducts(c.getProducts());
    User u = new User("Guest","pass");
    if(session.getAttribute("user") != null) u = (User)session.getAttribute("user");

%>

<html>
    <body>
        <aside>
            <% Date date = new Date(); %>
            <h1 align="center">Confirmation Page</h1>
            <h3><%= u.getUserID() %>, thank you for you purchase on <%= date %>!</h3>
            <%
                o.setPurchaseDate(date);
                String orderstring = o.toString();
            %>
            <p><%= orderstring %>
            <%
                Set set = c.getProducts().entrySet();
                Iterator i = set.iterator();
                String prod;
                Integer count;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   prod = (String)me.getKey();
                   count = (Integer)me.getValue();
            %>
                    <br>* <%= prod %> - <%= count %>
            <%
                    }

                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DAY_OF_MONTH, 14);
                date = calendar.getTime();
                o.setDeliveryDate(date);
                SimpleDateFormat s = new SimpleDateFormat("MM/dd/yy");
            %>
                    <br><br>Delivery Date: <%= s.format(date) %>
            </p>
            <%
                int days = 5;
                for(int j = 0; j < days;){
                   calendar.add(Calendar.DAY_OF_MONTH, -1);
                   if(calendar.get(Calendar.DAY_OF_WEEK) <= 6 && calendar.get(Calendar.DAY_OF_WEEK) >= 2)
                      j++;
                }
                date = calendar.getTime();
                o.setCancellationDate(date);
            %>
            <form action="welcome.jsp">
                <input type="submit" value="OK">
            </form>
            <%
                c = new Cart();
                session.setAttribute("cart", c);
            %>
        </aside>
    </body>
<%
    u.setOrder(o);
    Clients clients = new Clients();
    clients.setNewClient(u);
    session.setAttribute("user", u);
    clients.serializeThis();
%>
<html>
