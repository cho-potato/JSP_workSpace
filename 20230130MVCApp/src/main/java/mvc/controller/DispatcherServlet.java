package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.board.RegistController;

/*
 * 하위 컨트롤러들이 직접 요청을 받게 되면 업무의 효율성과 유지보수성이 저하된다
 * 우리의 경우 너무 많은 서블릿 매핑이 필요하게 된다
 * 따라서,. 규모가 아무리 커질지라도 모든 요청을 하나의 진입점으로 몰아서
 * 요청의 유형을 분석하여 적절한 컨트롤러에게 배분할 역할이 필요하다
 * 서버에서 돌아가면서 요청도 받을 수 있는 형태가 필요하므로 서블릿으로 간다 
 * 
 * 컨트롤러의 전형적 업무 5가지
 * 1. 요청을 받고, 받을 수 있어야 한다 (doPost, doGet) (입구 컨트롤러)
 * 2. 요청을 분석한다(전문성 있는 컨트롤러에 전달하기 위해) -> 여기까지가 doRequest 역할 (입구 컨트롤러)
 * 		-> 알맞는 하위 컨트롤러를 선택하여 요청을 전달
 * -------------------------------------------------------------------------------------------------
 * 3. 알맞는 모델 객체에게 일을 시킨다 (직접 하는 순간 컨트롤러가 모델이 되어버림) (하위 컨트롤러)
 * 4. 결과가 있을 경우 결과를 저장해둔다(엔지니어 -> 컨트롤러) (웹인 경우 session, request)
 * 5. 결과를 보여준다 (.jsp)
 */

// 어떤 것이든 감당해야 되기 때문에 doPost 와 doGet 모두를 감당해야 함
public class DispatcherServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	// doPost로 들어오든 doGet으로 들어오든 doRequest(이름은 맘대로) 로 처리할거임(코드중복방지) 요청객체(request)와 응답객체(response)만 잘 받으면 됨
	// 들어온 요청을 분석해서 알맞은 컨트롤러에 넘겨주기만 하면 되는 역할	(컨트롤러의 업무 중 2단계 수행)
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 1단계 : 요청을 받는다
		System.out.println("요청받았음");
		// 2단계 : 현재 컨트롤러는 전문성이 없으므로, 담당 컨트롤러를 선택한다
		// 뭐가 들어왔는지 어케 암? request에 답이 있음
		String uri = request.getRequestURI();
		System.out.println("클라이언트의 요청 URI는 "+ uri);
		// 이 단서가지고 뭐할건데
		// 요청을 분석하자 = 담당 컨트롤러를 선택하기 위해서
		if(uri.equals("/blood.do")) {
			// 2단계) 혈액형 담당 컨트롤러 호출
			BloodController controller = new BloodController();
			controller.execute(request, response); // 하위 컨트롤러와 연결
			
		} else if(uri.equals("/movie.do")) {
			// 2단계) 영화 담당 컨트롤러 호출
			MovieController controller = new MovieController();
			// controller.메서드();
			
		} else if(uri.equals("/board/regist.do")) {
			// 2단계)
			RegistController controller = new RegistController();
			controller.regist();
		}
		
		// 5단계) 요청을 받았으니 결과 내보내는 것도 처리
		RequestDispatcher dis = request.getRequestDispatcher("/blood/result.jsp");
		
		// 포워딩 시작
		dis.forward(request, response); // 죽지 않은 request와 response 가져가기 like 114
		
		
	}
	
	
}
