package news.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import news.domain.News;
import news.mybatis.MybatisConfig;

public class NewsDAO {
	MybatisConfig config = MybatisConfig.getInstance();

	public int insert(News news) {
		int result = 0;		
		
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.insert("News.insert", news);		
		sqlSession.commit(); // DML이니까
		config.release(sqlSession);
		
		return result;
	}
	
	public List selectAll() {
		List list = null;
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("News.selectAll");
		config.release(sqlSession);
				
		return list;
	}
	
	public News select(int news_idx) {
		News news = null;
		SqlSession sqlSession = config.getSqlSession();
		news = sqlSession.selectOne("News.select", news_idx);
		config.release(sqlSession);
		
		return news;
	}
	public int update(News news) {
		
		return 0;
	}
	public int delete(int news_idx) {
		
		return 0;
	}
}
