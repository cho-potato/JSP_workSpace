package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.movie.MovieChoice;

public class MovieController extends HttpServlet{
	MovieChoice choice = new MovieChoice();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String movie = request.getParameter("movie");
		
		String msg = choice.getChoice(movie);
		
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("location.href='/movie/result.jsp';");
		out.print("</script>");
	
	}
}
