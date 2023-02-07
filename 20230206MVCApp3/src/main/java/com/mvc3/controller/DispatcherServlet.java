package com.mvc3.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 모든 요청을 받는 1차 진입점이 되어야 하므로 MVC에서의 컨트롤러 역할을 서블릿이 담당하면 된다
/*
 * 1) 요청 받기 (메인 컨트롤러) 
 * 2) 요청 분석 (메인 컨트롤러)
 * 3) 일 시키기 (서브 컨트롤러)
 * 4) 결과있으면 저장 (서브 컨트롤러)
 * 5) 알맞은 결과페이지 보여주기 (메인 컨트롤러)
 *  - 서브 컨트롤러가 할 수 있지만 진입점이 있을 의미가 없어짐 + 서브가 서블릿이 되어버림
 *  - 결과 저장 : application / session / request 에 가능
 *  - request에 하는 이유 : 어차피 생성되는 내장객체이므로 활용
 */
public class DispatcherServlet extends HttpServlet{
	// 2단계 업무인 '요청을 분석한다' 단계에서 if문을 사용하지 않으려면 적어도 2단계 이전에는 미리 준비해두자
	Properties props; // Properties는 HashTable의 자식(map의 자식)
	FileInputStream fis;
	
	// ServletConfig : 서블릿에 전달된 환경 정보를 담고 있는 객체
	public void init(ServletConfig config) throws ServletException {
		props = new Properties(); // key-value 쌍을 해석할 수 있는 객체 생성
		try {
			
			// getRealPath()를 이용하려면 JSP의 경우 내장 객체 중 application 내장객체를 이용하면 됨
			// 하지만 이 영역은 서블릿이기에 application 내장객체의 자료형인 ServletContext를 이용한다
			
			 // 서버가 가동될 때 생성되는 서버의 전역적 정보를 가진 객체
			// JSP의 application 내장객체이다
			ServletContext context =config.getServletContext();
			String contextConfigLoaction = config.getInitParameter("contextConfigLoaction");
			System.out.println("넘겨받은 초기화 파라미터는 " + contextConfigLoaction);
			// String realPath = context.getRealPath("/WEB-INF/mapping.data");
			String realPath = context.getRealPath(contextConfigLoaction);
			System.out.println("매핑 파일의 실제 위치는 "+ realPath);
			
			// fis = new FileInputStream(" 매핑 파일의 위치 ");
			// fis = new FileInputStream("C:/jsp_workspace/20230206MVCApp3/src/main/webapp/WEB-INF/mapping.data");
			fis = new FileInputStream(realPath);
			props.load(fis);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1단계) 요청을 받는다
		System.out.println("나 호출 되었어");
		
		//  파라미터 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 2단계) 요청을 분석한다
		String uri = request.getRequestURI();
		System.out.println("당신의 요청 URI는" + uri);
		
		// /blood.do 키 값 = com.mvc3.controller.BloodController
		String controllerPath = props.getProperty(uri); // 반환되는 결과는 실제 클래스가 아니라 문자열이다
		System.out.println("요청 URI에 동작할 하위 컨트롤러의 위치 정보는 " + controllerPath);
		// 요청 URI에 동작할 하위 컨트롤러의 위치 정보는 com.mvc3.controller.BloodController
		// 개발자는 설정 파일을 손보고 if 문을 쓰지 않기 때문에 유지보수성이 높아진다
		try {
			// 정적 영역에 원본을 올리고 그 반환된 결과로 Class 자료형을 반환 받자
			Class controllerClass = Class.forName(controllerPath); // static 영역에 올린다 (거푸집 원본)
			// new 연산자를 쓰지 않고 
			
			// 인스턴스 올리기
			// controllerClass.newInstance(); // newInstance()가 어차피 없어질 녀석이라 다른거 쓰자
			
			try {
				// 인스턴스를 메모리에 올리는 방법은 new 연산자만 있는게 아니다
				// 정해져 있으면 안되는 자료형,,, 상위 컨트롤러를 하나 만들어야 된다(자료형을 하나로 묶을 수 있는 컨트롤러) = controllerClass.getDeclaredConstructor().newInstance();
				Controller controller = (Controller)controllerClass.getDeclaredConstructor().newInstance();
				controller.execute(request, response);
				
				String viewName = controller.getViewName();
				System.out.println("하위 컨트롤러에서 반환받은 뷰 이름은 "+ viewName);
				
				// 뷰매핑에 쓴 것은 단순한 이름이기 때문에 재검색 들어가야 함
				String viewPage = props.getProperty(viewName); // JSP 검색
				System.out.println("view이름의 검색 결과는 "+viewPage);
				
				// RequestDispatcher dis = request.getRequestDispatcher("/movie/result.jsp이 주소를 변수로 줘야한다"); // 5단계) 결과가 있을 경우 forwarding, 결과가 없을 경우 redirect
				// RequestDispatcher dis = request.getRequestDispatcher(viewName); // 5단계) 결과가 있을 경우 forwarding, 결과가 없을 경우 redirect
				
				// 포워딩 할 경우
				if(controller.isForward()) {
				RequestDispatcher dis = request.getRequestDispatcher(viewPage); // board
				dis.forward(request, response); // 전달 (여기가 포워딩)
				} else {
					// 리다이렉트 할 경우(재접속)
					// 지정한 URL로 재접속 유도
					// 클라이언트인 웹브라우저는 서버로부터 응답을 받은자마자 지정한 URL로 재접속을 시도하게 됨
					// 전화 끊고 새로운 다이얼 눌러 새롭게 전화거는 것과 같다
					response.sendRedirect(viewPage);
				}
				
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			} 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		/*		
		if (uri.equals("/blood.do")) {
			System.out.println("혈액형 담당 컨트롤러에게 전달할 예정"); // 계획
			BloodController controller = new BloodController(); // 불러와서 메모리 올리기
			controller.execute(request, response); // 전달하기 (4단계)
			
			RequestDispatcher dis = request.getRequestDispatcher("/blood/result.jsp"); // 5단계) 결과가 있을 경우 forwarding, 결과가 없을 경우 redirect
			dis.forward(request, response); // 전달 (여기가 포워딩)
			
		} else if(uri.equals("/movie.do")) {
			System.out.println("영화 담당 컨트롤러에게 전달할 예정"); // 계획
			MovieController controller = new MovieController(); // 불러와서 메모리 올리기
			controller.handle(request, response); // 전달하기
			
			RequestDispatcher dis = request.getRequestDispatcher("/movie/result.jsp"); // 5단계) 결과가 있을 경우 forwarding, 결과가 없을 경우 redirect
			dis.forward(request, response); // 전달 (여기가 포워딩)
		}
		 */
		// 3단계 진행을 위함 전담 컨트롤러 만들기
	}
	// 서블릿이 소멸될 때 호출되는 생명주기 메서드
	public void destroy() {
		// 주로 자원을 닫는 코드를 작성
		if(fis!=null) {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
