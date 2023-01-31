package mvcapp2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvcapp2.model.movie.MovieAdvisor;

public class MovieController {
	// 3단계) 일 시킬 로직 호출하기
	MovieAdvisor advisor = new MovieAdvisor();
	
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		// 3단계) 알맞은 로직 객체에 일 시키기
		
		String movie = request.getParameter("movie");
		String msg = advisor.getAdvice(movie); // 곧 죽기 때문에 포워딩 해야함(다른 곳에서)

		// 4단계) 추후 DispatcherServlet이 포워딩 처리할 때 
		// request 객체를 사용하게 되므로 결과를 이 객체에 저장해놓자
		request.setAttribute("msg", msg);
		
	}
}
