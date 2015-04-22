<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="edu.neu.cs5200.project.models.*,model.*,edu.neu.cs5200.project.dao.*,java.util.HashMap,java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Map<String, String> messages = new HashMap<String, String>();
		Userbean user = new Userbean();
		String usrnm = (request.getParameter("username"));
		String email = (request.getParameter("email"));
		String passwd1 = (request.getParameter("pwd1"));
		String passwd2 = (request.getParameter("pwd2"));
		Boolean isAllValid = true;
		UserDAO dao = new UserDAO();
		
		
		if(usrnm != null)
		{
			if(usrnm.trim().isEmpty()) {
                messages.put("user", "Please enter username");
                isAllValid = false;
			}
			
			user.setUsername(usrnm);
			if ((dao.getUname(user)) != null)
			{
				messages.put("user", "Username already exists");
				isAllValid = false;
			}
		}
		
		if (email != null)
		{
			if (email.trim().isEmpty()) {
                messages.put("email", "Please enter email");
                isAllValid = false;
            }		
			EmailValidator validator = new EmailValidator ();
			boolean validEmail = validator.validate(email);
			if(!validEmail)
			{
            	messages.put("email", "Email ID is not valid");
            	isAllValid = false;
			}
		}
		
		if (passwd1 != null)
		{
			if(passwd1.trim().isEmpty()) {
                messages.put("pwd1", "Please enter password");
                isAllValid = false;
            } 	
		}
		
		if (passwd2 != null)
		{
			if(passwd2.trim().isEmpty()) {
                messages.put("pwd2", "Please enter password");
                isAllValid = false;
            } 	
		}
		
		if(! passwd1.equals(passwd2))
		{
           messages.put("pwd3","Passwords do not match" );
           isAllValid = false;
		}
		
		if (!isAllValid)
		{
			request.setAttribute("messages", messages);
        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        	rd.forward(request, response);
		}
		else
		{
			UserDAO udao = new UserDAO();
			user.setUsername(usrnm);
			user.setEmailId(email);
			user.setPassword(passwd1);
			udao.signup(user);
			response.sendRedirect("index.jsp");
		}
		
		//if (user != null) {
			//session.setAttribute("username", user.getUsername());
			//response.sendRedirect("index.jsp");

		//} else
			//response.sendRedirect("index.jsp");
	%>
</body>
</html>