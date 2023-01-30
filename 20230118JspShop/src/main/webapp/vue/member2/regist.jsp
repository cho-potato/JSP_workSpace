<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.util.MessageObject"%>
<%@page import="com.jspshop.exception.MemberException"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.MemberDAO"%>
<%@ page contentType="application/json;charset=UTF-8"%>

<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();
	MemberDAO memberDAO=new MemberDAO();
%>
<% 
	//dao 주입(injection)
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	memberDAO.setSqlSession(sqlSession);
	
	//Member member=new Member();
	//member.setName(name);
	//member.setId(id);
	//member.setPass(pass);
	//member.setEmail(email)
	
	//파라미터 받기 전에 설정해야한다.
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.jspshop.domain.Member" />
<jsp:setProperty property="*" name="member" />
<%
	System.out.println(member.getId());
	System.out.println(member.getPass());
	System.out.println(member.getName());
	System.out.println(member.getEmail());
	
	MessageObject mo=new MessageObject();
	try{
		memberDAO.insert(member);
		mo.setCode(1);
		mo.setMsg("등록성공");
		sqlSession.commit();//두개를 묶은 적이 없기 때문에 commit만 해주면 됨. rollback는 필요 X
	}catch(MemberException e){
		mo.setCode(0);
		mo.setMsg(e.getMessage());//DAO에서 이미 등록해둠
	}
	Gson gson=new Gson();
	out.print(gson.toJson(mo));//json문자열로 변환하여 결과전송
	
	mybatisConfig.release(sqlSession);
%>