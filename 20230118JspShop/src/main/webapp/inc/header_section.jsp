<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.domain.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.jspshop.repository.CategoryDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	CategoryDAO categoryDAO=new CategoryDAO();
%>
<%
	//카테고리 가져오기 
	List<Category> categoryList=categoryDAO.selectAll();
%>
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="/"><img src="/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <%for(int i=0;i<categoryList.size();i++){ %>
                            <% Category category=categoryList.get(i);%>
                            <li><a href="#"><%=category.getCategory_name() %></a></li>
                            <%} %>
                            
                            <li><a href="/shop.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./product-details.html">Product Details</a></li>
                                    <li><a href="./shop-cart.html">Shop Cart</a></li>
                                    <li><a href="./checkout.html">Checkout</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                        
                        	<%if(session.getAttribute("member")==null){%>
	                            <a href="/member/loginform.jsp">Login</a>
	                            <a href="/member/joinform.jsp">Register</a>
                            <%}else{%>
                            <%
                            	Member member=(Member)session.getAttribute("member");
                            %>
	                            <a href="/member/logout.jsp">logout</a>
	                            <a href="#"><%=member.getId()%></a>
                            <%} %>
                            
                        </div>
                        <ul class="header__right__widget">
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_heart_alt"></span>
                                <div class="tip">2</div>
                            </a></li>
                            <li>
                            	<%if(session.getAttribute("member")==null){ %>
	                            	<a href="javascript:alert('로그인이 필요한 서비스입니다');">
	                            		<span class="icon_bag_alt"></span>
	                                	<div class="tip">2</div>
	                                </a>
                                <%}else{ %>
	                            	<a href="/payment/cartlist.jsp">
	                            		<span class="icon_bag_alt"></span>
	                                	<div class="tip">2</div>
	                                </a>
                                <%} %>
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>