package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.domain.News;
import news.repository.NewsDAO;
import news.util.ResponseMessage;

public class RegistServlet extends HttpServlet{
	NewsDAO newsDAO = new NewsDAO();
	
	public RegistServlet()	{
		newsDAO = new NewsDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		News news = new News();
		news.setTitle(title);
		news.setWriter(writer);
		news.setContent(content);
		
		int result = newsDAO.insert(news);
		
		if(result > 0) {
			out.print(ResponseMessage.getMsgURL("등록성공", "/news/list.jsp"));
			
		} else {
			out.print(ResponseMessage.getMsgBack("등록실패"));
			
		}
	}

}
