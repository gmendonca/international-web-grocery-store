<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>
<%@ page import= "beans.MainCatalog"%>
<%@ page import= "beans.ProductData"%>


<%
    HashMap<String,ProductData> catalogList;

    MainCatalog cl = new MainCatalog();
    try{
          cl.makecatalog();
    } catch(Exception e){}

    catalogList = cl.showcatalog();


    request.setAttribute("catalogList", catalogList);

    String product = null;
    ProductData prodData = null;
    if(request.getParameter("product") != null){
         product = request.getParameter("product");
    } else if(session.getAttribute("search") != null){
        prodData = (ProductData)session.getAttribute("search");
    }

%>


<html>
    <head>
    </head>
    <body>
        <aside>
            <form action="cart.jsp">
            <%
                String country = (String)session.getAttribute("title");
                Set set = catalogList.entrySet();
                Iterator i = set.iterator();
                ProductData pd;

                if(product != null) {
                    while(i.hasNext()) {
                       Map.Entry me = (Map.Entry)i.next();
                       pd = (ProductData)me.getValue();
                       if((product.compareTo(pd.getCategory())==0)&&(country.compareTo(pd.getCountry())==0)){

                        %>
                                <p>Buy: <input type="submit" name="product" value="<%= pd.getDescription()%>">&nbsp&nbsp$<%= pd.getPrice()%></p>
                        <%

                        }
                    }
                }

                if(prodData != null) {
                    %>
                            <p>Buy: <input type="submit" name="product" value="<%= prodData.getDescription()%>">&nbsp&nbsp$<%= prodData.getPrice()%></p>
                            <br>
                            <p> More <%= country %>'s <%= prodData.getCategory() %>: </p>
                    <%
                    while(i.hasNext()) {
                       Map.Entry me = (Map.Entry)i.next();
                       pd = (ProductData)me.getValue();
                       if((prodData.getCategory().compareTo(pd.getCategory())==0)
                       &&(country.compareTo(pd.getCountry())==0)
                       && (prodData.getDescription().compareTo(pd.getDescription())!=0)){

                        %>
                                <p>Buy: <input type="submit" name="product" value="<%= pd.getDescription()%>">&nbsp&nbsp$<%= pd.getPrice()%></p>
                        <%

                        }
                    }
                }
            %>
            </form>
        </aside>
    </body>
<html>
