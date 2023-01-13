<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
%>
<%= "hi" + name%>