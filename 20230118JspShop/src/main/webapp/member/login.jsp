<%@page import="com.jspshop.util.ResponseMessage"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	MemberDAO memberDAO = new MemberDAO();
%>
<%
	//로그인 성공 후, 사용자의 기록을 메모리에 남겨놓기 위해(회원서비스위함)
	//세션객체에 로그한 결과인 DTO를 담아놓자(키이름: member )
	//쇼핑몰 메인 보여주기
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	Member member = new Member(); //empty
	
	member.setId(id);
	member.setPass(pass);
	
	SqlSession sqlSession = mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession); //injection 
	
	try{
		Member obj= memberDAO.select(member);
		session.setAttribute("member", obj);//세션에 담아두기
		//메인페이지 보여주기
		out.print(ResponseMessage.getMsgURL("로그인 성공", "/"));
	}catch(MemberException e){
		//에러페이지 보여주기 
		out.print(ResponseMessage.getMsgBack(e.getMessage()));
	}finally{
		mybatisConfig.release(sqlSession);			
	}
	
%>