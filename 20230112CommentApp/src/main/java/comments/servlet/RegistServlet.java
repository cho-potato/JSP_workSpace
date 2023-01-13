package comments.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.domain.Comments;
import news.domain.News;
import news.repository.CommentsDAO;
import news.util.ResponseMessage;

// 댓글 등록 Servlet
public class RegistServlet extends HttpServlet{
	CommentsDAO commentsDAO = new CommentsDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// insert into comments(comments_idx, msg, author, news_idx)
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		// 파라미터 받기
		String news_idx = request.getParameter("news_idx");
		String msg = request.getParameter("msg");
		String author = request.getParameter("author");
		
		// DTO에 담기
		Comments comments = new Comments();
		News news = new News();
		news.setNews_idx(Integer.parseInt(news_idx));
		comments.setNews(news);
		comments.setMsg(msg);
		comments.setAuthor(author);
		
		// comments 한 건 넣기
		int result = commentsDAO.insert(comments);
		if(result > 0) {
			out.print(ResponseMessage.getMsgURL("성공", "/news/content.jsp?news_idx="+news_idx));
		} else {
			out.print(ResponseMessage.getMsgBack("실패"));
		}
	}
}
