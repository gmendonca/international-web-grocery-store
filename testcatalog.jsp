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
                String[][] prod;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   HashMap<String,String[][]> comp = me.getValue();
                   Set set2 = comp.entrySet();
                   Iterator i2 = set.iterator();
                       while(i2.hasNext()) {
                          Map.Entry me2 = (Map.Entry)i2.next();
                           String comp = (String)me2.getKey();
                        
                                       if(title.compareTo(comp) == 0){
                                       prod = (String[][])me.getValue(); 

                                            }
                         }
                 }

                 
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
