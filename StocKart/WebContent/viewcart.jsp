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
			Map<String, String> messages = new HashMap<String, String>();
			action = request.getParameter("action");
			itemId = request.getParameter("itemId");
			ShoppingRestClient client = new ShoppingRestClient();
			CartDao cdao = new CartDao();
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
						<li><a href="#">24x7 Customer Care  </a></li> |
						<li><a href="order.html"> Track Order</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li>
							<i class="user"></i>
							<a href="account.jsp">My Account</a>
						</li>
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
							<a href=# >Welcome <%= session.getAttribute( "username" ) %></a>
						</li>
						<%} %>
						<li>
							<i class="cart"></i>
							<a href="#">Shopping Cart</a>
						</li>
					 <li class="last">
						 <% if(session.getAttribute("username") == null) 
							{ %>0
							<% } else {%> <%=cdao.findNoOfItems(session.getAttribute("username").toString()) %>
							<%} %>
						</li>
					</ul>
					<% if(session.getAttribute("username") == null) 
							{ %>						
					<div class="sign-up-right">
						<a href="login.jsp">Sign Up</a>
					</div>
					<%} else {%>
					<div class="sign-up-right">
						<a href="logout.jsp">Logout</a>
					</div>
					<%} %>					
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
			<li><a class="color1" href="#">mobiles</a>		
			</li>
			<li class="grid"><a class="color2" href="#">tablets</a>
				</li>
			<li class="grid"><a class="color4" href="#">laptops</a>				
				</li>				
				<li><a class="color5" href="#">cameras</a>
				</li>
				<li><a class="color6" href="#">watches</a>
				</li>
				<li><a class="color8" href="#">eBooks</a>
				</li>
				<li><a class="color9" href="#">T-shirts</a>				
				</li>
				<li><a class="color5" href="#">sarees</a>
				</li>
				<li><a class="color1" href="#">jeans</a>
				</li>
				<li><a class="color10" href="#">perfumes</a>			
				</li>
				<li><a class="color2" href="#">sofas</a>
				</li>
				<li><a class="color6" href="#">sunglasses</a>
				</li>
		 </ul> 
	</div>
		<div class="clearfix"></div>
		</div>
		<div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>My Shopping Cart</h3>
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
			<th>REMOVE</th>
		</tr>
	</thead>
	<!-- Table Header -->

	<!-- Table Body -->
	<tbody>

		<tr>
			
		</tr><!-- Table Row -->
		<%
					List<Cart> clist = cdao.findAllItems(session.getAttribute("username").toString());
					for(Cart c : clist){
				%>
				<tr>
					<td><img src="<%=c.getThumbnailImage()%>" />
						<%=c.getName() %></td>
					<td><input id="quantity<%=c.getItemId()%>" type="text" size="1" value="<%=c.getQuantity() %>"/>
					<span>
					<a href="#"
						onClick='updateQuantity("<%=c.getItemId()%>","<%=c.getCustomerId() %>","<%=c.getName() %>","<%=c.getThumbnailImage() %>","<%=c.getSalePrice() %>")'>Update</a></span></td>
					    <%-- <button class="btn btn-primary" 
						onClick='updateQuantity("<%=c.getItemId()%>","<%=c.getCustomerId() %>","<%=c.getName() %>","<%=c.getThumbnailImage() %>","<%=c.getSalePrice() %>")' value="Change">Update</button></td> --%>
					<td>$<%=c.getSalePrice() %></td>
					<td>Delivery Details</td>
					<td>$<%=c.getSalePrice()*c.getQuantity() %></td>
					<td><button class="btn btn-danger" onClick='removeItem("<%=c.getItemId()%>")'>Remove</button></td>
				</tr>

				<%
					}
				%>
	</tbody>
	<!-- Table Body -->

</table>
		</div>
			</div>
					
		</div>
	</div>
		<div class="device">
			<div class="course_demo">
		          <ul id="flexiselDemo">	
					<li>
						<div class="ipad text-center">
							<img src="images/phone.jpg" alt="" />
							<h4>Ipad Mini</h4>
							<h3>$499</h3>
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart" href="#">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="cart" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li>
					<div class="ipad text-center">
							<img src="images/phone1.jpg" alt="" />
							<h4>Ipad Mini</h4>
							<h3>$499</h3>
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart" href="#">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="cart" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>	
					<li>
					<div class="ipad text-center">
							<img src="images/phone2.jpg" alt="" />
							<h4>Ipad Mini</h4>
							<h3>$499</h3>
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart" href="#">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="cart" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>	
					<li>
					<div class="ipad text-center">
							<img src="images/phone3.jpg" alt="" />
							<h4>Ipad Mini</h4>
							<h3>$499</h3>
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart" href="#">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="cart" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>	
					<li>
					<div class="ipad text-center">
							<img src="images/phone4.jpg" alt="" />
							<h4>Ipad Mini</h4>
							<h3>$499</h3>
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart" href="#">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="cart" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>							    	  	       	   	  									    	  	       	   	    	
				</ul>
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
					<a href="contact.html">Contact us</a>
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