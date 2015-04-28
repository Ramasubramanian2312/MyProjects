<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.neu.cs5200.project.models.*,edu.neu.cs5200.project.dao.*,java.util.*,java.util.Map,edu.neu.cs5200.project.rest.client.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BOX SHOP a E-commerce online Shopping Category Flat
	Bootstarp responsive Website Template| Single :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/responsive.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 






</script>
<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 300,
											thumb_image_height : 400,
											source_image_width : 800,
											source_image_height : 1000,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});

					});
</script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript">
	$(window).load(function() {
		$("#flexiselDemo").flexisel({
			visibleItems : 4,
			animationSpeed : 1000,
			autoPlay : true,
			autoPlaySpeed : 3000,
			pauseOnHover : true,
			enableResponsiveBreakpoints : true,
			responsiveBreakpoints : {
				portrait : {
					changePoint : 480,
					visibleItems : 1
				},
				landscape : {
					changePoint : 640,
					visibleItems : 2
				},
				tablet : {
					changePoint : 768,
					visibleItems : 3
				}
			}
		});

	});
</script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<link rel="stylesheet" href="css/jquery.rating.css" />
<script type="text/javascript" src="js/jquery.rating.js"></script>
<script type="text/javascript" src="js/jquery.rating.pack.js"></script>
</head>
<body>
		<script>
			function itemPresent() 
			{alert("Item already added to cart.");}
			
		</script>	
	<% 
		Product product = null;
		ShoppingRestClient client = new ShoppingRestClient();
		CartDao cdao = new CartDao();
		String itemId = request.getParameter("id");
		String action = null;
		action = request.getParameter("action");
		if(action!=null)
		{
			if(session.getAttribute("username")!=null)
			{
				if("AddToCart".equals(action))
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
			}
			else
			{
				%>
				<jsp:forward page="login.jsp" />
				<%
			}
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
					<a href="index.jsp"><img src="images/logo.jpg"
						class="img-responsive" alt="" /></a>
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
			<h4>
				Most Popular<i class="arrow"></i>
			</h4>
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
		<!-- start main -->
		<% 
						Product p = client.findProductById(itemId);
		%>

		<div class="main_bg">
			<div class="main">
				<!-- start span1_of_1 -->
				<div class="right_content">
					<div class="span_1_of_left">
						<div class="grid images_3_of_2">
							<ul id="etalage">
								<li><a href="optionallink.html"> <img
										class="etalage_thumb_image" src="<%=p.getLargeImage()%>"
										class="img-responsive" /> <img class="etalage_source_image"
										src="<%=p.getLargeImage()%>" class="img-responsive" title="" />
								</a></li>
								<!-- <li><img class="etalage_thumb_image" src="images/d2.jpg"class="img-responsive" /> 
									<img class="etalage_source_image"src="images/d2.jpg" class="img-responsive" title="" /></li>
								<li><img class="etalage_thumb_image" src="images/d3.jpg"class="img-responsive" /> 
									<img class="etalage_source_image"src="images/d3.jpg" class="img-responsive" /></li>
								<li><img class="etalage_thumb_image" src="images/d4.jpg" class="img-responsive" /> 
									<img class="etalage_source_image"src="images/d4.jpg" class="img-responsive" /></li> -->
							</ul>
							<div class="clearfix"></div>
						</div>

						<!-- start span1_of_1 -->
						<div class="span1_of_1_des">
							<div class="desc1">
								<h3><%=p.getName()%></h3>
								<p><%=p.getShortDescription()%></p>
								<h5>
									$<%=p.getSalePrice()%>
								</h5>
								<div class="available">
									<h4></h4>
									<ul>
									</ul>
									<div class="btn_form">
										<form action="details.jsp">
										<input type="hidden" name="id" value="<%=p.getItemId() %>"/>
											<input name="action" type="submit" value="AddToCart" title=""/>
										</form>
									</div>
									<script type="text/javascript">
										function callHello() {
											alert("Hello");
										}
									</script>
									<span class="span_right"><a href="#">login to save
											in wishlist </a></span>
									<div class="clearfix"></div>
								</div>
								<div class="filter-by-color"></div>

							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<%
					
					ReviewDAO reviewDAO = new ReviewDAO();
				    
				    action = request.getParameter("post");
				    String reviewtext = request.getParameter("commentContent");
				    String title  = request.getParameter("title");
				    String rate = request.getParameter("rating");
				    
				    if("review".equals(action))
				    {
				        Myreview myrev = new Myreview();
				        Integer myrate = 0;
				        
				        if(rate != null)
				        	myrate=Integer.parseInt(rate);
				        
				        myrev.setItemId(p.getItemId());
				        myrev.setItemName(p.getName());
				        myrev.setRating(myrate);
				        myrev.setReviewer(session.getAttribute("username").toString());
				        myrev.setReviewText(reviewtext);
				        myrev.setTitle(title);
				        myrev.setSubmissionTime(new Date());
				        
				        reviewDAO.createReview(myrev);
				        
				    }
					
					%>

					<div class="device">
						<div class="course_demo">
							<h3>Customer Reviews and Ratings:</h3>
							<br>
							<%
								ReviewItem revs = new ReviewItem();
								revs = client.findReviewById(itemId);
								if (revs != null) {
									Collection<Review> crev = revs.getReviews();
							%>
							<table cellspacing='0'>
								<!-- Table Header -->

								<!-- Table Body -->
								<tbody>
								<%
										List<Myreview> lrev = new ArrayList<Myreview>();							
										lrev = reviewDAO.findAllReviewsforItem(Integer.parseInt(itemId));
										for (Myreview rev : lrev) {												
												
									%>
									<tr>
										<td>
											<%
												if (rev.getRating() == 0) {
											%> <span class="rating-static rating-0"></span> <%
 	} else if (rev.getRating() == 1) {
 %> <span class="rating-static rating-10"></span> <%
 	} else if (rev.getRating() == 2) {
 %> <span class="rating-static rating-20"></span> <%
 	} else if (rev.getRating() == 3) {
 %> <span class="rating-static rating-30"></span> <%
 	} else if (rev.getRating() == 4) {
 %> <span class="rating-static rating-40"></span> <%
 	} else {
 %> <span class="rating-static rating-50"></span> <%
 	}
 %> <br> <br> <%=rev.getReviewer()%> <br> <br>
											<%=rev.getSubmissionTime()%>
										</td>
										<td>
											<h4>
												<b> <%=rev.getTitle()%>
												</b>
											</h4>
											<textarea rows="3" cols="150" wrap="hard" readonly>
										<%=rev.getReviewText()%>
										</textarea>
										</td>
									</tr>
									<%
										}															
										for (Iterator iterator = crev.iterator(); iterator.hasNext();) {
												Review type = (Review) iterator.next();
												int rating = 0;
												if (type.getOverallRating().getRating() != null)
													rating = type.getOverallRating().getRating();
									%>
									<tr>
										<td>
											<%
												if (rating == 0) {
											%> <span class="rating-static rating-0"></span> <%
 	} else if (rating == 1) {
 %> <span class="rating-static rating-10"></span> <%
 	} else if (rating == 2) {
 %> <span class="rating-static rating-20"></span> <%
 	} else if (rating == 3) {
 %> <span class="rating-static rating-30"></span> <%
 	} else if (rating == 4) {
 %> <span class="rating-static rating-40"></span> <%
 	} else {
 %> <span class="rating-static rating-50"></span> <%
 	}
 %> <br> <%if(type.getReviewer()!=null) {%><%=type.getReviewer().toString()%> <%}
 				else{%> Anonymous <%} %> <br> <br>
											<%=type.getSubmissionTime().toString()%>
										</td>
										<td>
											<h4>
												<b> <%=type.getTitle().toString()%>
												</b>
											</h4> <br> <textarea rows="3" cols="105" wrap="hard" readonly
												id="styled">
										<%=type.getReviewText().toString()%>
										</textarea>
										</td>
									</tr>
									<%
										}
										}
									%>

								</tbody>
								<!-- Table Body -->

							</table>

							<br>

							<form action="details.jsp">
							<input type="hidden" name="id" value="<%=itemId%>"/>
								Write a Review: <br> <br> Title: <br>
								<textarea rows="1" cols="50" name="title"></textarea>
								<br>
								<textarea rows="10" cols="50" name="commentContent"></textarea>
								<br><%if(session.getAttribute("username")!=null) {%> <input type="submit" name="post" value="review">
								<%}else {%>  <a href="login.jsp">Login to Post Reviews</a><%} %> <br>
								<br> How did you find the product: <input type="radio"
									name="rating" id="r1" value="1"> Poor <input
									type="radio" name="rating" id="r2" value="2"> Not so
								Bad <input type="radio" name="rating" id="r3" value="3">
								Satisfactory <input type="radio" name="rating" id="r4" value="4">
								Good <input type="radio" name="rating" id="r5" value="5">
								Excellent
							</form>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
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
					<p>The fashion never alters, and as it is neither disagreeable
						nor uneasy, so it is suited to the climate, and calculated both
						for their summers and winters. Every family makes their own
						clothes; but all among them, women as well as men, learn one or
						other of the trades formerly mentioned.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>
					Copyright &copy; 2015 All rights reserved | Template by <a
						href="http://w3layouts.com"> W3layouts</a>
				</p>
			</div>

		</div>
	</div>
</body>
</html>