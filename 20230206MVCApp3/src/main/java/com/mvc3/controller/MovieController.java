package com.mvc3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.model.MovieAdvisor;

// 혈액형에 대한 요청을 처리하는 하위 컨트롤러
// 3단계 : 일 시키기
// 4단계 : 결과가 있다면 저장
public class MovieController implements Controller{
	// 클래스명을 자동으로 얻어오는 방법
	// BloodContoroller부터 인스턴스를 얻어오는 
	String TAG = this.getClass().getName();
	MovieAdvisor advisor = new MovieAdvisor();
	
	// public void handle(HttpServletRequest request, HttpServletResponse response) {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 클래스명을 자동으로 얻어오는 방법
		// BloodContoroller부터 인스턴스를 얻어오는 
		System.out.println(TAG + "의 handle 호출");
		
		// 3단계) 일시키기
		String movie = request.getParameter("movie"); // 파라미터 받기
		String msg = advisor.getAdvice(movie);
		
		// 4단계) 결과 저장
		request.setAttribute("msg",msg);
	}
	public String getViewName() {
		return "/movie/view";
	}
	public boolean isForward() {
		// TODO Auto-generated method stub
		return false;
	}
}
