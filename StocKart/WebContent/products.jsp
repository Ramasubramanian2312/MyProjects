<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="edu.neu.cs5200.project.rest.client.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.dao.*"
	import="java.util.*"%>
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
			
			function itemPresent() 
			{alert("Item already present in wishlist");}
			
		</script>
		<%
			String itemId = null;
			String action = null;
			Product product = null;
			Map<String, String> messages = new HashMap<String, String>();
			action = request.getParameter("action");
			itemId = request.getParameter("itemId");
			CartDao cdao = new CartDao();
			WishlistDao wdao = new WishlistDao();
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
						cart.setQuantity(1);
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
					if("wishlist".equals(action))
					{	
						Wishlist wl = new Wishlist();
						product = client.findProductById(itemId);
						wl.setItemId(product.getItemId()+"");
						wl.setCustomerId(session.getAttribute("username").toString());
						wl.setName(product.getName());
						wl.setThumbnailImage(product.getThumbnailImage());
						wl.setSalePrice(product.getSalePrice());
						
						if(wdao.findWishlist(itemId) != null)
						{
							%>
							<script>itemPresentWishlist();</script>
							<%
						}
						else
						{
							wdao.createWishlistItem(wl);	
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
		 </ul> 
	</div>
		<div class="clearfix"></div>
		</div>
		<div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Feature Products</h3>
    		</div>
    		<div class="sort">
    		<p>
    		</p>
    		</div>
    		<div class="show">
    		<p>
    		</p>
    		</div>
    		<div class="page-no">
    			<p></p>
    		</div>
    		<div class="clearfix"></div>
    	</div>
	      		<%
	      		for (int j=0; j<i.size() ; j++) {
	      			if((j % 4) == 0)
	      		%>
	      		<div class="section group">
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="details.jsp?id=<%=i.get(j).getItemId() %>"><img src="<%= i.get(j).getThumbnailImage() %>" alt="" /></a>
					 <h2><%=i.get(j).getName() %></h2>
					 <p>
					 	<%
					 	if(i.get(j).getCustomerRatingImage()!=null){%>
					 	<img src="<%= i.get(j).getCustomerRatingImage() %>" alt="" />
					 	<%}%>
					 </p>
					 <p><span class="price">$<%= i.get(j).getSalePrice() %></span></p>
					 <form action="products.jsp" onsubmit="return validItem();">
					 	<input type="hidden" name="itemId" value="<%= i.get(j).getItemId() %>" />
					 	<input type="hidden" name="search" value="<%= searchText %>" />
					 	<button class="btn btn-primary" name="action" value="create">AddToCart</button>
					 	<button class="btn btn-primary" name="action" value="wishlist">AddToWishList</button>
					 </form>
				     <%-- <div class="button"><span><a href="details.jsp?id=<%=i.get(j).getItemId() %>" class="details">Details</a></span></div> --%>
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
				
			</div>
<!-- 			<div class="content_bottom">

    		<div class="clearfix"></div> -->
    	</div>
</div>
	 <div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-left">
					<h3></h3>
					<p></p>
					<div class="social-icons">
					</div>
				</div>
				<div class="col-md-4 subscribe text-left">
					<h3></h3>
					<p></p>
				</div>
				<div class="col-md-4 help text-right">
					<h3>Need Help?</h3>
					<p></p>
					<a href="contact.jsp">Contact us</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="footer-middle">
				<div class="col-md-6 different-products"></div>
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