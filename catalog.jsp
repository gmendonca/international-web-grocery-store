<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>
<%@ page import= "beans.MainCatalog"%>

<%
    HashMap<String,HashMap<String,String[][]>> catalogList;
    
    MainCatalog cl = new MainCatalog();
    cl.setHashMap();
    catalogList = cl.getHashMap();


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
