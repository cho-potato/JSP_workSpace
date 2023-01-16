package empapp.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 하나의 프로그램에서 SqlSessionFactory는 하나만 있으면 충분하므로 싱글턴으로 관리한다
public class MybatisConfig {
	private static MybatisConfig instance;
	SqlSessionFactory sqlSessionFactory;
	
	private MybatisConfig() {
		String resource = "empapp/mybatis/config.xml";
		InputStream inputStream=null;;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static MybatisConfig getInstance() {
		if(instance==null) {
			instance = new MybatisConfig();
		}
		return instance;
	}
	// 팩토리에서 SqlSession 하나 얻기
	public SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	
	// 팩토리에서 SqlSession 반납하기
	public void release(SqlSession sqlSession) {
		if(sqlSession!=null) {
			sqlSession.close();
		}
	}
}
