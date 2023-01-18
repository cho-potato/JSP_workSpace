<%@page import="com.google.gson.Gson"%>
<%@page import="com.jspshop.util.MessageObject"%>
<%@page import="com.jspshop.domain.Admin"%>
<%@page import="com.jspshop.repository.AdminDAO"%>
<%@page language="java" contentType="application/json;charset=UTF-8"%>
<%
	AdminDAO adminDAO = new AdminDAO();
%>
<% 
	// 로그인 폼으로부터 전송된 파라미터 받기
	// 한글사항이 없기 때문에 인코딩 안하고 넘어감
	
	String admin_id = request.getParameter("admin_id");
	String admin_pass = request.getParameter("admin_pass");
	// String admin_name = request.getParameter("admin_name");
	
	// System.out.println("admin_id");	
	// System.out.println("admin_pass");	
	
	// Thread.sleep(3000);
	
	Admin admin = new Admin(); // empty
	admin.setAdmin_id(admin_id);
	admin.setAdmin_pass(admin_pass);
	
	Admin obj = adminDAO.select(admin);
	
	MessageObject msg = new MessageObject();
	Gson gson = new Gson();
	
	if(obj !=null) { // 객체가 존재한다는 것은 로그인 성공
		// 세션 객체에 obj를 담아두고 다음 번에 들어왔을 때도 이 유저를 알아봐 준다
		// 서블릿에서는 HTTP 
		// session은 맵이다. key-value 쌍으로 관리한다. 키 값은 정하기 나름
		session.setAttribute("admin", obj); // 세션에 저장
		// 일정시간 동안 접속 유지 / 브라우저 클로징 없을 때

		msg.setCode(1);
		msg.setMsg("인증성공");
		
	} else {
		msg.setCode(0);
		msg.setMsg("인증실패");
	}
	String result = gson.toJson(msg);
	out.print(result);
%>