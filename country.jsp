<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.User" %>
<%@ page import="beans.Clients" %>
<%@ page import="beans.MainCatalog" %>
<%@ page import="beans.ProductData" %>
<%@ page import="beans.Clients" %>
<%@ page import="beans.Cart"%>

<%
	Cart cart = new Cart();
	if(session.getAttribute("cart") != null) cart = (Cart)session.getAttribute("cart");
    String product;
    if(request.getParameter("product") != null) {
        product = request.getParameter("product");
        cart.setProduct(product);
        session.setAttribute("cart", cart);
    }
    if(request.getParameter("remove") != null) {
        product = request.getParameter("remove");
        cart.removeProduct(product);
        session.setAttribute("cart", cart);
    }

	if(request.getParameter("logout") != null){
		session.removeAttribute("user");
		session.removeAttribute("guest");
	}

	String title = "Country";
	if(request.getParameter("title") != null){
		title = request.getParameter("title");
		session.setAttribute("title", title);
	}

	if(session.getAttribute("title") != null){
		title = (String)session.getAttribute("title");
	}
	
	MainCatalog maincatalog = new MainCatalog();

	Clients clients = new Clients();
	HashMap<String,User> clientsHM = null;
	Boolean returnUser = false;
	Boolean userLog = false;

	Integer count = 0;

	String name = "User";
	String password = "pass";
	User u = null;

	if(request.getParameter("guest") != null){
		session.setAttribute("guest", "guest");
		session.removeAttribute("user");
	} else if(session.getAttribute("user") != null){
		u = (User)session.getAttribute("user");
		userLog = true;
	} else if(request.getParameter("username") != null){
		name = request.getParameter("username").trim();
		password = request.getParameter("password").trim();
		if(name.length() == 0 || password.length() == 0){
			response.sendRedirect("country.jsp?wrong=" + name);
		}
		try{
			clientsHM = clients.deserializeThis();
		}catch (Exception e){ }

		if(clientsHM == null) {
			u = new User(name, password);
			session.setAttribute("user", u);
		} else if(clientsHM.get(name) != null){
			returnUser = true;
			u = clientsHM.get(name);
			if(u.getPassword().compareTo(password) != 0) {
				response.sendRedirect("country.jsp?wrong=" + name);
			} else {
				session.setAttribute("user", u);
			}
		} else{
			u = new User(name, password);
			session.setAttribute("user", u);
		}
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
											<%    Cart c = new Cart();
												if(session.getAttribute("cart") != null){
												  c = (Cart)session.getAttribute("cart");
												  Set pros = c.getProducts().entrySet();
												  Iterator it = pros.iterator();
												  while(it.hasNext()){
													count += (Integer)((Map.Entry)it.next()).getValue();
												  }
												}

												if(count == 0) {
											%>
												<a href="cart.jsp" target="iframe_a"><img src="img/emptycrt.jpg" alt="cart" width="80" height="80"/></a>
											<%
												} else {
											%>

												<a href="cart.jsp" target="iframe_a"><img src="img/crtfull.jpg" alt="cart" width="80" height="80"/></a><%= count %>
											<%
												}
											%>
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
						<table>
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
								<td id="auto-row">
									<table id="complete-table" class="popupBox"></table>
								</td>
							</tr>
							</tbody>
						</table>
						</form>
					</td>
					<td width="30%">
						<%
							if(request.getParameter("guest") != null || session.getAttribute("guest") != null) {
						%>
							Hi, <a href="info.jsp" class="normal" target="iframe_a">Guest</a> <a href="country.jsp?logout=ok" class="normal">(Logout)</a>
						<%
							} else if(session.getAttribute("user") != null) {
								u = (User)session.getAttribute("user");
						%>
						Hi, <a href="info.jsp" class="normal" target="iframe_a"><%= u.getUserID() %></a> <a href="country.jsp?logout=ok" class="normal">(Logout)</a>
						<%
							} else {
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
				<li><button type="submit" name="product" value="<%= (String)pcategory %>"><%= (String)pcategory %></button></li>
			<%
				}
			}
			%>
				</form>
			</ul>
		</nav>

		<aside>
			<%
			 	if(request.getParameter("product") != null || request.getParameter("remove") != null){
			 %>
			 	<iframe src="cart.jsp" name="iframe_a"></iframe>
			 <%
			 	} else if(request.getAttribute("search") != null){
					session.setAttribute("search", request.getAttribute("search"));
			%>
				<iframe src="catalog.jsp" name="iframe_a"></iframe>
			<%
				} else if(request.getParameter("wrong") != null){
			%>
				<iframe src="signin.jsp?username=<%= request.getParameter("wrong") %>" name="iframe_a"></iframe>
			<%
				} else if(request.getParameter("checkout") != null) {
					if(session.getAttribute("guest") != null || session.getAttribute("user") != null) {
			%>
				<iframe src="checkout.jsp" name="iframe_a"></iframe>
			<%
					} else {
			%>
				<iframe src="signin.jsp" name="iframe_a"></iframe>
			<%
					}
				} else {
			%>
				<iframe src="welcome.jsp" name="iframe_a"></iframe>
			<%
				}
			%>
		</aside>
	</body>
	<%
		if(!userLog){
			if( (!returnUser && u != null) || (returnUser && request.getParameter("wrong") != null)) {
				clients.setNewClient(u);
				session.setAttribute("user", u);
				clients.serializeThis();
			}
		}
	%>
<html>
