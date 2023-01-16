<%@page import="com.google.gson.Gson"%>
<%@page import="empapp.domain.Emp"%>
<%@page import="java.util.List"%>
<%@page import="empapp.repository.EmpDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	EmpDAO empDAO = new EmpDAO();
%>
<% 
	 String category = request.getParameter("category");
	 String keyword = request.getParameter("keyword");
	 System.out.println("category is "+ category);
	 System.out.println("keyword is "+ keyword);
	 
	 // DTO가 검색기능을 담을 수 없기 때문에 Map에 담아서 mybatis에 전달
	 HashMap<String, String> map = new HashMap();
	 
	 map.put("category", category); // 컬럼명 담기
	 map.put("keyword", keyword); // 키워드 담기
	 
	 List<Emp> empList = empDAO.selectBySearch(map);
	 
	 Gson gson = new Gson();
	 out.print(gson.toJson(empList));
%>