package com.jspshop.repository;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Color;
import com.jspshop.exception.ColorException;
import com.jspshop.mybatis.MybatisConfig;

public class ColorDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(Color color) throws ColorException{
		int result=sqlSession.insert("Color.insert", color);
		if(result<1) {
			throw new ColorException("색상 등록 실패");
		}

	}
}