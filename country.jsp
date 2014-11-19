<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.Clients" %>
<%@ page import="beans.MainCatalog" %>
<%@ page import="beans.ProductData" %>
<%@ page import="beans.Clients" %>

<%
	String title = "Country";
	if(request.getParameter("title") != null){
		title = request.getParameter("title");
		session.setAttribute("title", title);
	}

	if(session.getAttribute("title") != null){
		title = (String)session.getAttribute("title");
	}

	Clients clients = new Clients();
	HashMap<String,User> clientsHM = null;

	String name = "User";
	String password = "pass";
	User u = null;
	if(request.getParameter("username") != null){
		name = request.getParameter("username");
		password = request.getParameter("password");
		try{
			clientsHM = clients.deserializeThis();
		}catch (Exception e){ }

		if(clientsHM == null) {
			u = new User(name, password);
		} else if(clientsHM.get(name) != null){
			u = clientsHM.get(name);
			if(u.getPassword().compareTo(password) != 0) {
				response.sendRedirect("signin.jsp?username=" + name);
			}
		} else{
			u = new User(name, password);
		}

		session.setAttribute("user", u);
	}

%>

<html>
	<head>
		<title><%= title %></title>
		<link rel="stylesheet" type="text/css" href="css/styles-country.css">
		<script type="text/javascript" src="javascript/javascript.js"></script>
	</head>
	<body onload="init()">
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
						<%
							if(session.getAttribute("user") != null) {
								u = (User)session.getAttribute("user");
						%>
						<a href="info.jsp" class="normal" target="iframe_a">Hi, <%= u.getUserID() %></a>
						<%
							}else {
						%>

						<a href="signin.jsp" class="normal">Sign In</a>
						<span> or </span>
						<a href="signin.jsp" class="normal">Create an Account</a>
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
			<%
				HashMap<String, ProductData> map = null;
				try{
					MainCatalog cata = new MainCatalog();
					cata.makecatalog();
					map = cata.showcatalog();
				} catch (Exception e){ }

				if(map != null){
				Set set = map.entrySet();
				Iterator i = set.iterator();
				ProductData prod = null;
				ArrayList uniqueValues = new ArrayList();
				while(i.hasNext()) {
					Map.Entry me = (Map.Entry)i.next();
					prod = (ProductData)me.getValue();
					if(prod.getCountry().compareTo(title) == 0){
						uniqueValues.add(prod.getCategory());
					}
				}

				for(Object pcategory : new HashSet(uniqueValues)) {
			%>
				<li><input type="submit" name="product" value="<%= (String)pcategory %>"></li>
			<%
				}
			}
			%>
				</form>
			</ul>
		</nav>

		<aside>
			<iframe src="welcome.jsp" name="iframe_a"></iframe>
		</aside>
	</body>
	<%
		if(u != null) {
			clients.setNewClient(u);
			session.setAttribute("user", u);
			clients.serializeThis();
		}
	%>
<html>
