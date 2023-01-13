package reply.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis의 쿼리수행객체가 SqlSession을 관리해주는 SqlSessionFactory를 얻기 위한 싱글턴 객체 정의
public class ReplyMybatisConfig {
	private static ReplyMybatisConfig instance; // null
	SqlSessionFactory sqlSessionFactory;
	
	public ReplyMybatisConfig() {
		String resource = "reply/mybatis/replyconfig.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static ReplyMybatisConfig getInstance() {
		if(instance==null) {
			instance = new ReplyMybatisConfig();
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

