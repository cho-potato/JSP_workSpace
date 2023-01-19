<%@page import="com.jspshop.util.FileManager"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.jspshop.exception.PsizeException"%>
<%@page import="com.jspshop.exception.ColorException"%>
<%@page import="com.jspshop.exception.ProductException"%>
<%@page import="com.jspshop.repository.PsizeDAO"%>
<%@page import="com.jspshop.repository.ColorDAO"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	//기존에 사용하던 config는 JSP에서 예약어이므로 다르게 설정
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	// 세션을 DAO에 넣어주고 DAO 등록하기
	ProductDAO productDAO = new ProductDAO();
	ColorDAO colorDAO = new ColorDAO();
	PsizeDAO psizeDAO = new PsizeDAO();
	
	DiskFileItemFactory factory = new DiskFileItemFactory(); // 업로드 관련 설정정보(사이즈, 경로 등) 보유할 객체 
%>

<%

	request.setCharacterEncoding("UTF-8");
	
	String category_idx = request.getParameter("category_idx");
	String product_name = request.getParameter("product_name");
	String brand = request.getParameter("brand");
	String price = request.getParameter("price");
	String discount = request.getParameter("discount");
	
	System.out.println("category_idx");
	System.out.println("product_name");
	System.out.println("brand");
	System.out.println("price");
	System.out.println("discount");
	

	// 파라미터 받기(이미지를 받아야 하기 때문에 request로는 안되니까 Apache 쓰러간다 )
	
	int maxSize = 5 * (1024*1024);
	String path = application.getRealPath("/data/");
	// 담기
	factory.setSizeThreshold(maxSize); // 업로드 최대 사이즈 지정
	// 임시 디렉로리 및 저장 경로
	factory.setRepository(new File(path));
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	// 업로드 된 파라미터 분석
	List<FileItem> itemList= upload.parseRequest(request); // 요청객체를 매개변수로 넣어야 함
	
	// 넘어온 파라미터 수 만큼 반복문 돌면서, 파라미터 분석하자
	for(FileItem item : itemList) {
		if(item.isFormField()) { // 텍스트 필드라면

		} else { //  파일 컴포넌트라면
			long time = System.currentTimeMillis();
			String ext = FileManager.getExt(item.getName());
			
			System.out.println(path);
			
			item.write(new File(path+time+"."+ext)); // 서버에 파일 저장
			Thread.sleep(500); // 너무 빠른 처리 방지
		}
	}

	// 상품 등록이란, 여러 테이블을 대상으로 DML이 수행되어야 하므로 대표적인 트랜잭션 상황의 업무이다.
	// 따라서 DML을 수행하는 객체인 DAO들은, 각자 커넥션을 취득하여 업무하는 것이 아니라
	// 같은 커넥션 내에서 DML 수행할 수 있도록 SqlSessuon을 공유하자
	// 따라서 SqlSession에 대한 취득은 여기(Servlet)에서 처리한다

	SqlSession sqlSession = mybatisConfig.getSqlSession();
	// 이 세션을 다음 세개의 DAO에게 보내주면 됨 (ProductDAO, ColorDAO, PsizeDAO)

	// setter를 이용한 객체 주입
	productDAO.setSqlSession(sqlSession);
	colorDAO.setSqlSession(sqlSession);
	psizeDAO.setSqlSession(sqlSession);
	
	// DAO에게 일 시키기
	try {
		productDAO.insert(null);
		colorDAO.insert(null);
		psizeDAO.insert(null);
		
		sqlSession.commit();
		
	} catch (ProductException e) {
		sqlSession.rollback();
	} catch (ColorException e) {
		sqlSession.rollback();
	} catch (PsizeException e) {
		sqlSession.rollback();
	} finally {
		mybatisConfig.release(sqlSession);
	}

	// 업무가 끝나면 각자 닫는 것이 아니라 여기서 닫아야 함
	mybatisConfig.release(sqlSession);
	

%>