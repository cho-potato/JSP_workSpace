<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%> // 임포트를 할 수 있는 곳은 지시영역
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
/*
 JSP는 java 기술로 작성된 페이지이자, 오직 서버에서만 실행되는 스크립트이다
 클라이언트의 html문서로부터 전송되어 온, 파라미터(변수)들을 넘겨받아 오라클에 넣어보자
 특히, 오라클에 넣을 때 기존 JavsSE시절 연동코드를 그대로 사용하면 된다
*/

// 클라이언트에서 전송된 파라미터 받기
// 내장 객체 중 요청 정보를 가진 request 객체를 사용한다

// request.getParameter("html상 변수명"); // 변수를 넘겨받자, 웹상으로 넘어온 변수는 무조건 String으로 받음

String id = request.getParameter("id"); // ID를 넘겨받자. 
String pass = request.getParameter("pass");
String name = request.getParameter("name");

out.print("넘어온 ID " + id);
out.print("넘어온 PASS " + pass);
out.print("넘어온 NAME " + name);

// 넘겨받은 파라미터(전송된 변수)들을 오라클에 넣기

// 코드를 분리시키지 않고 그냥 진행(DAO없이,,,)
    Class.forName("oracle.jdbc.driver.OracleDriver");
    out.print("<br>");
    out.print("드라이버 로드 성공");

String url = "jdbc:oracle:thin:@localhost:1521:XE";
String user = "javase";
String pwd = "1234";

Connection conn = DriverManager.getConnection(url, user, pwd);
if(conn != null) {
    out.print(" 접속성공 ");
} else {
    out.print(" 접속실패 ");
}

PreparedStatement pstmt = null;

String sql = "insert into member2(member2_idx, id, pass, name)";
sql+= " values(seq_member2.nextval, ?, ?, ?)";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);

int result = pstmt.executeUpdate(); // DML
if(result > 0) {
    out.print(" 가입성공 ");
} 
pstmt.close();
conn.close();


%>