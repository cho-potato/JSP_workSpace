package com.jspshop.repository;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Pimg;
import com.jspshop.exception.PimgException;

public class PimgDAO {
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(Pimg pimg) throws PimgException{
		int result=sqlSession.insert("Pimg.insert", pimg);
		if(result <1) {
			throw new PimgException("이미지 등록실패");
		}
	}
	
}