<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%!
	NoticeDAO noticeDAO = new NoticeDAO();
%>
<%
	// 넘겨받은 4개의 파라미터를 이용히여 UPDATE문 수행
	// 수행하고 다시 상세페이지 보여주기(상세페이지 재요청)
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String notice_idx = request.getParameter("notice_idx"); // String으로 받아서 어떻게 출력되는지 확인부터 해보자

	out.print("넘겨받은 notice_idx = " + notice_idx+"<br>"); 
	out.print("넘겨받은 title = " + title+"<br>");
	out.print("넘겨받은 writer = " + writer+"<br>");
	out.print("넘겨받은 content = " + content+"<br>");

	// DTO에 담기 
	// 선언부에 만들면 찌꺼기가 남기 때문에 받아올 때마다 새로 담게 하는 것이 낫다
	Notice notice = new Notice();
	notice.setNotice_idx(Integer.parseInt(notice_idx));
	notice.setTitle(title);
	notice.setWriter(writer);
	notice.setContent(content);

	// noticeDAO 호출
	int result = noticeDAO.update(notice);
	out.print("<script>");
	if(result > 0) {
		out.print("alert('수정성공');");
		// 웹브라우저로 하여금 지정한 URL 로 재접속하게 하자
		out.print("location.href='/notice/content.jsp?notice_idx="+notice_idx+"';");
	} else {
		out.print("alert('수정실패');");
		out.print("history.back();");
	}
		out.print("</script>");

%>