<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="edu.neu.cs5200.project.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.neu.cs5200.project.rest.client.*"
	import="java.util.*"
	import="edu.neu.cs5200.project.dao.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.rest.client.*"%>
<!DOCTYPE html>
<html>
<head>
<title>MyKART an E-Commerce online Shopping Site</title>
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
<%@ page session="true" %>
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
					autoPlay: false,
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
	<%
	CartDao cdao = new CartDao();
	ShoppingRestClient client = new ShoppingRestClient();
	Deal deal = client.findDealOftheDay();
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
		<div class="main-top">
			<div class="col-md-8 banner">
				<!-- start slider -->
				<!----->
				<div class="slider">	  
					  <div class="callbacks_container">
						  <ul class="rslides" id="slider">
							 <li>
								 <img src="images/slider1.jpg" alt=""/>
							 </li>
							 <li>
								 <img src="images/slider2.jpg" alt=""/>
							 </li>
							 <li>
								 <img src="images/slider3.jpg" alt=""/>
							 </li>
							 <li>
								 <img src="images/slider4.jpg" alt=""/>
							 </li>
						  </ul>	      
					  </div>
				</div>
				<!----->
				<!-- end  slider -->
		   </div>
		   <div class="col-md-4 right-grid">
				<div class="right-grid-top">
					<div class="r-sale text-center">
						<h6>Winter wear</h6>
						<h2>Sale</h2>
					</div>
					<div class="r-discount">
						<span>upto</span>
						<h2>50%</h2>
						<p>OFF</p>
						<a href="products.jsp?search=winter sale">shop now<i class="go"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="right-grid-bottom">
					<div class="right-grid-bottom-left">
						<h3>Exclusive Offer</h3>
						<p>Value of the Day</p>
						<h5><%=deal.getName()%></h5>
						<h2></h2>
						<a href="details.jsp?id=<%=deal.getItemId()%>">shop now<i class="go"></i></a>
					</div>
					<div class="right-grid-bottom-right">
						<img src="<%=deal.getLargeImage()%>" alt="" />
					</div>
					<div class="clearfix"></div>
				</div>
		   </div>
		   <div class="clearfix"></div>
		</div>
		<div class="new-arrivals text-center">
			<div class="col-md-3 new-arrival-head">
				<h3>New Arrivals</h3>
			</div>
			<div class="col-md-3 product-item">
				<a href="products.jsp?search=watch"><img src="images/watch.jpg" class="img-responsive" alt="" /></a>
				<h3>Watches</h3>
				<a href="products.jsp?search=watch">Shop Now<i class="go"></i></a>
			</div>
			<div class="col-md-3 product-item">
				<a href="products.jsp?search=jacket"><img src="images/men-jacket.jpg" class="img-responsive zoom-img" alt="" /></a>
				<h3>jackets</h3>
				<a href="products.jsp?search=jacket">Shop Now<i class="go"></i></a>
			</div>
			<div class="col-md-3 product-item">
				<a href="products.jsp?search=Footwear"><img src="images/shoes.jpg" class="img-responsive zoom-img" alt="" /></a>
				<h3>Footwear</h3>
				<a href="products.jsp?search=Footwear">Shop Now<i class="go"></i></a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="best-sellers">
			<div class="best-sellers-head">
				<h3>Bestsellers</h3>
			</div>
			<div class="best-sellers-menu">
				<ul>
					<li><a class="active" href="products.jsp?search=Electronics">Electronics</a></li>
					<li><a href="products.jsp?search=T-Shirt">Fashion</a></li>
					<li><a href="products.jsp?search=Books">Books</a></li>
					<li><a href="products.jsp?search=Other">Other</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clients">
		<div class="course_demo1">
		          <ul id="flexiselDemo1">	
					<li>
						<div class="client">
							<img src="images/c1.jpg" alt="" />
						</div>
					</li>
					<li>
					    <div class="client">
							<img src="images/c2.jpg" alt="" />
						</div>
					</li>	
					<li>
					    <div class="client">
							<img src="images/c4.jpg" alt="" />
						</div>
					</li>	
					<li>
					    <div class="client">
							<img src="images/c3.jpg" alt="" />
						</div>
					</li>	
					<li>
						<div class="client">
							<img src="images/c5.jpg" alt="" />
						</div>
					</li>	
					<li>
						<div class="client">
							<img src="images/c6.jpg" alt="" />
						</div>
					</li>
					<li>
						<div class="client">
							<img src="images/c7.jpg" alt="" />
						</div>
					</li>
				</ul>
			</div>
			<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
				<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo1").flexisel({
					visibleItems: 7,
					animationSpeed: 1000,
					autoPlay: false,
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
		</div>
		<div class="transport-grid">
			<div class="col-md-4 shipping">
				<h3><i class="shipping-icon"></i>Free Shipping</h3>
				<p>Syphogrants called into the council chamber, and these are changed every day. It is a fundamental rule of their government,</p>
			</div>
			<div class="col-md-4 shipping">
				<h3><i class="correct-icon"></i>100 % Original</h3>
				<p>Syphogrants called into the council chamber, and these are changed every day. It is a fundamental rule of their government,</p>
			</div>
			<div class="col-md-4 return">
				<h3><i class="return-icon"></i>Free Return</h3>
				<p>Syphogrants called into the council chamber, and these are changed every day. It is a fundamental rule of their government,</p>
			</div>
			<div class="clearfix"></div>
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