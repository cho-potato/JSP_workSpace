package com.jspshop.repository;

import org.apache.ibatis.cache.CacheException;
import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Color;
import com.jspshop.exception.ColorException;

public class ColorDAO {
	private SqlSession sqlSession;
	
	// 메서드 주입
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// throws는 예외를 처리하는 것이 아니라 예외를 떠넘기는 것 (회피) 대신 떠받는 애가 적절한 처리를 해준다는 보장이 있어야 함
	public int insert(Color color) throws ColorException {
		int result = 0;
		
		result = sqlSession.insert("Color.insert", color);
		// 커밋을 각자하면 의미없음 JSP에서 해야함
		if(result <1) {
			// 에러를 일부러 일으키자 
			throw new CacheException("칼");  // 빨간줄 뜨지 않는 이유는 강요하지 않은 오류기 때문
		}
		return result;
		
	}
}
