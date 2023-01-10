<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
	//  로그아웃이란, 서버 측의 현재 클라이언트가 사용 중인 세션 객체를 무효화시키는 것이다.
	// 무효화 이후엔 더이상 세션을 사용할 수 없다
	// 객체 자체를 죽이지는 못한다(비활성화 시킬 뿐)
	// 자바에서 객체의 소멸은 Garbage Collector가 담당한다
	
	session.invalidate();
	
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="/gallery/list.jsp";
</script>