<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>

<%
    Map<String, String> catalogList = new HashMap<String, String>();
    catalogList.put("Droid MAXX", "Phones");
    catalogList.put("Moto X", "Phones");
    catalogList.put("iPhone 5S", "Phones");
    catalogList.put("iPhone 5C", "Phones");
    catalogList.put("Galaxy S3", "Phones");
    catalogList.put("Galaxy S4", "Phones");

    catalogList.put("Kindle", "Tablets");
    catalogList.put("Nexus", "Tablets");
    catalogList.put("Surface", "Tablets");
    catalogList.put("Galaxy", "Tablets");
    catalogList.put("iPad", "Tablets");

    catalogList.put("MacBook", "Laptop");
    catalogList.put("Asus", "Laptop");
    catalogList.put("Sony", "Laptop");
    catalogList.put("Lenovo", "Laptop");

    catalogList.put("Panasonic", "TV");
    catalogList.put("Samsung", "TV");
    catalogList.put("Sony", "TV");

    request.setAttribute("catalogList", catalogList);

    String title = request.getParameter("product");

%>

<jsp:useBean id="entry" class="beans.StringBean" />
<jsp:setProperty
    name="entry"
    property="product"
    value='<%= request.getParameter("product") %>'/>

<html>
    <head>
    </head>
    <body>
        <aside>
            <form action="cart.jsp">
            <%
                Set set = catalogList.entrySet();
                Iterator i = set.iterator();
                String prod;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   String comp = (String)me.getValue();
                   if(title.compareTo(comp) == 0){
                       prod = (String)me.getKey();
            %>
                    <p>Buy: <input type="submit" name="product" value="<%= prod %>"></p>
            <%
                    }
                }
            %>
            </form>
        </aside>
    </body>
<html>
