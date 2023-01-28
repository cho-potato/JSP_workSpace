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
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	
	Member member = new Member();
	member.setId(id);
	member.setPass(pass);
	member.setName(name);
	member.setEmail(email);
	
	System.out.println("클라이언트의 파라미터값 "+ member);
	
	MessageObject obj=new MessageObject();
	
	try{
		memberDAO.insert(member);
		obj.setCode(1);
		obj.setMsg("등록성공");
	}catch(MemberException e){
		obj.setCode(0);
		obj.setMsg(e.getMessage());
	}
	
	sqlSession.commit();	
	mybatisConfig.release(sqlSession);
	Gson gson = new Gson();
	
	System.out.println(gson.toJson(obj));
	
	out.print(gson.toJson(obj));
%>