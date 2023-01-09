package gallery.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import gallery.domain.Gallery;

// Gallery 테이블에 대한 CRUD만을 수행 
public class GalleryDAO {
	// insert
	public int insert (Gallery gallery) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into gallery(gallery_idx, title, writer, content, filename)";
		sql+= " values(seq_gallery.nextval, ?, ?, ?, ?)";
		
		return result;
	}
}