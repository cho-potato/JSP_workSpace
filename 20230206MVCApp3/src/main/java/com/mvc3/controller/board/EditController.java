package com.mvc3.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Board;
import com.mvc3.model.board.BoardDAO;
import com.mvc3.mybatis.MybatisConfig;

public class EditController implements Controller{
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	BoardDAO boardDAO = new BoardDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		boardDAO.setSqlSession(sqlSession);
		
		Board board =new Board();
		board.setBoard_idx(Integer.parseInt(request.getParameter("board_idx")));
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setContent(request.getParameter("content"));
		
		boardDAO.update(board);		
		
		//4단계
		request.setAttribute("board", board); //수정 dto 저장
		
		sqlSession.commit();
		mybatisConfig.release(sqlSession);
	}

	@Override
	public String getViewName() {
		return "/board/view/update";
	}

	@Override
	public boolean isForward() {
		return true;
	}
	
}