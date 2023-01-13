/*
자바는 클래스 기바 언어이므로 JavaEE를 개발할 때도 
분명 JSP가 아니더라도 클래스를 이용하여 요청/응답을 처리할 수 있다
이렇게 오직 서버에서만 실행되며, 웹상의 요청과 응답을 처리할 수 있는 클래스를 가리켜 Servlet이라 한다
*/



package myservlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;


public class TestServlet extends HttpServlet{
	// 이 클래스는 웹 기반의, 즉 http기반의 요청과 응답을 처리하기 위한 클래스이므로
	// 클라이언트가 get방식으로 요청을 하면 doGet()으로 처리하고,
	// 클라이언트가 post방식으로 요청하면 doPost()로 처리하면 된다
	// 작성된 Servlet 클래스는 웹브라우저에서 그 명칭을 직접 접근할 수 없다.
	// 해결 : 매핑을 통해 SUN에서 정한 규칙을 따르자(WEB.xml)
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트에 이름을 응답정보로 보내보자
		// 순수한 클래스로도 서버의 요청과 응답을 처리할 수 있다 (주제)
		PrintWriter out = response.getWriter(); // 문자기반 출력스트림 // 여기서의 out이 JSP의 out.print의 out과 동일
		out.print("zino");
	}

}
