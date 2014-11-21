<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>

<%
	String title = (String)session.getAttribute("title");
	User u = null;
%>
<html>
	<body>
		<aside>
			<%
				String username = "User";
				if(request.getParameter("username") != null) {
					username = request.getParameter("username");
			%>
			<h1 align="center">The password is wrong:</h1>
			<form action="country.jsp?title=<%= title %>" target="_parent" align="center">
    		Username: <input type="text" name="username" value="<%= username %>"><br>
    		Password: <input type="password" name="password"><br>
    		<input id="buybutton" type="submit" VALUE="OK">
   			</form>
			<%
				} else {
			%>
			<h1 align="center">Sign in or Create an User</h1>
			<form action="country.jsp?title=<%= title %>" target="_parent" align="center">
			Username: <input type="text" name="username"><br>
			Password: <input type="password" name="password"><br>
			<input id="buybutton" type="submit" VALUE="OK">
			</form>
			<%
				}
			%>
		</aside>
	</body>
<html>
