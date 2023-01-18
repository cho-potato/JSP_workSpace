<%@page import="com.jspshop.domain.Admin"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
// 지금 요청이 들어온 클라이언트와 연게된 세션에 admin이라는 키 값이 있다면,
// 그 키 값을 이용하여 AdminDTO를 끄집어 내자

// 현재 요청을 시도한 클라이언트와 연계된 세션(명시하지 않아도 자동으로 됨)
Admin admin = (Admin)session.getAttribute("admin");
if(admin == null) {
	out.print("there is no session");
} else{
	out.print("found session ");
}

%>