package noticeReact.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfigReact {
	private static MybatisConfigReact instance;
	SqlSessionFactory sqlSessionFactory;
	
	private MybatisConfigReact() {
	
		String resource = "noticeReact/mybatis/configReact.xml";
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static MybatisConfigReact getInstance() {
		if(instance==null) {
			instance = new MybatisConfigReact();
		}
		return instance;
	}
}
