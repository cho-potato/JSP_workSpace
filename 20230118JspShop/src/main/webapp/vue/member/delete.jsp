<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.util.MessageObject"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@page import="com.jspshop.domain.Member"%>
<%@ page contentType="application/json;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance(); 
	MemberDAO memberDAO = new MemberDAO();
%>
<%
	SqlSession sqlSession  = mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);
	
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	Member member = new Member();
	member.setId(id);
	member.setPass(pass);
	
	MessageObject obj=new MessageObject();
	try{
		memberDAO.delete(member);
		obj.setCode(1);
		obj.setMsg("삭제성공");
	}catch(MemberException e){
		obj.setCode(0);
		obj.setMsg(e.getMessage());
	}
	
	sqlSession.commit();	
	mybatisConfig.release(sqlSession);
	Gson gson = new Gson();
	
	out.print(gson.toJson(obj));
%>