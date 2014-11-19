<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.Order" %>

<%
    User u = new User("Teste","pass");
    if(session.getAttribute("user") != null) u = (User)session.getAttribute("user");

    String order;
    if(request.getParameter("remove") != null) {
        order = request.getParameter("remove");
        u.removeOrder(order);
        session.setAttribute("user", u);
    }
%>

<html>
    <body>
        <aside>
            <h1 align="center">Your Orders</h1>
            <%
                ArrayList<Order> orders = u.getOrders();
                if(orders.isEmpty()){
            %>
            <p> No orders made yet! </p>
            <%
                } else {
            %>
            <form action="info.jsp">
            <%
                for(Order o : orders){
            %>
                <p>
                    <%= o.showOrder() %>
                    <br>
                    <%
                        Date date = new Date();

                        if(o.getCancellationDate().compareTo(date) >= 0){
                    %>
                    Remove: <input type="submit" name="remove" value="<%= o.getConf() %>">
                    <%
                        }
                    %>
                </p>
                <br>
                <br>
            <%
                }
            %>
            </form>
            <%
              }
            %>
        </aside>
    </body>
<html>
