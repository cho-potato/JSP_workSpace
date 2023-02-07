package com.mvc3.controller.emp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.controller.Controller;
import com.mvc3.model.emp.EmpService;

// 사원 목록 요청을 처리하는 하위 컨트롤러
// 가지고만 있다가 EmpService 만들고나서 몸체 채움
public class ListController implements Controller{
	EmpService empService = new EmpService(); // 1) DAO대신 서비스 보유

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ListController : 목록 요청을 처리할 예정 ");
		
		// 2) 3단계 일 시키기
		List empList = empService.selectAll();
		// empList가 jsp까지 살아있어야 하므로 
		// application, session, request 중 원하는 객체에 보관해 놓을 수 있다
		// 특히 request에 넣게 되면 요청에 대한 응답을 하면 안되고, 서버상에 존재하는 결과 jsp로 곧바로 포워딩해야한다
		
		// 3) 4단계
		request.setAttribute("empList", empList); 
		
	}

	public String getViewName() {
		return "/emp/view/list";
	}

	public boolean isForward() {
		return true; // 3) 4단계가 있으면 언제나 true
	}

}
