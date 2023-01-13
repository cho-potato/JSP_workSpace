<%@ page contentType="text/html;charset=UTF-8" %> // 헤더 정보
<%@ page import="java.sql.*" %>
<%! //선언부 
    String url="jdbc:oracle:thin:@localhost:1521:XE"; 
    String user="jsp" ; 
    String pwd="1234";

    Connection conn; 
    PreparedStatement pstmt; 
    ResultSet rs; 
%>
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");

    conn = DriverManager.getConnection(url, user, pwd);

    StringBuilder sb = new StringBuilder();
    //sb.append("select m.member_idx as member_idx, id, hobby_name");
    sb.append("select m.member_idx as member_idx, id, count(id) as cnt, regdate");

    //sb.append(" from member m, hobby h");
    sb.append(" from member m, hobby h");
    
    //sb.append(" where m.member_idx=h.member_idx");
    sb.append(" where m.member_idx=h.member_idx");

    //sb.append(" where m.member_idx=h.member_idx");
    sb.append(" group by member_idx, id, regdate");

    pstmt = conn.prepareStatement(sb.toString());
    rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th,
        td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <table>
        <tr>
            <th>member_idx</th>
            <th>아이디</th>
            <th>취미수</th>
            <th>등록일</th>
        </tr>
        <%while(rs.next()) {%>
        <tr>
            <td><%=rs.getInt("member_idx")%></td>
            <td><%=rs.getString("id")%></td>
            <td><%=rs.getInt("cnt")%></td>
            <td><%=rs.getString("regdate")%></td>
        </tr>
        <%}%>
    </table>

</body>
</html>
<%rs.close();%>
<%pstmt.close();%>
<%conn.close();%>