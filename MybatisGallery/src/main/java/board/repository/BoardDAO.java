package board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.domain.Board;
import board.mybatis.MybatisConfig;

public class BoardDAO {
	// 아래 싱글턴 개체의 인스턴스가 메모리에 생성될 때 
	// 동시에 멤버변수로 존재하는 SqlSessionFactory로 올라간다(한번만)
	MybatisConfig config = MybatisConfig.getInstance();
	
	public int insert(Board board) {
		int result=0;
		SqlSession sqlSession = config.getSqlSession();
//		sqlSession.insert(" 쿼리문 들어있는 xml의 코드 조각id", sqlSession);
		result = sqlSession.insert("Board.insert", board);
		sqlSession.commit(); // DML일 경우
		config.release(sqlSession);
		return result;
	}	
	public List selectAll() {
		List list = null;
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Board.selectAll");
		// DML이 아니니까  commit 필요 없음
		config.release(sqlSession);
			
		return list;
	}
	public Board select(int board_idx) {
		Board board = null;
		SqlSession sqlSession = config.getSqlSession();
		board = sqlSession.selectOne("Board.select", board_idx);
		config.release(sqlSession);
		
		return board;
	}
	public int update(Board board) {
		int result = 0;
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.update("Board.update", board);
		sqlSession.commit(); // DML이므로
		config.release(sqlSession);
		
		return result;
	}
}
