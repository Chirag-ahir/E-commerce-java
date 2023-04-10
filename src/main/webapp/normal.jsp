<%@page import="mycart.ecommerce.entity.User" %>
<%
	
	User user = (User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","Please login to your account");
		response.sendRedirect("login.jsp");
		return;	
	}

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Normal Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp" %>

</body>
</html>