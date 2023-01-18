<%@page import="repository.NoticeDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	NoticeDAO noticeDAO = new NoticeDAO(); 
%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="notice" class="domain.Notice"></jsp:useBean>
<jsp:setProperty name="notice" property="*" />

<%
	int result = noticeDAO.update(notice);
	out.print(result);
%>









