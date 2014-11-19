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
	<head>
		<title><%= title %></title>
		<link rel="stylesheet" type="text/css" href="css/styles-country.css">
		<script type="text/javascript" src="javascript/javascript.js"></script>
	</head>
	<body>
		<header>
			<div id="header-menu-items">
				<form action="index.jsp">
					<button type="submit" class="menu-item">
					Home
					</button>
				</form>
				<form action="country.jsp">
					<button type="submit" name="title" value="Brazil" class="menu-item">
					Brazil
					</button>
					<button type="submit" name="title" value="China" class="menu-item">
					China
					</button>
					<button type="submit" name="title" value="India" class="menu-item">
					India
					</button>
				</form>
				<form action="#">
					<button type="submit" class="menu-item">
					About us
					</button>
				</form>
				<form action="#">
					<button type="submit" class="menu-item">
					Contact us
					</button>
				</form>
			</div>
		</header>
		<div id="header-title-cart">
					<table width="100%">
							<tr>
									<td>
											<h1><a href="country.jsp"><%= title %></a></h1>
									</td>
							</tr>
					</table>
		</div>
		<section>
			<table width="100%">
				<tr height="40px">
					<td width="40%">
						<ul>
							<li><a href="country.jsp" class="stylish">Home</a></li>
							<li><a href="#" class="stylish">Weekly Deals</a></li>
							<li><a href="#" class="stylish">Contact</a></li>
							<li><a href="#" class="stylish">About us</a></li>
						</ul>
					</td>
					<td width="30%">
						<form name="autofillform" action="autocomplete">
						<table border="0" cellpadding="5">
							<tbody>
							<tr>
								<td><strong>Search:</strong></td>
											<td>
												<input type="text" size="40"
												id="complete-field" autocomplete="off"
												onkeyup="doCompletion()">
											</td>
							</tr>
							<tr>
								<td id="auto-row" colspan="2">
									<table id="complete-table" class="popupBox"></table>
								</td>
							</tr>
							</tbody>
						</table>
						</form>
					</td>
					<td width="30%">
						<a href="signin.jsp" class="normal">Sign In</a>
						<span> or </span>
						<a href="signin.jsp" class="normal">Create an Account</a>

					</td>
				</tr>
			</table>
		</section>
		<aside>
			<%
				String username = "User";
				if(request.getParameter("username") != null) {
					username = request.getParameter("username");
			%>
			<h1 align="center">The password is wrong:</h1>
			<form action="country.jsp?title=<%= title %>" target="_parent" align="center">
    		Username: <input type="text" name="username" value="<%= username %>"><br>
    		Password: <input type="text" name="password"><br>
    		<input id="buybutton" type="submit" VALUE="OK">
   			</form>
			<%
				} else {
			%>
			<h1 align="center">Sign in or Create an User</h1>
			<form action="country.jsp?title=<%= title %>" target="_parent" align="center">
			Username: <input type="text" name="username"><br>
			Password: <input type="text" name="password"><br>
			<input id="buybutton" type="submit" VALUE="OK">
			</form>
			<%
				}
			%>
		</aside>
	</body>
<html>
