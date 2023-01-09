<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%!
    //선언부
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "jsp";
    String pwd = "1234";

    Connection conn;
    PreparedStatement pstmt;
    PreparedStatement pstmt2;
    ResultSet rs;
%>
<%
    out.print("등록 JSP 요청 결과");

    // 전송되는 파라미터에 대한 인코딩 처리
    request.setCharacterEncoding("UTF-8");

    // 클라이언트가 전송한 파라미터들 받기
    String id = request.getParameter("id"); // name parameter값에서 알 수 있음
    String pass = request.getParameter("pass"); // name parameter값에서 알 수 있음
    String[] hobby_name = request.getParameterValues("hobby_name");
    String mail_receive = request.getParameter("mail_receive");

    out.print("<br>");
    out.print("id is " + id+"<br>");
    out.print("pass is " + pass+"<br>");
    for(int i = 0; i<hobby_name.length; i++) {
        out.print("hobby_name is " + hobby_name[i]+"<br>");
    }
    out.print("mail_receive is " + mail_receive+"<br>");

    // 드라이버 로드
    Class.forName("oracle.jdbc.driver.OracleDriver");
    // 접속
    conn = DriverManager.getConnection(url, user, pwd);

    // Connection 객체는 default가 autoCommit이 true인 상태이기 때문에
    // 무조건 transaction commit하고 있으니 false로 바꾸자
    conn.setAutoCommit(false); // 자동커밋 막기
    // 왜 막아야하나? 개발자가 원할 때 commit하려고

    StringBuilder sb = new StringBuilder();
    try {
        // 회원가입
        sb.append("insert into member(member_idx, id, pass, mail_receive)");
        sb.append(" values(seq_member.nextval, ?, ?, ?)");

        pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, id);
        pstmt.setString(2, pass);
        pstmt.setString(3, mail_receive);

        int result = pstmt.executeUpdate();
        out.print("<br>");
        out.print("회원등록결rhk" + result);

        // 취미 테이블에 레코드를 넣기 위해서 부모 테이블은 member
        // 방금 들어간 PK를 얻어와야 한다
        sb.delete(0, sb.length());
        sb.append("select seq_member.currval as member_idx from dual");

        pstmt2 = conn.prepareStatement(sb.toString());

        rs = pstmt2.executeQuery();

        int member_idx = 0;
        if(rs.next()) { // 레코드가 있다면
            member_idx = rs.getInt("member_idx");
        }

        // 사용자가 체크한 수만큼 반복문 돌리면서 insert
        sb.delete(0, sb.length()); // 기존 쿼리 삭제

        for(int i = 0; i<hobby_name.length; i++) {
            PreparedStatement pstmt = null;
            
            sb.append("insert into hobby(hobby_idx, member_idx, hobby_name)");
            sb.append(" values(seq_hobby.nextval, ?, ?)");
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, member_idx); // foreign key
            pstmt.setString(2, hobby_name[i]);

            pstmt.executeUpdate();
            pstmt.close();

            sb.delete(0, sb.length());
        }
        conn.commit(); //  트랜잭션 성공으로 확정짓기
        out.print("<script>");
            out.print("alert('와아ㅏㅘ와와ㅘㅇ앙ㅇㅇ앙ㅇ아아ㅏㅏ');");
            out.print("location.href='/list.jsp';");
        out.print("</script>");
    } catch(Exception e) {
        //  에러가 발생하면 없었던 일로 돌려놓자
        conn.rollback(); // 트랜잭션 실패로 확정짓기
    } finally {
        conn.setAutoCommit(true);
    } 


    pstmt2.close();
    pstmt.close();
    conn.close();

%>