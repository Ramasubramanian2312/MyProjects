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
		AdminDAO udao = new AdminDAO();
		Adminbean admin = new Adminbean();
		admin.setUsername(request.getParameter("username"));
		admin.setPassword(request.getParameter("password"));
		admin = udao.login(admin);
			
		if (admin != null) {
			session.setAttribute("username", admin.getUsername());
			response.sendRedirect("adminindex.jsp");
		} 
		else
		{
			messages.put("adminerror", "Invalid login details");
			request.setAttribute("messages", messages);
        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        	rd.forward(request, response);
		}			
			
	%>

</body>
</html>