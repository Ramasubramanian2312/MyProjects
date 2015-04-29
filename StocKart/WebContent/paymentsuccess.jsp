<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
   	import="edu.neu.cs5200.project.rest.client.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.dao.*"
	import="java.util.*"
	import="java.math.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO udao = new UserDAO();
		CartDao cdao = new CartDao();
		OrderDao odao = new OrderDao();
		String status = request.getParameter("st");
		String trn = request.getParameter("tx");
		double amt = Double.parseDouble(request.getParameter("amt"));
/* 		System.out.println(status+" "+trn);
		System.out.println(amt);
		System.out.println(session.getAttribute("username"));
		System.out.println(session.getAttribute("username").toString()); */
		if("Completed".equals(status) && session.getAttribute("username")!=null)
	{
		Order order = new Order(null,new Date(),status,amt,null,null);
		Payment payment = new Payment();
		int orderId = udao.addOrder(session.getAttribute("username").toString(), order);
		System.out.println(orderId);
		//List<Orderdetail> lod = new ArrayList<Orderdetail>();
		List<Cart> cartlist = cdao.findAllItems(session.getAttribute("username").toString());
		for(int i=0;i<cartlist.size();i++){
			Orderdetail detail = new Orderdetail();
			detail.setOrderDetailId(null);
			detail.setItemId(cartlist.get(i).getItemId());
			detail.setQuantity(cartlist.get(i).getQuantity());
			detail.setName(cartlist.get(i).getName());
			detail.setThumbnailImage(cartlist.get(i).getThumbnailImage());
			detail.setSalePrice(cartlist.get(i).getSalePrice());
			odao.addOrderdetail(orderId, detail);
			payment.setTrxnId(trn);
			payment.setPaymentDate(new Date());
			payment.setAmount(amt);
			payment.setOrderId(orderId);
			odao.addPayment(orderId, payment);
			}
		cdao.clearCart(session.getAttribute("username").toString());%>
		<script>alert("Payment processed successfully!")</script>
		<% response.sendRedirect("index.jsp");
	}
		else
		{
			%>
			<script> alert("Payment not successfull!!! Please try again") </script>
				<%
			response.sendRedirect("index.jsp");
		
		}
	%>
</body>
</html>