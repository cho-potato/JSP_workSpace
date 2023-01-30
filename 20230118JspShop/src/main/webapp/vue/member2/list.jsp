<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page contentType="application/json;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();
%>
<%
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);
	
	List<Member> memberList=memberDAO.selectAll();
	Gson gson=new Gson();
	String jsonList=gson.toJson(memberList);
	out.print(jsonList);
	
	mybatisConfig.release(sqlSession);
	
%>