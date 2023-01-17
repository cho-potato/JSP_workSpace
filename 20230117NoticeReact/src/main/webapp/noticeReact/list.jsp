<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeReact.domain.NoticeReact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json;charset=UTF-8"%>
<%
	List<NoticeReact> noticeList = new ArrayList();

	for(int i = 0; i<10; i++) {
	NoticeReact noticeReact = new NoticeReact();
	noticeReact.setNotice_idx(i);
	noticeReact.setTitle("감자"+i+"개");
	noticeReact.setWriter("감자"+i);
	noticeReact.setRegdate("202"+i+".01.1"+i);
	
	noticeList.add(noticeReact);
	}
	
	
	Gson gson = new Gson();
	String jsonList = gson.toJson(noticeList);
	out.print(jsonList);
%>