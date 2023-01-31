package mvcapp2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어플리케이션의 모든 요청을 혼자 다 받아서 보다 전문적인 하위 컨트롤러에 전달하기 위한 
// 진입점 컨트롤러 클래스
// 이 클래스의 존재가 없을 경우 하위 모든 컨트롤러들을 직접 서블릿으로 정의해야 하고, 
// 수 많은 매핑이 요구됨 + 각 컨트롤러 간 일관성 없어짐(유지보수 힘듦)
public class DispatcherServlet extends HttpServlet{
	// 온갖 종류의 요청을 받아야 하므로 Get, Post 가리지 않고 처리되어야 함

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	// Get, Post 요청을 하나의 공통 메서드로 몰아버리자 (doRequest라는 내가 정한 이름으로)
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터에 대한 한글처리를 이 시점에 해주면, 하위 컨트롤러마다 해줄 필요 사라짐
		request.setCharacterEncoding("UTF-8"); // 여기까지가 요청을 받는 상태
		
		// 2단계) 요청 분석하기
		String uri = request.getRequestURI();
		if(uri.equals("/blood.do")) {
			// 혈액형 전문 하위 컨트롤러 생성, 메서드 호출 
			BloodController controller = new BloodController();
			controller.execute(request, response); // 3, 4단계에서 끝난걸 여기서 받아옴
			
			System.out.println(1);
			// 5단계) 결과 보여주기
			// request를 살려서 View인 JSP까지 가져가기(forwarding) 심어 놓은 request 객체가 있으면 forwarding
			RequestDispatcher dis = request.getRequestDispatcher("/blood/result.jsp");
			dis.forward(request, response);
			
			System.out.println(2);
			/*
			// 응답을 받은 클라이언트가 지정한 URL로 다시 들어오라는 뜻(재접속)
			response.sendRedirect("/blood/result.jsp"); // out.print("location.href=''/blood/result.jsp;")와 같음
			// 요청객체를 새로 만들기 때문에 result.jsp에서 받아도 심어 놓은 request 객체가 없으니 null 뜸
			*/
			
		} else if(uri.equals("/movie.do")) {
			// 영화 전문 하위 컨트롤러 생성, 메서드 호출
			MovieController controller = new MovieController();
			controller.handle(request, response); // 하위 컨트롤러가 일을 끝낸 3,4 단계 완료 시점
			
			System.out.println(3);
			
			RequestDispatcher dis = request.getRequestDispatcher("/movie/result.jsp");
			dis.forward(request, response);
			
			System.out.println(4);
		}
	}
	
}
