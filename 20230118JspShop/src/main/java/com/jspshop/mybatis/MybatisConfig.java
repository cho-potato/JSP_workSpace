package com.jspshop.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfig {
	private static MybatisConfig instance;
	SqlSessionFactory sqlSessionFactory;

	private MybatisConfig() {
		String resource = "com/jspshop/mybatis/config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	public static MybatisConfig getInstance() {
		if (instance == null) {
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
		if (sqlSession != null) {
			sqlSession.close();
		}
	}
}
