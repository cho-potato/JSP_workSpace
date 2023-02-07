package com.mvc3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.model.BloodAdvisor;

// 혈액형에 대한 요청을 처리하는 하위 컨트롤러
// 3단계 : 일 시키기
// 4단계 : 결과가 있다면 저장
public class BloodController implements Controller{
	// 클래스명을 자동으로 얻어오는 방법
	// BloodContoroller부터 인스턴스를 얻어오는 
	String TAG = this.getClass().getName();
	BloodAdvisor advisor = new BloodAdvisor();
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(TAG + "의 execute 호출");
		
		// 3단계) 알맞은 로직 객체에 일 시키기
		String blood = request.getParameter("blood"); // send.jsp에서 select box의 name
		String msg = advisor.getAdvice(blood); // 결과가 있으니까 msg에 결과받기
		
		// 4단계) 요청객체(request)와 응답객체(response)가 아직 살아 있으므로 요청 객체에 결과 저장
		// 4단계의 결과저장 절차가 있을 경우 request는 살아있어야 하므로 무조건 forwarding 처리해야 한다
		request.setAttribute("msg", msg); // "msg" : result.jsp에서 쓰는 값 / msg : 바로 위 String msg

	}
	public String getViewName() {
		return "/blood/view";
	}
	public boolean isForward() {
		// TODO Auto-generated method stub
		return false;
	}
}
