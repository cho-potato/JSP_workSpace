<%@page import="java.util.List"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>


<%! 
	MemberDAO memberDAO = new MemberDAO();

%>
<%
  List memberList = memberDAO.selectAll();

%>