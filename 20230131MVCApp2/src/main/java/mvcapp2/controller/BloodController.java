package mvcapp2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvcapp2.model.blood.BloodAdvisor;

// 3단계) 알맞은 비즈니스 로직 객체에게 일을 시키는 하위 컨트롤러 정의
public class BloodController {
	BloodAdvisor advisor = new BloodAdvisor(); // BloodAdvisor.java 생성하고 불러오기
	
	// 서블릿이 아니기에 자유롭게 만들 수 있다
	// 메서드명은 자유롭게 정할 수 있지만 request, response는 있어야 한다
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 이제 일을 시켜야 하는데 로직 객체를 재사용하기 위한 것이므로 걍 가져오면 됨(BloodAdvisor)
		
		// 3단계) 알맞은 로직 객체에 일 시키기
		String blood = request.getParameter("blood");
		String msg = advisor.getAdvice(blood); // 여기서 죽지않고 고객에게 전달까지 되어야 함
		System.out.println("execute"+1);
		// 4단계) (클라이언트에게 전달할) 결과가 있으므로 임시적으로 저장해놓아야 한다
		// 저장(session 보다는 request에 보관한ㄷㅏ)
		// 여기서의 request 객체는 응답하기 전까지는 생명력이 있으므로
		// forwarding 처리로 전달하면 View인 JSP까지는 죽지않고 도달할 수 있다(굳이 session을 쓸 이유 없음)
		// 클라이언트에 의한 요청이 아니라 서버에 의한 요청
		request.setAttribute("msg", msg); // blood/result.jsp에서 기대하는 값(msg)을 넣으면 됨
		System.out.println("execute"+2);
		// 5단계) 결과 보여주기 -> 전면부 컨트롤러로 가자
		// 형 나 다햇어 형이 보여주면 돼
		// 실질적으로 JSP에 날린 것은 주소값이다
		
	}
}
