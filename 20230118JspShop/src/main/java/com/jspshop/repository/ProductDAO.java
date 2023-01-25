package com.jspshop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Product;
import com.jspshop.exception.ProductException;



public class ProductDAO {
	private SqlSession sqlSession;
	
	// 메서드 주입
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// throws는 예외를 처리하는 것이 아니라 예외를 떠넘기는 것 (회피) 대신 떠받는 애가 적절한 처리를 해준다는 보장이 있어야 함
	public int insert(Product product) throws ProductException {
		int result = 0;
		System.out.println("Mybatis 만나기 전의 product_idx="+product.getProduct_idx());
		result = sqlSession.insert("Product.insert", product);
		// 커밋을 각자하면 의미없음 JSP에서 해야함
		System.out.println("Mybatis 만난 후 product_idx="+product.getProduct_idx());
		if(result <1) {
			// 에러를 일부러 일으키자 
			throw new ProductException("상품이 등록되지 않았다고"); // 빨간줄 뜨지 않는 이유는 강요하지 않은 오류기 때문
		}
		return result;
	}
	// 검색시 사용할 메서드
	public List selectBySearch(Map map) {
		return sqlSession.selectList("Product.selectBySearch", map);
	}
	// 그냥 모두 가져오기
	public List selectAll() {
		return sqlSession.selectList("Product.selectAll");
	}
	public List selectByCategory(int category_idx) {
		return sqlSession.selectList("Product.selectByCategory", category_idx);
	}
}