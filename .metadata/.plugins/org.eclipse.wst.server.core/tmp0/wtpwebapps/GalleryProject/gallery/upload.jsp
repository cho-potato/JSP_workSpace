<%@page import="gallery.util.FileManager"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
// 파라미터를 받아 오라클에 넣기
request.setCharacterEncoding("utf-8");

// 클라이언트가 파일을 포함하여 인코딩 된 형식으로 요청을 시도할 때는 
// 기존 텍스트 파라미터를 받을 때 사용한 getParameter 메서드로는 바이너리 파일을 포함한 기타 파라미터도 받을 수 없다
// 해결 : 업로드 라이브러리를 이용해야 한다
String savePath = "C:/jsp_workspace/GalleryProject/data/";
int maxSize = 1024 * 1024 * 5; // 5MB 제한
MultipartRequest multi = null;
try {
	multi = new MultipartRequest(request, savePath, maxSize, "UTF-8");
	// 이미 생성자에서 업로드가 완료되었기 때문에 생성된 파일을 대상으로 파일명을 바꾸자

	// 업로드 된 파일의 레퍼런스 얻기
	File file = multi.getFile("file"); // html에서의 컴포넌트 이름
	long time = System.currentTimeMillis(); // 파일명에 사용할 숫자
	String ext = FileManager.getExt(file.getName()); // 파일명

	// 기존 파일 to 새 파일
	// file.renameTo(new File("바꿀 파일 명"));
	file.renameTo(new File(savePath + time + "." + ext));

	String title = multi.getParameter("title");
	// String title = request.getParameter("title");
	String writer = multi.getParameter("writer");
	// String writer = request.getParameter("writer");
	String content = multi.getParameter("content");
	// String content = request.getParameter("content");

	// String file = request.getParameter("file"); // file은 바이너리이기 때문에 String이 될 수 없음

	out.print(title + "<br>");
	out.print(writer + "<br>");
	out.print(content + "<br>");
} catch (IOException e) {
	out.print("파일의 크기는 5MB 이하로 제한되어 있습니다");
}
%>