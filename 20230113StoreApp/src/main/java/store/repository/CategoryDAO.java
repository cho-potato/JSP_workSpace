package store.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import store.mybatis.MybatisConfig;

public class CategoryDAO {
	MybatisConfig config = MybatisConfig.getInstance();	
	
	// 모든 카테고리 가져오기
	public List selectAll() {
		List list = null;
		
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Category.selectAll");
		config.release(sqlSession);
		
		return list;		
	}
}
