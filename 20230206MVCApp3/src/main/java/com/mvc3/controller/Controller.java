package com.mvc3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// MovieController, BloodController 등의 모든 하위 컨트롤러의 최상위 클래스
public interface Controller {
	// 몸체{}를 만들지 않는 이유는 자식들로 하여금 구현강제하기 위해서 
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
	// 뷰 페이지 반환 
	public String getViewName();
	
	// 포워딩 여부
	public boolean isForward();
	
}
