package empapp.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import empapp.mybatis.MybatisConfig;

public class EmpDAO {
	MybatisConfig config = MybatisConfig.getInstance();

	// 부서 번호에 소속된 모든 사원 가져오기
	public List selectByFKey(int deptno) {
		List list = null;
		
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Emp.selectByFKey", deptno);
		config.release(sqlSession);
		
		return list;
	}
	public List selectBySearch(Map map) {
		List list = null;
		
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Emp.selectBySearch", map);
		config.release(sqlSession);
		
		return list;
	}
}
