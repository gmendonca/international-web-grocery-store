<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>

<%
	String title = "Country";
	if(request.getParameter("title") != null){
		title = request.getParameter("title");
		session.setAttribute("title", title);
	}

	if(session.getAttribute("title") != null){
		title = (String)session.getAttribute("title");
	}
%>

<html>
	<head>
		<title><%= title %></title>
		<link rel="stylesheet" type="text/css" href="css/styles-country.css">
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
									<td width="75%">
											<h1><a href="country.jsp"><%= title %></a></h1>
									</td>
									<td width="25%">
											<a href="cart.jsp" target="iframe_a"><img src="img/cart.jpg" alt="cart" width="80" height="80"/></a>
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
						<input type="text" name="search">
						<a href="#" class="stylish">Search it</a>
					</td>
					<td width="30%">
						<%
							String name = "User";
							User u;
							if(request.getParameter("username") != null){
								name = request.getParameter("username");
								u = new User(name);
								session.setAttribute("user", u);
							}

							if(session.getAttribute("user") != null) {
								u = (User)session.getAttribute("user");
						%>
						<a href="info.jsp" class="normal" target="iframe_a">Hi, <%= u.getUserID() %></a>
						<%
							}else {
						%>

						<a href="signin.jsp" class="normal" target="iframe_a">Sign In</a>
						<span> or </span>
						<a href="signin.jsp" class="normal" target="iframe_a">Create an Account</a>
						<%
							}
						%>
					</td>
				</tr>
			</table>
		</section>
		<nav>
			<ul>
				<form action="catalog.jsp" target="iframe_a">
				<li><input type="submit" name="product" value="Phones"></li>
				<li><input type="submit" name="product" value="Tablets"></li>
				<li><input type="submit" name="product" value="Laptop"></li>
				<li><input type="submit" name="product" value="TV"></li>
				</form>
			</ul>
		</nav>

		<aside>
			<h1 align="center">Deals</h1>
			<iframe width="1000px" height="800px" margin: 0 src="welcome.jsp" name="iframe_a"></iframe>
		</aside>
	</body>
<html>
