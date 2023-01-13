package store.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import store.domain.Store;
import store.mybatis.MybatisConfig;

public class StoreDAO {
	MybatisConfig config = MybatisConfig.getInstance();

	// 등록하기
	public int insert(Store store) {
		int result = 0;
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.insert("Store.insert", store);
		sqlSession.commit();
		config.release(sqlSession);
				
		return result;
	}

	// 전체 목록 가져오기
	public List selectAll () {
		List list = null;
		
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Store.selectAll");
		config.release(sqlSession);	
		
		return list;
	}
}
