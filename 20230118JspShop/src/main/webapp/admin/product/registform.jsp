<%@page import="com.jspshop.domain.Admin"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%

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
		<%@ include file="/admin/inc/preloader.jsp"%>
		<!-- Navbar -->
		<%@ include file="/admin/inc/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="/admin/inc/sidebar_left.jsp"%>
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
						<div class="form-group">
                 		   <select class="form-control">
                 		   		<option>카테고리 선택</option>
                 		   		<option>ㄱ</option>
                 		   		<option>ㄴ</option>
                 		   		<option>ㄷ</option>
                 		   	</select>
                  		</div>
						<div class="form-group">
                 		   <input type="email" class="form-control"  placeholder="상품명">
                  		</div>
						<div class="form-group">
                 		   <input type="email" class="form-control" placeholder="브랜드">
                  		</div>
                  		<div class="form-group">
                 		   <input type="number" class="form-control" placeholder="가격">
                  		</div>
						<div class="form-group">
                 		   <input type="number" class="form-control" placeholder="할인가">
                  		</div>
						<div class="form-group">
                 		   <textarea id="detail" class="form-control"></textarea>
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <input type="file" class="form-control">
                  		</div>
						<div class="form-group">
                 		   <button type="button" class="btn btn-dark">Dark</button>
                  		</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="/admin/inc/footer.jsp"%>
		<!-- Control Sidebar -->
		<%@ include file="/admin/inc/sidebar_right.jsp"%>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="/admin/inc/footer_link.jsp"%>
	<script type="text/javascript">
	$(function() {
		$("#detail").summernote({
			height : 200
		});
	});
	</script>
</body>
</html>
