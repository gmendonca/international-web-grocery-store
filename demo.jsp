<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="beans.ProductData" %>
<%@ page import= "beans.MainCatalog"%>
<html>
<head></head>
<%
MainCatalog mc;
 HashMap<String,ProductData> map = new HashMap<String,ProductData>();
mc.makecatalog();
map = mc.showcatalog();
 // Get a set of the entries
      Set set = map.entrySet();
      // Get an iterator
      Iterator i = set.iterator();
      // Display elements
      while(i.hasNext()) {
         Map.Entry me = (Map.Entry)i.next();
         out.println(me.getKey() + ": ");
         out.println(me.getValue());

      }

%>

</html>