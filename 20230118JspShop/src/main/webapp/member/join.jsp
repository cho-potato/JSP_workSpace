<%@page import="com.jspshop.util.ResponseMessage"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();
%>
<jsp:useBean id="member" class="com.jspshop.domain.Member" />
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:setProperty property="*" name="member"/>
<%
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);

	try{
		memberDAO.insert(member);
		sqlSession.commit();
		out.print(ResponseMessage.getMsgURL("가입완료", "/"));
	}catch(MemberException e){
		out.print(ResponseMessage.getMsgBack(e.getMessage()));
	}finally{
		mybatisConfig.release(sqlSession);
	}
	
	

%>