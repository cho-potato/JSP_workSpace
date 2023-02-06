package com.mvc3.model.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.domain.Board;
import com.mvc3.exception.BoardException;

public class BoardDAO {
	private SqlSession sqlSession; // 2) 주입하기 위한
	
	// 2) 주입 받기 위한 setter 준비 // 누군가가 주입시켜줘야 함
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List selectAll() {
		return sqlSession.selectList("Board.selectAll");
	}
	
	public Board select(int board_idx) {
		return sqlSession.selectOne("Board.select", board_idx);
	}
	
	public void insert(Board board) throws BoardException{
		// SqlSession sqlSession = 세션 팩토리에게 주입받았었음 (트랜잭션땜에)
		int result = sqlSession.insert("Board.insert", board);
		if(result <1) {
			throw new BoardException("등록실패");
		}
	}
	
	public void update(Board board) throws BoardException{
		// SqlSession sqlSession = 세션 팩토리에게 주입받았었음 (트랜잭션땜에)
		int result = sqlSession.update("Board.update", board);
		if(result <1) {
			throw new BoardException("수정실패");
		}
	}
	
	public void delete(int board_idx) throws BoardException{
		// SqlSession sqlSession = 세션 팩토리에게 주입받았었음 (트랜잭션땜에)
		int result = sqlSession.delete("Board.delete", board_idx);
		if(result <1) {
			throw new BoardException("삭제실패");
		}
	}

}
