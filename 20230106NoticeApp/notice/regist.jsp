<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%!
	NoticeDAO noticeDAO = new NoticeDAO();
%>

<%
// 스크립틀릿은 요청이 들어올 때마다 실행되는 영역]
	Notice notice = new Notice();

	request.setCharacterEncoding("UTF-8");
	notice.setTitle(request.getParameter("title"));
	notice.setWriter(request.getParameter("writer"));
	notice.setContent(request.getParameter("content"));
	
	int result = noticeDAO.insert(notice);
	out.print(result);
	// 목록 페이지 나오게
if(result > 0) {
%>
<script>
alert("등록ㅇㅇ");
location.href="/notice/list.jsp";
</script>
<%}else{%>
<script>
alert("등록ㅅㅍ");
history.back(); // 방문한 페이지의 기록 : history
</script>
<%}%>
// 따라서 여기서 DAO를 선언하면 요청 수만큼 생성됨 -> 선언부에서 선언

// 클라이언트로부터 폼의 파라미터들을 넘겨받아 오라클에 넣기

// 드라이버 로드

// 접속

// 쿼리입력

// 닫기

%>