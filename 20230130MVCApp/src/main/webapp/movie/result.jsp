<%@page import="mvc.model.blood.BloodAdvisor"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	선택한 영화는 : 
	<p>
	<%=msg %>
</body>
</html>