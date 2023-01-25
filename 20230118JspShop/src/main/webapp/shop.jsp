<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.domain.Product"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="com.jspshop.domain.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.jspshop.repository.CategoryDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	
	ProductDAO productDAO = new ProductDAO();

%>
<%
	// 상품 DAO는 트랜잭션 때문에 SqlSession을 멤버변수로 두고, setter로 주입받기를 기다리고 있으므로(세션주입)
	SqlSession sqlSession = mybatisConfig.getSqlSession();
	productDAO.setSqlSession(sqlSession);

	// 사용자가 넘긴 상위 카테고리를 이용하여 소속된 상품 가져오기 (select * from product where category_idx = 기본값)
	String category_idx = request.getParameter("category_idx");
	if(category_idx==null) {
		category_idx="0";
	}
	
	List<Product> productList = productDAO.selectByCategory(Integer.parseInt(category_idx));
	
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<%@ include file="/inc/header.jsp" %>
</head>

<body>
    <!-- Page Preloder -->
	<%@ include file="/inc/preloader.jsp" %>

    <!-- Offcanvas Menu Begin -->
    <!-- 
    	jsp자체에서 지원하는 태그 
    	사실 jsp는 디자인 영역이므로 개발자만 사용하는 것이 아니라 퍼블리셔, 웹디자이너와 공유를 한다
    	이 때, java에 대한 비전문가들은 java 코드를 이해할 수 없기 때문에
    	그들이 좀 더 쉽게 다가갈 수 있도록 태그를 지원해준다(협업때문에)
     -->
	<%@ include file="/inc/main_navi.jsp"%>    
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <%@ include file="/inc/header_section.jsp"%>
    <!-- Header Section End -->
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="shop__sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <h4>Categories</h4>
                            </div>
                            <div class="categories__accordion">
                                <div class="accordion" id="accordionExample">
                                    <%for(int i=0;i<categoryList.size();i++){ %>
                                    <%Category category=categoryList.get(i); %>
                                    <div class="card">
                                        <div class="card-heading active">
                                            <a onClick="getProductList(<%=category.getCategory_idx()%>)" data-target="#collapse<%=i%>"><%=category.getCategory_name() %></a>
                                        </div>
                                        <div id="collapse<%=i%>" class="collapse hide" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="#">Coats</a></li>
                                                    <li><a href="#">Jackets</a></li>
                                                    <li><a href="#">Dresses</a></li>
                                                    <li><a href="#">Shirts</a></li>
                                                    <li><a href="#">T-shirts</a></li>
                                                    <li><a href="#">Jeans</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                	<%} %>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__filter">
                            <div class="section-title">
                                <h4>Shop by price</h4>
                            </div>
                            <div class="filter-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="33" data-max="99"></div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <p>Price:</p>
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                            <a href="#">Filter</a>
                        </div>
                        <div class="sidebar__sizes">
                            <div class="section-title">
                                <h4>Shop by size</h4>
                            </div>
                            <div class="size__list">
                                <label for="xxs">
                                    xxs
                                    <input type="checkbox" id="xxs">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="xs">
                                    xs
                                    <input type="checkbox" id="xs">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="xss">
                                    xs-s
                                    <input type="checkbox" id="xss">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="s">
                                    s
                                    <input type="checkbox" id="s">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="m">
                                    m
                                    <input type="checkbox" id="m">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="ml">
                                    m-l
                                    <input type="checkbox" id="ml">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="l">
                                    l
                                    <input type="checkbox" id="l">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="xl">
                                    xl
                                    <input type="checkbox" id="xl">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__color">
                            <div class="section-title">
                                <h4>Shop by size</h4>
                            </div>
                            <div class="size__list color__list">
                                <label for="black">
                                    Blacks
                                    <input type="checkbox" id="black">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="whites">
                                    Whites
                                    <input type="checkbox" id="whites">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="reds">
                                    Reds
                                    <input type="checkbox" id="reds">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="greys">
                                    Greys
                                    <input type="checkbox" id="greys">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="blues">
                                    Blues
                                    <input type="checkbox" id="blues">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="beige">
                                    Beige Tones
                                    <input type="checkbox" id="beige">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="greens">
                                    Greens
                                    <input type="checkbox" id="greens">
                                    <span class="checkmark"></span>
                                </label>
                                <label for="yellows">
                                    Yellows
                                    <input type="checkbox" id="yellows">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                    	<%for(int i=0;i<productList.size();i++){ %>
                    	<%Product product = productList.get(i); %>
                        <div class="col-lg-4 col-md-6">
                            <div class="product__item">
                            <%
                            	String filename=null;
                            	if (product.getPimgList().size() > 0) {
                            		filename = product.getPimgList().get(0).getFilename();
		                    	} else {
		                    		out.print("파일없음,,,");
		                    	}
                            %>
                                <div class="product__item__pic set-bg" data-setbg="/data/<%=filename%>">
                                    <div class="label new">New</div>
                                    <ul class="product__hover">
                                        <li><a href="img/shop/shop-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="javascript:addCart(<%=product.getProduct_idx()%>)"><span class="icon_bag_alt"></span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#"><%=product.getProduct_name() %></a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price">$ 59.0</div>
                                </div>
                            </div>
                        </div>
                        <%} %>
                        
                        <div class="col-lg-12 text-center">
                            <div class="pagination__option">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
    
    
	<!-- Instagram Begin -->
	<%@ include file="/inc/insta.jsp" %>
	<!-- Instagram End -->
	
	<!-- Footer Section Begin -->
	<%@ include file="/inc/footer.jsp" %>
	<!-- Footer Section End -->
	
	<!-- Search Begin -->
	<%@ include file="/inc/search.jsp" %>
	<!-- Search End -->

<!-- Js Plugins -->
<%@ include file="/inc/footer_link.jsp" %>
<script type="text/javascript">
	function addCart(product_idx) {
		// 비동기로 서버에 장바구니 담기 요청을 시도하자	
		$.ajax({
			url : "/payment/cart.jsp?product_idx="+product_idx,
			type : "GET",
			success : function(result, status, xhr) {
				alert(result);
			}
		});
		
	}
	// 카테고리 선택시 하위 상품 요청하기
	function getProductList(category_idx) {
		
		$(location).attr("href", "/shop.jsp?category_idx="+category_idx);
	}
	$(function() {
		
	});

</script>
</body>

</html>
<%
	mybatisConfig.release(sqlSession);
%>