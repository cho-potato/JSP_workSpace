<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.domain.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
	// 클라이언트의 장바구니 등록 요청을 처리한다
	
	// 지금 요청이 만일 최초의 요청이라면, 고양이는 세션 객체 생성 및 ID를 할당한다
	// 최초 요청 여부 판단 ? 클라이언트의 브라우저에 흔적을 남긴 쿠키 ID 존재여부로 판단
	String sid = session.getId();
	System.out.println("이 요청에 의해 생성된 세션ID : " + sid);
	
	// 장바구니 목록을 표현하기 위한 순서있는 컬렉션인 리스트를 준비하자
	List<Cart> cartList = new ArrayList<Cart>();
	
	// 리스트를 세션에 담지 않으면  service 메서드의 지역변수이므로 요청시마다 생성되어 소멸되기를 반복한다
	// 따라서 생명을 유지할 수 있는 보다 전역적인 영역에 리스트를 보관하자(현재로서는 세션이 가장 적합)
	// application : 이 객체에 담으면 톰캣이 꺼질 때까지 사용 가능
	// session : 세션이 끊길 때(브라우저를 닫거나, 일정시간 요청이 없거나)
	// 이미 카트리스트가 세션에 담겨있을 때는 덮어쓰지 않게 만들기
	if (session.getAttribute("cartList") == null) {
		session.setAttribute("cartList", cartList);
	}
	
	// 누가 (원래는 로그인한 유저를 대상으로 하므로  session.getAttribute() 얻어와야 한다(추후 진행))
	Member member = new Member();
	member.setMember_idx(1); // 임시 데이터
	member.setId("zino");
	
	// 무엇을
	String product_idx = request.getParameter("product_idx");
	
	// 몇 개? 1개
	Cart cart = new Cart(); // empty
	cart.setMember(member);
	cart.setProduct_idx(Integer.parseInt(product_idx)); // 무엇을
	cart.setEa(1); // 목록을 톡해 담을 때는 1개를 기본 값으로 담는다
	
	// 한 건의 장바구니 객체를 리스트에 담자
	List sessionCartList = (List)session.getAttribute("cartList");
	sessionCartList.add(cart);
	System.out.println("현재 장바구니에 " + sessionCartList.size() + "건이 담겼습니다");
	out.print("장바구니에 상품을 담았습니다");
	
%>