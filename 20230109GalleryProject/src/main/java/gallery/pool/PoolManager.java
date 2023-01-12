package gallery.pool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 외부 자원을 이름으로 접근하는 JNDI 기술을 이용하여 톰캣이 지원하는 커넥션 풀을 가져오자
// 커넥션을 얻거나 다시 돌려보내는 기능을 메서드화 시켜서 필요한 객체가 편하게 사용할 수 있도록 정의해본다
public class PoolManager {
	private static PoolManager instance;
	InitialContext context; // JNDI 검색객체
	DataSource ds;

	// 생성자는 단 한번 호출되므로 이 시점에 커넥션 풀을 얻어다놓자
	private PoolManager() {
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 커넥션 하나 빌리기
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 커넥션 반납
	public void release(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DML인 경우 (Connection, PreparedStatement)
	public void release(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Select (Connection, PreparedStatement, ResultSet)
	public void release(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static PoolManager getInstance() {
		if (instance == null) {
			instance = new PoolManager();
		}
		return instance;
	}
}
