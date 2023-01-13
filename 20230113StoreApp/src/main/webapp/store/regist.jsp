<%@page import="store.repository.StoreDAO"%>
<%@page import="store.domain.Category"%>
<%@page import="store.domain.Store"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	StoreDAO storeDAO = new StoreDAO(); 
%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 받기
	String lati = request.getParameter("lati");
	String longi = request.getParameter("longi");
	String category_idx = request.getParameter("category_idx");
	String store_name = request.getParameter("store_name");

	System.out.println("lati = " + lati);
	System.out.println("longi = " + longi);
	System.out.println("category_idx = " + category_idx);
	System.out.println("store_name = " + store_name);
	
	Store store = new Store(); // empty 
	store.setLati(Double.parseDouble(lati));
	store.setLongi(Double.parseDouble(longi));
	store.setStore_name(store_name);
	
	Category category = new Category(); // empty
	category.setCategory_idx(Integer.parseInt(category_idx));
	
	// 생성된 Category를 Store DTO에 대입
	store.setCategory(category);
	
	int result = storeDAO.insert(store);
	out.print(result);
	
%>