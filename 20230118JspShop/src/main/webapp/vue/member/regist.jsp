<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();

%>

<%
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String email=request.getParameter("email");

	Member member=new Member();
	
	member.setId(id);
	member.setPass(pw);
	member.setName(name);
	member.setEmail(email);
	
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	try{
		memberDAO.setSqlSession(sqlSession);
		memberDAO.insert(member);
		
		sqlSession.commit();
	}catch(MemberException e){
		sqlSession.rollback();
		
	}finally{
		mybatisConfig.release(sqlSession);
	}
	
	
%>