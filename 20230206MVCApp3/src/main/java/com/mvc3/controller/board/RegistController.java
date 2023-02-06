package com.mvc3.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Board;
import com.mvc3.model.board.BoardDAO;
import com.mvc3.mybatis.MybatisConfig;

// 등록요청을 처리하는 하위 컨트롤러
public class RegistController implements Controller{
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	BoardDAO boardDAO = new BoardDAO();
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 글쓰기 요청처리(글쓰기 일 시키기)
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		boardDAO.setSqlSession(sqlSession);
		
		Board board = new Board(); // empty DTO 생성
		
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setContent(request.getParameter("content"));
		
		boardDAO.insert(board); // 3단계) 글쓰기
		sqlSession.commit(); // 커밋
		mybatisConfig.release(sqlSession); // 반납
		
		// 글 쓴 다음 클라이언트가 볼 것이 없기 때문에 4단계는 없고, 목록으로 재접속 처리를 하면 됨
		
	}

	public String getViewName() {
		return "/board/view/regist";
	}

	// 글 등록 후에는 forward가 아니라 Redirect를 해야 갱신된 목록을 볼 수 있다
	// 만약 안했을 경우 regist.do가 남아있기 때문에 새로고침만으로도 글 등록이 되어버림
	public boolean isFoward() {
		return false;
	}
	
	
}
