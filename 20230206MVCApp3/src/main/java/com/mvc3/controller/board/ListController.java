package com.mvc3.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.model.board.BoardDAO;
import com.mvc3.mybatis.MybatisConfig;

// 목록 요청을 처리하는 하위 컨트롤러
// 3, 4단계 수행
// 프레임 틀 내에서 개발해야 하기 때문에 자유도가 없음 
public class ListController implements Controller{
	BoardDAO boardDAO = new BoardDAO(); // 1) 일 시킬 놈 메모리 올리기
	MybatisConfig mybatisConfig = MybatisConfig.getInstance(); // 3) 주입하기 위해 SqlSession 가져오기
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 2) 목록 가져오기
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		boardDAO.setSqlSession(sqlSession); // 주입

		// 4) 3단계 일 시키기
		List boardList = boardDAO.selectAll();
		
		// 5) 4단계 : application(서버 가동되는 동안), session(세션범위), request(요청 종료시까지)
		 request.setAttribute("boardList", boardList);
	}
	
	public String getViewName() {
		// 6) 
		return "/board/view/list"; // 확장자 jsp 넣으면 안됨
	}

	public boolean isFoward() {
		return true;
	}
	
}
