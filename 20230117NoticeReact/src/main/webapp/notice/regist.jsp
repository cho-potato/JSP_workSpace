<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="repository.NoticeDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); //파라미터에 대한 인코딩%>
<%
 	// 서버 측에서 실행될 수 있는 JSP의 태그를 가리켜 빈즈(클래스)태그라 한다
%>
<jsp:useBean id="notice" class="domain.Notice"/>
<jsp:setProperty name="notice" property="*"/>
<%
/*
    String title=request.getParameter("title");
    String writer=request.getParameter("writer");
    String content=request.getParameter("content");

    System.out.println(title);
    System.out.println(writer);
    System.out.println(content);
 */
    System.out.println(notice.getTitle());
    System.out.println(notice.getWriter());
    System.out.println(notice.getContent());
    
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.insert(notice);
	out.print(result); // 결과만 보내면 클라이언트가 이 결과로 무엇을 할지 알아서 하게 하자
%>