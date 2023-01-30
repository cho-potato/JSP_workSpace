<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.util.MessageObject"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page contentType="application/json;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();
%>
<%

	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);
	
	String member_idx=request.getParameter("member_idx");
	
	MessageObject mo=new MessageObject();
	try{
		memberDAO.delete(Integer.parseInt(member_idx));
		sqlSession.commit();
		mo.setCode(1);
		mo.setMsg(member_idx+"회원삭제 성공");
	}catch(MemberException e){
		mo.setCode(0);
		mo.setMsg(e.getMessage());
	}
	mybatisConfig.release(sqlSession);
	
	Gson gson=new Gson();
	out.print(gson.toJson(mo));

%>