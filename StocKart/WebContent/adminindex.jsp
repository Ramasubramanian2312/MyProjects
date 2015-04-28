<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
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
	<%
	UserDAO udao = new UserDAO(); 
	String action = request.getParameter("action");
	String username = request.getParameter("username");
	
	if("remove".equals(action))
	{
		udao.removeUser(username);
		response.sendRedirect("adminindex.jsp");
	
	}
	
	
	%>
	<!-- header-section-starts -->
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
				<div class="header-right"></div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header-bottom">
				<div class="logo">
					<a href="#"><img src="images/logo.jpg" class="img-responsive" alt="" /></a>
				</div>
				<div class="search">

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="wrap">
		<div class="navigation-strip">
			<div class="top-menu">
			<ul class="megamenu skyblue">
			
		 </ul> 
	</div>
		<div class="clearfix"></div>
		</div>
		<!-- start login -->
		<section id="main">
			<table cellspacing='0'> <!-- cellspacing='0' is important, must stay -->

	<!-- Table Header -->
	<thead>
		<tr>
			<th>USERNAME</th>
			<th>EMAIL</th>
			<th>ACTION</th>
		</tr>
	</thead>
	<!-- Table Header -->

	<!-- Table Body -->
	<tbody>

		<tr>
			
		</tr><!-- Table Row -->
		<%
					List<Userbean> clist = udao.getAllUsers();
					for(Userbean c : clist){
				%>
				<tr>
					<td><%=c.getUsername()%></td>
					<td><%=c.getEmailId() %></td>
					<td>
					<a href="adminindex.jsp?action=remove&username=<%=c.getUsername()%>"> Remove </a>
					</td>					
				</tr>

				<%
					}
				%>
	</tbody>
	<!-- Table Body -->

</table>
		</section>
	 <div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-left">
				</div>
				<div class="col-md-4 subscribe text-left">
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