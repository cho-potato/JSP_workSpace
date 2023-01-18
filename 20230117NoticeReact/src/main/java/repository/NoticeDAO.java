package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Notice;
import mybatis.MybatisConfig;

public class NoticeDAO {
	MybatisConfig config = MybatisConfig.getInstance();

	// 모두 가져오기
	public List selectAll() {
		List list = null;

		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Notice.selectAll");
		config.release(sqlSession);

		return list;
	}

	// 한건 가져오기
	public Notice select(int notice_idx) {
		Notice notice = null;

		SqlSession sqlSession = config.getSqlSession();
		notice = sqlSession.selectOne("Notice.select", notice_idx);
		config.release(sqlSession);

		return notice;

	}

	// 한건 넣기
	public int insert(Notice notice) {
		int result = 0;
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.insert("Notice.insert", notice);
		sqlSession.commit();
		config.release(sqlSession);

		return result;
	}

	// 수정하기
	public int update(Notice notice) {
		int result = 0;

		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.update("Notice.update", notice);
		sqlSession.commit();
		config.release(sqlSession);

		return result;
	}

	// 삭제하기
	public int delete(int notice_idx) {
		int result = 0;

		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.delete("Notice.delete", notice_idx);
		sqlSession.commit();
		config.release(sqlSession);

		return result;
	}

}