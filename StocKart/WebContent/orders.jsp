<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="edu.neu.cs5200.project.rest.client.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.dao.*"
	import="java.util.*"
	import="java.text.*"
	import="java.math.*"%>
<!DOCTYPE html>
<html>
<head>
<title>BOX SHOP a E-commerce online Shopping Category Flat Bootstarp responsive Website Template| Products :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<link href="css/responsive.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- start slider -->
<script src="js/responsiveslides.min.js"></script>
 <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
<!--end slider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
				<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo").flexisel({
					visibleItems: 5,
					animationSpeed: 1000,
					autoPlay: true,
					autoPlaySpeed: 3000,    		
					pauseOnHover: true,
					enableResponsiveBreakpoints: true,
			    	responsiveBreakpoints: { 
			    		portrait: { 
			    			changePoint:480,
			    			visibleItems: 1
			    		}, 
			    		landscape: { 
			    			changePoint:640,
			    			visibleItems: 2
			    		},
			    		tablet: { 
			    			changePoint:768,
			    			visibleItems: 3
			    		}
			    	}
			    });
			    
			});
		</script>
		<script type="text/javascript" src="js/jquery.flexisel.js"></script>
</head>
<body>
	<!-- header-section-starts -->
		<script>
			function itemPresent() 
			{alert("Item already added to cart.");}
			
			function updateQuantity(id,custId,pname,img,price)
			{
				var qtyid = "quantity".concat(id);
				var qty = document.getElementById(qtyid).value;
				var cart = 
					{
						itemId: id,
						quantity: qty,
						name: pname,
						customerId: custId,
						thumbnailImage: img,
						salePrice: price
					};
				updateCart(cart);
				location.reload(true);
			}
			
			function removeItem(id){
				removeCartItem(id);
				location.reload(true);
			}
			
			function updateCart(cart){
				$.ajax(
	                       {
	                               url: "api/cart",
	                               data: JSON.stringify(cart),
	                               type: "put",
	                               dataType: "json",
	                                        contentType: "application/json",
	                               success: function(response) {
	                            	   	console.log(response);
	                                      alert("Cart updated");
	                               },
	                               error: function(response) {
	                                       console.log(response);
	                               }
	                       });
			}
			
			function removeCartItem(id){
				$.ajax(	
				{
                    url: "api/cart/"+id,
                    type: "delete",
                    dataType: "json",
                             contentType: "application/json",
                    success: function(response) {
                    		console.log(response);
                           alert("Item Removed from Cart");
                    },
                    error: function(response) {
                            console.log(response);
                    }
            });
			}
			
		</script>
		<%
			String itemId = null;
			String action = null;
			Product product = null;
			double price = 0;
			CartDao cdao = new CartDao();
			UserDAO udao = new UserDAO();
			OrderDao odao = new OrderDao();
			String priceStr = request.getParameter("totalprice");
			if(priceStr!=null)
			price = Double.valueOf(request.getParameter("totalprice"));
			Map<String, String> messages = new HashMap<String, String>();
			action = request.getParameter("action");
			itemId = request.getParameter("itemId");
			ShoppingRestClient client = new ShoppingRestClient();
			if(action!=null)
			{

				if(session.getAttribute("username")!=null)
				{

					if("create".equals(action))
					{	

						Cart cart = new Cart();
						product = client.findProductById(itemId);
						cart.setItemId(product.getItemId()+"");
						cart.setCustomerId(session.getAttribute("username").toString());
						cart.setName(product.getName());
						cart.setThumbnailImage(product.getThumbnailImage());
						cart.setSalePrice(product.getSalePrice());
						
						if(cdao.findCart(itemId) != null)
						{
							%>
							<script>itemPresent();</script>
							<%
						}
						else
						{
							cdao.createCartItem(cart);	
						}
						
						
					}
				}
				else
				{
					%>
					<jsp:forward page="login.jsp" />
					<%
				}
			}
			String searchText = request.getParameter("search");
			List<Product> i = new ArrayList<Product>();
			if(searchText!=null){				
				Products products = client.findProductByName(searchText);
				if(products!=null)
				i = products.getItems();
			}

		%>
	<div class="header">
		<div class="top-header">
<div class="wrap">
				<div class="header-left">
					<ul>
						 <% if(session.getAttribute("username") == null) 
							{ %>
						<li class="login">
							<i class="lock"></i>
							<a href="login.jsp">Login</a>|							
						</li>
						<%} %>
						<% if(session.getAttribute("username") != null) 
							{ %>
						<li class="login">
							<a href=# >Welcome <%= session.getAttribute( "username" ) %> | </a>
						</li>
						<%} %> 
					<li>
					 <% if(session.getAttribute("username") == null) 
							{ %>						
					<!-- <div class="sign-up-right"> -->
						<a href="login.jsp">Sign Up</a>
					<!-- </div> -->
					<%} else {%>
					<!-- <div class="sign-up-right"> -->
						<a href="logout.jsp">Logout</a>
					<!-- </div> -->
					<%} %>
					</li>
					</ul>		
						
					</ul>
				</div>
				<div class="header-right">
					<ul>					
						 <li>
							<i class="user"></i>
							<a href="register.jsp">My Account</a>
						</li>						
						 <% if(session.getAttribute("username") != null) 
							{ %>
						<li>						
							<a href="myorders.jsp">My Orders</a>						
						</li>
						<li>						
							<a href="wishlist.jsp">My WishList</a>						
						</li>
						<%} %>				
						<li>
							<i class="cart"></i>
							<% if(session.getAttribute("username") != null) 
							{ %>
							<a href="viewcart.jsp">Shopping Cart</a><%} else {%>
							<a href="login.jsp">Shopping Cart</a><%} %>
						</li>
						<li class="last">
						 <% if(session.getAttribute("username") == null) 
							{ %>0
							<% } else {%> <%=cdao.findNoOfItems(session.getAttribute("username").toString()) %>
							<%} %>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header-bottom">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.jpg" class="img-responsive" alt="" /></a>
				</div>
				<div class="search">
					<div class="search2">
					  <form action="products.jsp" method="get">
						<input type="submit" value="">
						 <input type="text" name="search" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
					  </form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="wrap">
		<div class="navigation-strip">
			<h4>Most Popular<i class="arrow"></i></h4>
			<div class="top-menu">
				<!-- start header menu -->
<ul class="megamenu skyblue">
			<li><a class="color1" href="products.jsp?search=cellphones">mobiles</a>		
			</li>
			<li class="grid"><a class="color2" href="products.jsp?search=tablets">tablets</a>
				</li>
			<li class="grid"><a class="color4" href="products.jsp?search=laptops">laptops</a>				
				</li>				
				<li><a class="color5" href="products.jsp?search=cameras">cameras</a>
				</li>
				<li><a class="color6" href="products.jsp?search=watches">watches</a>
				</li>
				<li><a class="color8" href="products.jsp?search=eBooks">eBooks</a>
				</li>
				<li><a class="color9" href="products.jsp?search=T-shirts">T-shirts</a>				
				</li>
				<li><a class="color5" href="products.jsp?search=sarees">sarees</a>
				</li>
				<li><a class="color1" href="products.jsp?search=jeans">jeans</a>
				</li>
				<li><a class="color10" href="products.jsp?search=perfumes">perfumes</a>			
				</li>
				<li><a class="color2" href="products.jsp?search=sofas">sofas</a>
				</li>
				<li><a class="color6" href="products.jsp?search=sunglasses">sunglasses</a>
				</li>
		 </ul> 	</div>
		<div class="clearfix"></div>
		</div>
		<div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Order Summary</h3>
    		</div>
    		<div class="clearfix"></div>
    	</div>
	      		<%	for (int j=0; j<i.size() ; j++) {
	      			if((j % 4) == 0)
	      		%>
	      		<div class="section group">
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="single.html"><img src="<%=i.get(j).getThumbnailImage() %>" alt="" /></a>
					 <h2><%=i.get(j).getName() %></h2>
					 <p><img src="<%= i.get(j).getCustomerRatingImage() %>" alt="" /></p>
					 <%-- <h2><%=i.get(j).getCustomerRating() %></h2> --%>
					 <%-- <p><%=i.get(j).getShortDescription() %></p> --%>
					 <p><span class="price">$<%= i.get(j).getSalePrice() %></span></p>
					 <form action="products.jsp" onsubmit="return validItem();">
					 	<input type="hidden" name="itemId" value="<%= i.get(j).getItemId() %>" />
					 	<input type="hidden" name="search" value="<%= searchText %>" />
					 	<span><button class="btn button" name="action" value="create">AddToCart</button></span>
					 </form>
				     <div class="button"><span><a href="single.html" class="details">Details</a></span></div>
				</div>
				<%
				if((j % 4) == 0)
					%>
					</div>
					<%
					}
				%>
				<div class="clearfix">
			</div>
				<div class="sectiongroup">
	
			<table cellspacing='0'> <!-- cellspacing='0' is important, must stay -->

	<!-- Table Header -->
	<thead>
		<tr>
			<th>ITEM</th>
			<th>QTY</th>
			<th>PRICE</th>
			<th>DELIVERY DETAILS</th>
			<th>SUBTOTAL</th>
		</tr>
	</thead>
	<!-- Table Header -->

	<!-- Table Body -->
	<tbody>

		<tr>
			
		</tr><!-- Table Row -->
		<%			int counter = 1;
					List<Cart> clist = cdao.findAllItems(session.getAttribute("username").toString());%>
					<form action="https://www.sandbox.paypal.com/cgi-bin/webscr"
											method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="upload" value="1"> <input
												type="hidden" name="business" value="business@boxshop.com">
					<%
					for(Cart c : clist){
				%>
				<input type="hidden" name="quantity_<%=counter %>" value="<%=c.getQuantity() %>"> <input
												type="hidden" name="item_name_<%=counter %>" value="<%=c.getName() %>"> <input
												type="hidden" name="item_number_<%=counter %>" value="<%=c.getItemId()%>">
											<input type="hidden" name="amount_<%=counter %>" value="<%=c.getSalePrice() %>">
				<tr>
					<td><img src="<%=c.getThumbnailImage()%>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%-- <a href="#" onClick='removeItem("<%=c.getItemId()%>")'>Remove From Cart</a> --%>
					<br><%=c.getName() %></td>
					<td><input id="quantity<%=c.getItemId()%>" type="text" size="1" value="<%=c.getQuantity() %>" readonly/>
<%-- 					<br>
					<br>
					<div class="btn_form">
					<form>
					<input
						type="submit" value="Update" 
						onClick='updateQuantity("<%=c.getItemId()%>","<%=c.getCustomerId() %>","<%=c.getName() %>","<%=c.getThumbnailImage() %>","<%=c.getSalePrice() %>")'/>
					</form>
					</div> --%>
					</td>
					<td>$<%=c.getSalePrice() %></td>
					<td>*Free
					<br>
*Delivered in 2 business days.<br>
Faster options may be available during checkout.</td>
					<td>$<%=new BigDecimal(c.getSalePrice()*c.getQuantity()).setScale(2, RoundingMode.HALF_UP).doubleValue() %></td>
					
				</tr>

				<%
					counter++;
				}
				%>
				<tr>
					<td colspan="4" align="right"><h1>Payable Amount: $<%=cdao.findCartTotal(session.getAttribute("username").toString()) %></h1></td>
					<td colspan="1">
						<div class="btn_form">
											<%Userbean u=new Userbean();
											 u.setUsername(session.getAttribute("username").toString());%>
											<input type="hidden" name="currency_code" value="USD">
											<input type="hidden" name="first_name" value="<% if(udao.getUname(u).getCustinfo() != null) { udao.getUname(u).getCustinfo().getFirstname();}%>">
											<input type="hidden" name="last_name" value="<%if(udao.getUname(u).getCustinfo() != null) { udao.getUname(u).getCustinfo().getLastname();}%>"> 
											<input
												type="hidden" name="address1" value="9 Elm Street">
											<input type="hidden" name="address2" value="Apt 1916"> <input
												type="hidden" name="city" value="Boston"> <input
												type="hidden" name="state" value="MA"> <input
												type="hidden" name="zip" value="02120"> <input
												type="hidden" name="night_phone_a" value="857"> <input
												type="hidden" name="night_phone_b" value="928"> <input
												type="hidden" name="night_phone_c" value="5763"> <input
												type="hidden" name="email" value="<%=udao.getUname(u).getEmailId() %>">
<!-- 											<input type='hidden' name='rm' value='2'> <input
												type="hidden" value="http://localhost:8080/PayPal/index.jsp"
												name="return"> -->


											<!--<input type="hidden" name="tax_cart" value="5.13"> -->
											 <input type="image"
												src="images/express-checkout-hero.png"
												border="0" name="upload"
												alt="Make payments with PayPal - it's fast, free and secure!"
												width="200" height="45">
										</form>
									</div>
					</td>
				</tr>
	</tbody>
	<!-- Table Body -->

</table>
		</div>
			</div>
					
		</div>
	</div>

	 <div class="footer">
		<div class="wrap">
			<div class="contact-section">
			<div class="col-md-4 follow text-left"></div>
			<div class="col-md-4 subscribe text-left"></div>
			<div class="col-md-4 help text-right">
					<h3>Need Help?</h3>
					<p></p>
					<a href="contact.jsp">Contact us</a>
			</div>
				<div class="clearfix"></div>
			</div>
			<div class="footer-middle">
				<div class="col-md-6 different-products">

				</div>
				<div class="col-md-6 about-text text-right">
					<h4>About BoxShop</h4>
					<p>The fashion never alters, and as it is neither disagreeable nor uneasy, so it is suited to the climate, and calculated both for their summers and winters. Every family makes their own clothes; but all among them, women as well as men, learn one or other of the trades formerly mentioned.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>Copyright &copy; 2015 All rights reserved | Template by  <a href="http://w3layouts.com">  W3layouts</a></p>
			</div>

		</div>
	 </div>
</body>
</html>