<%@page import="repository.NoticeDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%! 
	NoticeDAO noticeDAO = new NoticeDAO();
%>
<% 
	String notice_idx = request.getParameter("notice_idx");
	int result = noticeDAO.delete(Integer.parseInt(notice_idx));
	out.print(result);
%>