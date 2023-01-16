<%@page import="com.google.gson.Gson"%>
<%@page import="empapp.domain.Emp"%>
<%@page import="java.util.List"%>
<%@page import="empapp.repository.EmpDAO"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	EmpDAO empDAO = new EmpDAO();
%>
<%
	String deptno = request.getParameter("deptno");
	List<Emp> empList = empDAO.selectByFKey(Integer.parseInt(deptno));
	
	Gson gson = new Gson();
	String jsonList = gson.toJson(empList);
	out.print(jsonList);
%>