package gallery.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gallery.domain.Gallery;
import gallery.repository.GalleryDAO;
import gallery.util.PageManager;

// list.jsp를 완전히 대체할 서블릿을 정의한다
public class ListServlet extends HttpServlet{
	PageManager pageManager = new PageManager();
	GalleryDAO galleryDAO = new GalleryDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		List<Gallery> galleryList = galleryDAO.selectAll();
		pageManager.init(galleryList, request);
		
		PrintWriter out = response.getWriter(); 
		
		// HTML 디자인을 서블릿에서 처리한다는 것은 유지보수성이 너무 떨어지므로
		// 이를 대체할 기술이 필요하여 개발된 것이 JSP
	}
}
