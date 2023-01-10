<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
// 설정된 커넥션 풀이 제대로 동작할 수 있는지 체크

// 검색능력
InitialContext context = new InitialContext();
// 외부자원을 이름으로 검색하기
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); // java:comp/env 암기

// 얻어온 커넥션 풀로부터 Connection 하나를 대여하자
Connection conn = ds.getConnection();
out.print(conn);

conn.close();
%>