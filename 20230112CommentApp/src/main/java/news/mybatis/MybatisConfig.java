package news.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis의 쿼리수행객체가 SqlSession을 관리해주는 SqlSessionFactory를 얻기 위한 싱글턴 객체 정의
public class MybatisConfig {
	private static MybatisConfig instance; // null
//	private static MybatisConfig instance = new MybatisConfig(); // 멤버변수에 직접 싱글턴을 만들어 줄 수 있다
	SqlSessionFactory sqlSessionFactory;
	
	private MybatisConfig() {
		String resource = "news/mybatis/config.xml";

		// 순수 JDBC 코드에서는 쿼리 실행을 담당하는 객체는 PreparedStatement였지만,
		// Mybatis는 JDBC를 wrapper하여 SqlSession이라는 쿼리수행객체를 지원
		// 즉, 내부적으로 JDBC 사용되고 있다
		// 따라서 개발자가 쿼리문을 수행하기 위해서는 SqlSession을 얻어와야 하는데
		// SqlSession을 관리해주고 반환해주는 객체가 SqlSessionFactory이다

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 멤버변수에 직접 싱글턴을 줬을 때 아래의 코드는 필요 없다
	public static MybatisConfig getInstance() {
		if(instance==null) {
			instance = new MybatisConfig();
		}
		return instance;
	}
	
	// 세션 팩토리로부터 쿼리수행객체 하나 얻기
	public SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	// 쿼리수행 객체 닫기
	public void release(SqlSession sqlSession) {
		if(sqlSession!=null) {
			sqlSession.close();
		}
	}
}
