package gallery.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gallery.domain.Gallery;
import gallery.repository.GalleryDAO;

// 텍스트만 수정하기 위한 서블릿
public class UpdateServlet extends HttpServlet{
	
	GalleryDAO galleryDAO = new GalleryDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String gallery_idx = request.getParameter("gallery_idx");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String filename = request.getParameter("filename");
		
		Gallery gallery = new Gallery();
		gallery.setGallery_idx(Integer.parseInt(gallery_idx));
		gallery.setTitle(title);
		gallery.setWriter(writer);
		gallery.setContent(content);
		gallery.setFilename(filename); 
		
		int result = galleryDAO.update(gallery); // 업데이트 실행

		PrintWriter out = response.getWriter();

		out.print("<script>");
		if (result > 0) {
			out.print("alert('수정성공');");
			out.print("location.href='/gallery/content.jsp?gallery_idx=" + gallery_idx + "';");
		
		} else {
			out.print("alert('수정실패');");
			out.print("history.back();");
		}
		out.print("</script>");
	}

}
