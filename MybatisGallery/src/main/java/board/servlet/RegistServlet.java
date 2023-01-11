package board.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import board.domain.Board;
import board.repository.BoardDAO;
import board.util.FileManager;

// 글쓰기 요청을 받는 서블릿
public class RegistServlet extends HttpServlet {
	ServletContext context; // JSP에서의 application 내장객체임

	int maxSize = 5 * 1024 * 1024; // 파일 최대 허용 용량 (5를 앞으로 빼서 유지보수 쉽게)
	String savePath; // 저장될 임시 경로 (JVM의 메모리를 아끼기 위해 임시로 저장)
	DiskFileItemFactory factory; // 설정 정보 인식
	BoardDAO boardDAO = new BoardDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		context = request.getServletContext();

		// 사용 중인 운영체제(win, linux, unix ...) 환경에 따른 상대경로 구하기
		savePath = context.getRealPath("/data/");

		// 업로드 설정 정보 세팅
		factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxSize); // 용량 제한 (Threshold : 문턱)
		factory.setRepository(new File(savePath));
		System.out.println(savePath);
		// 실제 업로드를 처리하는 객체는 ServvletFileUpload이다
		ServletFileUpload upload = new ServletFileUpload(factory); // factory 잡아먹으면서 업로드 처리

		// 클라이언트가 전송한 멀티(텍스트, 바이너리) 정보를 분석(parse)
		try {
			List<FileItem> itemList = upload.parseRequest(request); // 요청 분석

			// items를 구분하여 처리(텍스트와 바이너리가 포함되어 있으므로)
			// 텍스트는 DTO에 담고, 바이너리는 저장

			// DTO 메모리에 올리기
			Board board = new Board(); // empty

			for (FileItem item : itemList) {
				System.out.println("텍스트필드인지 " + item.isFormField() + ", 텍스트 필드는 " + item.getFieldName() + "이고, 그 값은 "
						+ item.getString("UTF-8"));

				if (item.isFormField()) {
					switch (item.getFieldName()) {
					case "title": board.setTitle(item.getString("UTF-8"));break;
					case "writer": board.setWriter(item.getString("UTF-8")); break;
					case "content": board.setContent(item.getString("UTF-8"));break;
					};
				} else {
					// 파일 처리 (파일 존재 유무 확인)
					if (item.getSize() > 0) { // 파일을 업로드 한 경우 업로드 처리
						// 임시 저장소에 생성된 임시파일이 제거되는 동시에
						// 개발자가 기정한 파일명으로 새로운 파일 생성
						long time = System.currentTimeMillis();
						String ext = FileManager.getExt(item.getName()); // 우리가 구할

						File file = new File(savePath + time + "." + ext);
						try {
							item.write(file);
							// DAO의 insert 여기서 호출
							board.setFilename(time + "." + ext); // 파일명 대입
							int result = boardDAO.insert(board);
							out.print("<script>");
							if(result > 0) {
								out.print("alert('등록성공');");
								out.print("location.href='/board/list.jsp';");
							} else {
								out.print("alert('등록실패');");
								out.print("history.back();");
							} 
							out.print("</script>");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

	}
}
