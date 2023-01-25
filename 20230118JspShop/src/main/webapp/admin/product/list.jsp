<%@page import="java.util.HashMap"%>
<%@page import="com.jspshop.util.PageManager"%>
<%@page import="com.jspshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="com.jspshop.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	ProductDAO productDAO=new ProductDAO();
	PageManager pm=new PageManager();
%>
<%
	SqlSession sqlSession = mybatisConfig.getSqlSession();
	productDAO.setSqlSession(sqlSession);
	
	//만일 사용자가 검색기능을 이용하여 파라미터를 넘기면, 그 파라미터값을
	//맵에 채워서  selectAll() 호출하자!
	String category=request.getParameter("category");
	String keyword=request.getParameter("keyword");
	HashMap<String , String> map=new HashMap<String, String>();
	map.put("category", category); //사용자가 선택한 select 박스의 값
	map.put("keyword", keyword); //사용자가 입력한 키워드 텍스트박스의 값 
	
	List<Product> productList=null;
	if(keyword!=null) { // 검색이라면,,,
		productList=productDAO.selectBySearch(map);
		
	} else {
		productList=productDAO.selectAll();
	}
	
	pm.init(productList, request);//페이징 계산 맡기기
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<%@ include file="/admin/inc/header_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<%@ include file="/admin/inc/preloader.jsp" %>
		
		<!-- Navbar -->
		<%@ include file="/admin/inc/navbar.jsp" %>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="/admin/inc/sidebar_left.jsp" %>
		
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="col">
						<div class="card">
						    <div class="card-header">
						        <h3 class="card-title">Responsive Hover Table</h3>
						
						        <div class="card-tools">
									<form id="form1">
							            <div class="input-group input-group-sm" style="width: 350px;">
												<select class="form-control" name="category">
													<option value="product_name">상품명</option>
													<option value="brand">브랜드</option>
												</select>			                
								                <input type="text" name="keyword" class="form-control float-right" placeholder="Search">
							                <div class="input-group-append">
							                    <button type="button" class="btn btn-default" id="bt_search">
							                        <i class="fas fa-search"></i>
							                    </button>
							                </div>
							            </div>
									</form>
						        </div>
						    </div>
						    <!-- /.card-header -->
						    <div class="card-body table-responsive p-0">
						        <table class="table table-hover text-nowrap">
						            <thead>
						                <tr>
						                    <th>No</th>
						                    <th>카테고리</th>
						                    <th>상품명</th>
						                    <th>브랜드</th>
						                    <th>가격</th>
						                    <th>할인가</th>
						                </tr>
						            </thead>
						            <tbody>
						            	<%
						            		int curPos=pm.getCurPos();
						            		int num=pm.getNum();
						            	%>
						            	<%for(int i=1;i<=pm.getPageSize();i++){%>
						            	<%if(num<1)break; %>
						            	<%Product product=productList.get(curPos++); %>
						                <tr>
						                    <td><%=num-- %></td>
						                    <td><%=product.getCategory().getCategory_name() %></td>
						                    <td><%=product.getProduct_name() %></td>
						                    <td><%=product.getBrand() %></td>
						                    <td><%=product.getPrice() %></td>
						                    <td><%=product.getDiscount() %></td>
						                </tr>
						                <%} %>
						            </tbody>
						        </table>
														        
						    </div>
						    <!-- /.card-body -->
						    <div class="card-footer">
							    <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul></div>
						    </div>
						</div>
					</div>					
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<%@ include file="/admin/inc/footer.jsp" %>		

		<!-- Control Sidebar -->
		<%@ include file="/admin/inc/sidebar_right.jsp" %>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="/admin/inc/footer_link.jsp" %>

<script type="text/javascript">
	function getListBySearch() {
		// 폼을 전송하자
		$("#form1").attr({
			action : "/admin/product/list.jsp",
			method : "post"			
		});
		$("#form1").submit();
	}
	$(function() {
		$("#bt_search").click(function() {
			getListBySearch();
		});
	});
</script>


</body>
</html>








