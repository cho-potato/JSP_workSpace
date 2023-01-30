package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.blood.BloodAdvisor;

// 이 클래스는 MVC에서 컨트롤러로서의 역할을 수행한다
// 컨트롤러 ? Model과 View를 분리시키기 위한 중간역할
/*
 * JavaEE 분야에서 MVC 개발방법론을 적용하려면 다음과 같다
 * 1) Model - 재사용 가능한 중립적 코드여야 하므로 순수 java 이용
 * 					Plain Old Java Object(POJO) : 어느 플랫폼에도 속하지 않은 순수한 자바
 * 2) View - 웹 서버에서 실행될 수 있으며 디자인도 표현 가능한 객채
 * 					JSP가 그 역할을 수행한다 (JSP에 로직이 들어있으면 안됨)
 * 3) Controller - 웹 서버에서 실행될 수 있으며 클라이언트의 요청과 응답을 처리할 수 있는 객체
 * 						Servlet이 그 역할을 수행
 * 
 * 모델 2 - JavaEE로 구현한 MVC 패턴 (MVC는 이론이고, 그 이론을 구현한 것을 모델2라고 함)
 * 모델1 - 우리가 지금까지 써왔던 방식(JSP가 디자인 및 컨트롤러까지 모두 감당)
 * 
 */
// public class BloodController extends HttpServlet{
public class BloodController {
	BloodAdvisor advisor = new BloodAdvisor();
	
	// protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");
		String blood = request.getParameter("blood");
		
		// 현재 코드에서 중립적인 자바 코드는 굳이 JSP 안에 둘 필요가 없다
		// 미래의 재사용성을 위해 별도로 분리시켜 놓아야 한다
		
		// 3단계 업무) 알맞는 로직 객체에게 일 시키기
		String msg = advisor.getAdvice(blood);
		
		// 출력은 가능하지만 출력하면 안된다
		// M, V, C로 개발하기 위해 철저히 분리하고 있는 상황에 out.print()를 쓰면 View가 되어버림
		// 이제 result.jsp에 뿌려야 함 가서 <%%> 지움
		// 지역변수인 msg를 result.jsp에 가져갈 방법을 알아보자
		// out.print(msg); 
		// System.out.println(msg);
	/*
		// 결과를 보여주는 View 역할을 하는 페이지가 result.jsp이므로
		// result.jsp가 결과를 참조할 수 있도록 어딘가에 저장해놓자 -> session에 담아보자
		// jsp가 아니기 때문에 내장객체가 없으므로 
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg); // 세션에 담기만 하고 응답은 안한 상태
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 응답하기
		out.print("<script>");
		out.print("location.href='/blood/result.jsp';");
		out.print("</script>");		
	*/
		
		// 엔터프라이즈 급의 어플리케이션에서 모든 정보를 세션에 담아버리면 세션이 너무 비대해진다
		// 해결 ? 세션의 역할을 수행할 수 있는 객체가 있다면 세션이 가벼워진다
		// 요청이 들어오면 이 요청에 대해 응답을 보류하고, 서버의 특정 서블릿으로 요청의 방향을 전달하는 방법을 가리켜
		// forwarding이라 한다
		// forwarding을 이용하면 현태 요청에 대한 응답을 하지 않은 상태이므로 request, response 객체가 죽지 않고 유지된다
		// 따라서 죽지 않은 request 객체에 원하는 정보를 세션에 담듯 이용할 수 있다
		
		// request.getRequestDispatcher("포워딩 할 주소")
		request.setAttribute("msg", msg); // 4단계) 결과 저장
		// 5단계) 요청을 받았으니 결과 내보내는 것도 처리 -> DispatcherServlet.java에서
//		RequestDispatcher dis = request.getRequestDispatcher("/blood/result.jsp");
//		
//		// 포워딩 시작
//		dis.forward(request, response); // 죽지 않은 request와 response 가져가기 like 114

		/* 포워딩으로 대체되었기 때문에 필요없음 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		out.print("location.href='/blood/result.jsp';");
		out.print("</script>");
		*/	
	}
}
