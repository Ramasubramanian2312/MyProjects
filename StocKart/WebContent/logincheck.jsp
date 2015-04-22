<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.neu.cs5200.project.models.*,edu.neu.cs5200.project.dao.*,java.util.HashMap,java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		Map<String, String> messages = new HashMap<String, String>();
		UserDAO udao = new UserDAO();
		Userbean user = new Userbean();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user = udao.login(user);
			
		if (user != null) {
			session.setAttribute("username", user.getUsername());
			response.sendRedirect("index.jsp");
		} 
		else
		{
			messages.put("error", "Invalid login details");
			request.setAttribute("messages", messages);
        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        	rd.forward(request, response);
		}			
			
	%>

</body>
</html>