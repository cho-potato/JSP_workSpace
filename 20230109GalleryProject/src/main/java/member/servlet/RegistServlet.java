package member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.domain.Member;
import member.repository.MemberDAO;

public class RegistServlet extends HttpServlet{
		MemberDAO memberDAO = new MemberDAO();
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			
			// 파라미터들을 넘겨받자
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			
			PrintWriter out = response.getWriter();
			
			out.print("id "+ id+ "<br>");
			out.print("pass "+ pass+ "<br>");
			out.print("name "+ name+ "<br>");
			
			Member member = new Member();
			member.setId(id);
			member.setPass(pass);
			member.setName(name);
			
			int result = memberDAO.insert(member);
			
			out.print("<script>");
			if(result > 0) {
				out.print("alert('가입완료');");
				out.print("location.href='/member/login.html';");
			} else {
				out.print("alert('가입실패');");
				out.print("history.back();");
			}
			out.print("</script>");
		}

}
