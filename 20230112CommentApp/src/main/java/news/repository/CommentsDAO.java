package news.repository;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import news.domain.Comments;
import news.mybatis.MybatisConfig;

public class CommentsDAO {
	MybatisConfig config = MybatisConfig.getInstance();

	// 글 한 건 넣기
	public int insert(Comments comments) {
		int result = 0;
			
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.insert("Comments.insert", comments);
		sqlSession.commit();
		config.release(sqlSession);
		
		return result;
	}
}
