<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="edu.neu.cs5200.project.rest.client.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.dao.*"
	import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>BOX SHOP an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Login :: w3layouts</title>
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
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#"></a></li>
						<li><a href="order.html"></a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li>
							<i class="user"></i>
							<a href="register.jsp">My Account</a>
						</li>
						<li class="login">
							<i class="lock"></i>
							<a href="login.jsp">Log In/</a>
						</li>
						<li>
							<i class="cart"></i>
							<a href="#">Shopping Cart</a>
						</li>
						 <li class="last">
						 0
						</li>
					</ul>
					<div class="sign-up-right">
						<a href="login.jsp">Sign Up</a>
					</div>
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
					  <form>
						<input type="submit" value="">
						 <input type="text" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
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
		<!-- start login -->
		<section id="main">
		<div class="login-content">
			<div class="pag-nav">
				<ul class="p-list">
					<li><a href="index.jsp"></a></li>
					<li class="act"></li>
				</ul>
			</div>
			<div class="login-signup-form">
				<div class="col-md-5 login text-center">
					<h4>login</h4>
					<h5>&nbsp;</h5>
					<form action="logincheck.jsp">
					<div class="cus_info_wrap">
						<label class="labelTop">
						Email:
						<span class="require">*</span>
						</label>
						<input type="text" name="username" value="">
					</div>
					<div class="clearfix"></div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Password:
						<span class="require">*</span>
						</label>
						<input type="password" name="password" value="">
					</div>
					<div class="clearfix"></div>
					<div class="sky-form">
					<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Remember me on this computer </label>
					<c:out value="${messages['error']}"/>
				</div>
				<div class="botton1">
					<input type="submit" value="SIGNIN" class="botton">
				</div>
				</form>
				<div class="forgetit">
					<a href="">Always keep your passwords safe</a>
					<br>
					<a href="">Please refer to password protection guidelines</a>
				</div>
				</div>
				<form action="signup.jsp" method="post">
				<div class="col-md-5 sign-up text-center">
					<h4>signup</h4>
					<div class="cus_info_wrap">
						<label class="labelTop">
						UserName:
						<span class="require">*</span>
						</label>
						<input type="text" name="username" value="">
						<c:out value="${messages['user']}"/>												
					</div>					
					<div class="cus_info_wrap">
						<label class="labelTop">
						Email Id:
						<span class="require">*</span>
						</label>
						<input type="text" name="email" value="">
						<c:out value="${messages['email']}"/>
					</div>
					<div class="clearfix"></div>
				    <div class="cus_info_wrap">
						<label class="labelTop">
						Password:
						<span class="require">*</span>
						</label>
						<input type="password" name="pwd1" value="">
						<c:out value="${messages['pwd1']}"/>
					</div>
					<div class="clearfix"></div><div class="cus_info_wrap">
						<label class="labelTop confirmpass">
						Confirm Password:
						<span class="require">*</span>
						</label>
						<input type="password" name="pwd2" value="">
						<c:out value="${messages['pwd2']}"/>
						<c:out value="${messages['pwd3']}"/>
					</div>					
					<div class="botton1">
					<input type="submit" value="SIGNIN" class="botton">
					</div>
				</div>
				</form>
				<div class="col-md-2 benefits">
					<h4>Benefits of signup</h4>
					<p>Manage your purchases anytime: Track your order status and print your vouchers</p>
					<p>Quick shopping: no need to fill in your contact and shipping details while buying</p>
					<p>Easy access to member only benefits</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		</section>
	 <div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-left">
				</div>
				<div class="col-md-4 subscribe text-left">
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