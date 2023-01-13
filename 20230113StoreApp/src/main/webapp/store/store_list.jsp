<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="store.repository.StoreDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	StoreDAO storeDAO = new StoreDAO();
%>

<%
	// System.out.print(); // 서버에 찍히는 것
	// 비동기로 들어오든 동기로 들어오든 out.print 는 찍어야 함
	// 비동기든 동기든 무조건 서버는 응답을 해야한다 
	// 1) 동기로 들어왔을 경우 (= 화면이 뒤집히는) : HTML로 응답
	// 2) 비동기로 들어왔을 경우(= 화면변화없는) : 화면 전체가 아닌 순수 데이터만 보낸다

	List storeList= storeDAO.selectAll();
	
	// 자바의 자료형을 자동으로 JSON 문자열로 변환해주는 라이브러리 있따
	// = GSON !!
	Gson gson = new Gson();
	String result = gson.toJson(storeList);
	out.print(result);
%>