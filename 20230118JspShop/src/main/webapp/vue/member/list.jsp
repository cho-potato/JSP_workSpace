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
	List<Member> member=null;
	String member_idx=request.getParameter("member_idx");

	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);
	

		member=memberDAO.selectAll();
		Gson gson=new Gson();
		String memberList=gson.toJson(member);
		out.print(memberList);

		//member=memberDAO.select(Integer.parseInt(member_idx));
		//Gson gson=new Gson();
		//String memberList=gson.toJson(member);
		//out.print(memberList);
	
%>