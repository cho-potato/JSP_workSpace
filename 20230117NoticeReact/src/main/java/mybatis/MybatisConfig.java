package mybatis;

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
        String resource = "mybatis/config.xml";
        InputStream inputStream=null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static MybatisConfig getInstance() {
        if(instance==null) {
            instance=new MybatisConfig();
        }
        return instance;
    }

    public SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }

    public void release(SqlSession sqlSession) {
        if(sqlSession!=null) {
            sqlSession.close();
        }
    }

}