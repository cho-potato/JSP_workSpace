package empapp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import empapp.mybatis.MybatisConfig;

public class DeptDAO {
	MybatisConfig config = MybatisConfig.getInstance();
	
	// 모든 부서 가져오기
	public List selectAll() {
		List list = null;
		
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Dept.selectAll");
		config.release(sqlSession);
				
		return list;
	}
}
