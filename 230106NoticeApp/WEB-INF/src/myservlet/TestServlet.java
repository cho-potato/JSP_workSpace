/*
�ڹٴ� Ŭ���� ��� ����̹Ƿ� JavaEE�� ������ ���� 
�и� JSP�� �ƴϴ��� Ŭ������ �̿��Ͽ� ��û/������ ó���� �� �ִ�
�̷��� ���� ���������� ����Ǹ�, ������ ��û�� ������ ó���� �� �ִ� Ŭ������ ������ Servlet�̶� �Ѵ�
*/



package myservlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;


public class TestServlet extends HttpServlet{
	// �� Ŭ������ �� �����, �� http����� ��û�� ������ ó���ϱ� ���� Ŭ�����̹Ƿ�
	// Ŭ���̾�Ʈ�� get������� ��û�� �ϸ� doGet()���� ó���ϰ�,
	// Ŭ���̾�Ʈ�� post������� ��û�ϸ� doPost()�� ó���ϸ� �ȴ�
	// �ۼ��� Servlet Ŭ������ ������������ �� ��Ī�� ���� ������ �� ����.
	// �ذ� : ������ ���� SUN���� ���� ��Ģ�� ������(WEB.xml)
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Ŭ���̾�Ʈ�� �̸��� ���������� ��������
		// ������ Ŭ�����ε� ������ ��û�� ������ ó���� �� �ִ� (����)
		PrintWriter out = response.getWriter(); // ���ڱ�� ��½�Ʈ�� // ���⼭�� out�� JSP�� out.print�� out�� ����
		out.print("zino");
	}

}
